<?php

namespace App\Models;

use Hamcrest\Arrays\IsArray;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use PhpParser\Node\Stmt\Else_;
use Zebra_Image;

use function PHPUnit\Framework\fileExists;

class Utils
{
    public static function get_locations()
    {
        $locations = [];
 
        $countries = Country::all();


        foreach ($countries as $key => $value) {
            $value->parent_id = 0;
            $value->type = 'main_location';
            $locations[] = $value;
        }

        $cities = City::all();


        foreach ($cities as $key => $value) {
            $value->parent_id = $value->country_id;
            $value->type = 'sub_location';
            $locations[] = $value;
        }


        return $locations;    
	
    }
    public static function response($data = [])
    {
        $resp['status'] = "1";
        $resp['message'] = "Success";
        $resp['data'] = null;
        if (isset($data['status'])) {
            $resp['status'] = $data['status']."";
        }
        if (isset($data['message'])) {
            $resp['message'] = $data['message'];
        }
        if (isset($data['data'])) {
            $resp['data'] = $data['data'];
        }
        return $resp;
    }
    
    public static function tell_status($status)
    {
        if (!$status)
            return '<span class="badge badge-info">Not complete</span>';
        if ($status == 0)
            return '<span class="badge badge-info">Not complete</span>';
        if ($status == 1)
            return '<span class="badge badge-primary">Accepted</span>';
        if ($status == 2)
            return '<span class="badge badge-warning">Halted</span>';
        if ($status == 3)
            return '<span class="badge badge-danger">Rejected</span>';
        if ($status == 4)
            return '<span class="badge badge-danger">Pending for verification</span>';
        else
            return '<span class="badge badge-danger">Rejected</span>';
    }

    public static function show_response($status = 0, $code = 0, $body = "")
    {
        $d['status'] = $status;
        $d['code'] = $code;
        $d['body'] = $body;
        print_r(json_encode($d));
        die();
    }
    public static function get_chat_threads($user_id)
    {

        $threads = Chat::where(
            "sender",
            $user_id
        )
            ->orWhere('receiver', $user_id)
            ->orderByDesc('id')
            ->get();

        $done_ids = array();
        $ready_threads = array();
        foreach ($threads as $key => $value) {
            if (in_array($value->thread, $done_ids)) {
                continue;
            }
            $done_ids[] = $value->thread;
            $ready_threads[] = $value;
        }
        return $ready_threads;
    }


    public static function get_chat_thread($sender, $receiver, $product)
    {
        if ($sender == $receiver) {
            return null;
        }
        $thread = $sender . "-" . $receiver . "-" . $product;

        $results = DB::select(
            'select * from chats where 
                (sender = :sender AND
                receiver = :receiver AND
                product_id = :product)
                OR 
                (sender = :_receiver AND
                receiver = :_sender AND
                product_id = :_product) 
                ',
            [
                'sender' => $sender,
                'receiver' => $receiver,
                'product' => $product,
                '_sender' => $sender,
                '_receiver' => $receiver,
                '_product' => $product
            ]
        );
        if (
            $results != null &&
            !empty($results)
        ) {
            $thread = $results[0]->thread;
        }

        return $thread;
    }

    public static function get_file_url($link)
    {
        $link = str_replace("public/", "", $link);
        $link = str_replace("public", "", $link);
        $link = "storage/" . $link;
        return $link;
    }

    public static function make_slug($str)
    {
        $slug =  strtolower(Str::slug($str, "-"));

        if (
            (!empty(Product::where("slug", $slug)->First())) ||
            (!empty(Profile::where("username", $slug)->First()))
        ) {
            $slug .= rand(100, 1000);
        }

        return $slug;
    }
    public static function upload_images($files)
    {


        if ($files == null || empty($files)) {
            return [];
        }
        if (!isset($files['name'])) {
            return [];
        }
        if (!is_array($files['name'])) {
            return [];
        }

        $uploaded_images = array();
        if (isset($files['name'])) {
            for ($i = 0; $i < count($files['name']); $i++) {
                if (
                    isset($files['name'][$i]) &&
                    isset($files['type'][$i]) &&
                    isset($files['tmp_name'][$i]) &&
                    isset($files['error'][$i]) &&
                    isset($files['size'][$i])
                ) {
                    $img['name'] = $files['name'][$i];
                    $img['type'] = $files['type'][$i];
                    $img['tmp_name'] = $files['tmp_name'][$i];
                    $img['error'] = $files['error'][$i];
                    $img['size'] = $files['size'][$i];


                    $path = Storage::putFile('/public/storage', $img['tmp_name']); 
  
                    $path_not_optimized =  "./" . $path;
                    $file_name = str_replace("public/storage/", "", $path);
                    $file_name = str_replace("public/", "", $file_name);
                    $file_name = str_replace("storage/", "", $file_name);
                    $file_name = str_replace("storage/", "", $file_name);
                    $file_name = str_replace("public", "", $file_name);
                    $file_name = str_replace("/", "", $file_name);

                    $path_optimized = "./public/storage/thumb_" . $file_name;
                    
                    $thumbnail = Utils::create_thumbail(
                        array(
                            "source" => $path_not_optimized,
                            "target" => $path_optimized,
                        )
                    );
                    


                    if (strlen($thumbnail) > 3) {
                        $thumbnail = str_replace("public/storage/", "", $thumbnail);
                        $thumbnail = str_replace("storage/", "", $thumbnail);
                        $thumbnail = str_replace("/storage", "", $thumbnail);
                        $thumbnail = str_replace("storage", "", $thumbnail);
                        $thumbnail = str_replace("public/", "", $thumbnail);
                        $thumbnail = str_replace("public", "", $thumbnail);
                        $thumbnail = str_replace("./", "", $thumbnail); 
                    } else {
                        $thumbnail = $file_name;
                    } 
                    $ready_image['src'] = $file_name;
                    $ready_image['thumbnail'] = $thumbnail;

                    $ready_image['user_id'] = Auth::id();
                    if (!$ready_image['user_id']) {
                        $ready_image['user_id'] = 1;
                    }
                    
                    $_ready_image = new Image($ready_image);
                    $_ready_image->save();
                    $uploaded_images[] = $ready_image;
                }
            }
        } 
          
        return $uploaded_images;
    }

    public static function create_thumbail($params = array())
    {
        if (
            !isset($params['source']) ||
            !isset($params['target'])
        ) {
            return [];
        }
 
        $image = new Zebra_Image();

        $image->auto_handle_exif_orientation = false;
        $image->source_path = "".$params['source'];
        $image->target_path = "".$params['target'];
        

         
 
 
        $image->jpeg_quality = 100;
        if (isset($params['quality'])) {
            $image->jpeg_quality = $params['quality'];
        }

        $image->preserve_aspect_ratio = true;
        $image->enlarge_smaller_images = true;
        $image->preserve_time = true;
        $image->handle_exif_orientation_tag = true;

        $width = 380;
        $heigt = 220;
        if (isset($params['width'])) {
            $width = $params['width'];
        }
        if (isset($params['heigt'])) {
            $width = $params['heigt'];
        }
 
        if (!$image->resize($width, $heigt, ZEBRA_IMAGE_CROP_CENTER)) {
          
            return $image->source_path;
        } else { 
            
            return $image->target_path;
        }
    }
}
