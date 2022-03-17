<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Category;
use App\Models\City;
use App\Models\Country;
use App\Models\Product;
use App\Models\Utils;
use Illuminate\Http\Request;

class ApiProductsController
{
    public function upload(Request $request)
    {
        return view('dashboard.upload');
    }

    public function create(Request $request)
    {

        return $_FILES;

        if (!isset($_POST['user_id'])) {
            return Utils::response(['message' => 'User ID is required.', 'status' => 0]);
        }

        $p['sub_category_id'] = 1;
        $p['user_id'] = trim($_POST['user_id']);
        $p['category_id'] = 1;
        $p['price'] = 1;
        $p['country_id'] = 1;
        $p['quantity'] = 1;
        $p['status'] = 1;
        $p['fixed_price'] = true;
        $p['city_id'] = 1;
        $p['name'] = trim($_POST["Advert's_title"]);
        $p['slug'] = trim($_POST["Advert's_title"]);
        $p['price'] = trim($_POST["Product_price"]);
        $p['description'] = trim($_POST["Product_description"]);
        $p['attributes'] = "[]";




        if (isset($_POST["Category"])) {
            if (strlen($_POST["Category"]) > 2) {
                $cat = Category::where('name', trim($_POST["Category"]))->first();
                if ($cat != null) {
                    $p['category_id'] = $cat->id;
                }
            }
        }

        if (isset($_POST["Sub_Category"])) {
            if (strlen($_POST["Sub_Category"]) > 2) {
                $cat = Category::where('name', trim($_POST["Sub_Category"]))->first();
                if ($cat != null) {
                    $p['sub_category_id'] = $cat->id;
                }
            }
        }

        if (isset($_POST["District"])) {
            if (strlen($_POST["District"]) > 2) {
                $cat = Country::where('name', trim($_POST["District"]))->first();
                if ($cat != null) {
                    $p['country_id'] = $cat->id;
                }
            }
        }

        if (isset($_POST["Sub_county"])) {
            if (strlen($_POST["Sub_county"]) > 2) {
                $cat = City::where('name', trim($_POST["Sub_county"]))->first();
                if ($cat != null) {
                    $p['city_id'] = $cat->id;
                }
            }
        }


        $images = [];
        $uploaded_images = [];
        if (isset($_FILES)) {
            if ($_FILES != null) {
                if (count($_FILES) > 0) {

                    foreach ($_FILES as $img) {
                        if (
                            (isset($img['name'])) &&
                            (isset($img['type'])) &&
                            (isset($img['tmp_name'])) &&
                            (isset($img['error'])) &&
                            (isset($img['size']))
                        ) {
                            if (
                                (strlen($img['name']) > 2) &&
                                (strlen($img['type']) > 2) &&
                                (strlen($img['tmp_name']) > 2) &&
                                (strlen($img['size']) > 0) &&
                                ($img['error'] == 0)
                            ) {
                                $raw_images['name'][] = $img['name'];
                                $raw_images['type'][] = 'image/png';
                                $raw_images['tmp_name'][] = $img['tmp_name'];
                                $raw_images['error'][] = $img['error'];
                                $raw_images['size'][] = $img['size'];
                            }
                        }
                    }

                    $images['images'] = $raw_images;

                    $uploaded_images = Utils::upload_images($images['images']);
 
                }
            }
        }





 
        if($uploaded_images!= null && count($uploaded_images)>0 ){
            $p['thumbnail'] = json_encode($uploaded_images[0]);
            $p['images'] = json_encode($uploaded_images);
        }


        $pro = Product::create($p);
        return Utils::response(['message' => 'Product uploaded successfully.', 'status' => 1, 'data' => $pro]);
 
    }
    public function index(Request $request)
    {
        $per_page = (int) ($request->per_page ? $request->per_page : 15);
        $user_id = (int) ($request->user_id ? $request->user_id : 0);

        if($user_id>0){
            $items = Product::where('user_id',$user_id)->paginate($per_page)->withQueryString()->items();
        }else{
            $items = Product::paginate($per_page)->withQueryString()->items();
        }

        return $items;
    }

    public function banners(Request $request)
    {
        $items = Banner::paginate(100)->withQueryString()->items();
        return $items;
    }

    public function locations(Request $request)
    {
        return Utils::get_locations();
    }

    public function categories(Request $request)
    {
        $per_page = (int) ($request->per_page ? $request->per_page : 1000);
        $items = Category::paginate($per_page)->withQueryString()->items();

        $_items = [];
        foreach ($items as $key => $value) {
            $_attributes = $value->attributes;
            $attributes = [];
            foreach ($_attributes as $_key => $_value) {
                $attributes[] = json_encode($_value);
            }
            $value->attributes = null;
            unset($value->attributes);
            $value->attributes =  $attributes;
            $_items[] = $value;
        }


        return $items;
    }
}
