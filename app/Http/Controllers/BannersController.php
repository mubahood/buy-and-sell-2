<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Utils;
use Illuminate\Http\Request; 
class BannersController extends Controller
{
    public function index()
    {
        return  view('metro.dashboard.banners'); 
    }

    public function edit()
    {
        return  view('metro.dashboard.banners-create');
    } 
    public function create()
    {
        return  view('metro.dashboard.banners-create');
    } 
    

    public function store(Request $r)
    { 
        
        if (isset($_POST['edit'])) {

             
            $id = (int)($r->edit);
            if ($id == 0) {
                die("new");
            } else {
                $item = Banner::find($id);
                if ($item == null) {
                    dd("Item not found.");
                }

 
              

                $item->category_id = $r->parent; 
                $item->product_id = $r->parent;
                $item->name = $r->name;
                $item->sub_title = $r->description;
                $item->type = 'category';
    
                if (isset($_FILES['avatar'])) {
                    
                    $img = $_FILES['avatar'];
                    $raw_images = [];
                    $item->image = 'no_image.png';
                    $raw_images['name'][] = $img['name'];
                    $raw_images['type'][] = 'image/png';
                    $raw_images['tmp_name'][] = $img['tmp_name'];
                    $raw_images['error'][] = $img['error'];
                    $raw_images['size'][] = $img['size'];
    
                    $temp_img = Utils::upload_images($raw_images);

                    if ($temp_img != null) {
                        if (isset($temp_img[0])) {
                            $item->image = $temp_img[0]['src'];
                        }
                    }
                }

                $item->save();
            }

            return redirect('dashboard/banners');

        }else if (isset($_POST['delete'])) {
            $id = (int)($r->delete);
            $item = Banner::find($id);
            if ($item != null) {
                $item->delete();
                return true;
            }
            return 0;
        }
    }
}
