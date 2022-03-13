<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Category;
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

        
        print_r($_POST["Advert's_title"]);
        die();
        $raw_images = [];
        $images = [];
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

                    echo "<pre>";
                    print_r($uploaded_images);
                    die();


                }
            }
        }

        /*

        [upload_image_1] => Array
        I/flutter (15204):         (
        I/flutter (15204):             [name] => image_picker6417507787507506668.jpg.txt
        I/flutter (15204):             [type] => application/octet-stream
        I/flutter (15204):             [tmp_name] => /tmp/phpNuV8Fd
        I/flutter (15204):             [error] => 0
        I/flutter (15204):             [size] => 199947
        I/flutter (15204):         )



                (
            [name] => Array
                (
                    [0] => course (3).png
                    [1] => course (2).png
                )

            [type] => Array
                (
                    [0] => image/png
                    [1] => image/png
                )

            [tmp_name] => Array
                (
                    [0] => /tmp/phpIh5Bw2
                    [1] => /tmp/phpfZvIeB
                )

            [error] => Array
                (
                    [0] => 0
                    [1] => 0
                )

            [size] => Array
                (
                    [0] => 560335
                    [1] => 200914
                )

        )


        */


        die("Time to create");
    }
    public function index(Request $request)
    {
        $per_page = (int) ($request->per_page ? $request->per_page : 15);

        $items = Product::paginate($per_page)->withQueryString()->items();
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
