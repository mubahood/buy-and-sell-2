<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Category;
use App\Models\City;
use App\Models\Country;
use App\Models\Farm;
use App\Models\FinancialRecord;
use App\Models\Garden;
use App\Models\GardenActivity;
use App\Models\GardenProductionRecord;
use App\Models\Image;
use App\Models\Location;
use App\Models\PestCase;
use App\Models\Post;
use App\Models\PostCategory;
use App\Models\PostComment;
use App\Models\Product;
use App\Models\Question;
use App\Models\Utils;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ApiProductsController
{



    public function workers(Request $r)
    {
        if (!isset($_GET['owner_id'])) {
            return [];
        }
        $administrator_id = ((int)($_GET['owner_id']));
        return Administrator::where(['owner_id' => $administrator_id])->get();
    }

    public function financial_records_create(Request $r)
    {
        if (!isset($_POST['garden_id'])) {
            return Utils::response(['message' => 'Garden is required.', 'status' => 0]);
        }
        if (!isset($_POST['created_by'])) {
            return Utils::response(['message' => 'Created by is required.', 'status' => 0]);
        }
        if (!isset($_POST['amount'])) {
            return Utils::response(['message' => 'amount by is required.', 'status' => 0]);
        }

        $f = new FinancialRecord();
        $f->garden_id = ((int)($r->garden_id));
        $f->created_by = ((int)($r->created_by));
        $f->amount = ((int)($r->amount));
        $f->description = $r->description;

        if ($f->save()) {
            return Utils::response(['message' => 'Financial record created successfully.', 'status' => 1]);
        } else {
            return Utils::response(['message' => 'Failed to create financial record. Please try again.', 'status' => 0]);
        }
    }


    public function workers_create(Request $r)
    {

        if (!isset($_POST['owner_id'])) {
            return Utils::response(['message' => 'Owner is required.', 'status' => 0]);
        }

        $owner_id = ((int)($_POST['owner_id']));
        $phone_number = ((string)($_POST['phone_number']));

        $items = Administrator::where([
            'phone_number' => $phone_number,
        ])->get();

        if (count($items) > 0) {
            return Utils::response(['message' => 'User with same phone number already exist.', 'status' => 0]);
        }

        $items = Administrator::where([
            'email' => $phone_number,
        ])->get();

        if (count($items) > 0) {
            return Utils::response(['message' => 'User with same phone number already exist.', 'status' => 0]);
        }

        $items = Administrator::where([
            'username' => $phone_number,
        ])->get();

        if (count($items) > 0) {
            return Utils::response(['message' => 'User with same phone number already exist.', 'status' => 0]);
        }


        $user = new Administrator();
        $user->owner_id = $owner_id;
        $user->avatar = 'no_image.jpg';
        $user->user_type = 'worker';
        $user->phone_number = $phone_number;
        $user->username = $phone_number;
        $user->email = $phone_number;
        $user->about = ((string)($r->about));
        $user->name = ((string)($r->name));
        $user->password = Hash::make(trim($r->password));

        $images = [];
        $uploaded_images = [];
        if (isset($_FILES)) {
            if ($_FILES != null) {
                if (count($_FILES) > 0) {
                    $raw_images = [];
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

        if ($uploaded_images != null && count($uploaded_images) > 0) {
            $user->avatar = json_encode($uploaded_images);
        }

        if ($user->save()) {
            return Utils::response(['message' => 'Case created successfully.', 'status' => 1]);
        } else {
            return Utils::response(['message' => 'Failed to create garden. Please try again.', 'status' => 0]);
        }
    }




    public function garden_production_record_create(Request $r)
    {

        if (!isset($_POST['garden_id'])) {
            return Utils::response(['message' => 'Garden ID is required.', 'status' => 0]);
        }

        if (!isset($_POST['created_by_id'])) {
            return Utils::response(['message' => 'Created by id is required.', 'status' => 0]);
        }

        $garden_id = ((int)($_POST['garden_id']));
        $g = Garden::find($garden_id);

        if ($g == null) {
            return Utils::response(['message' => 'Garden not #' . $garden_id . ' found.', 'status' => 0]);
        }

        $new_record = new GardenProductionRecord();
        $new_record->created_by_id = ((int)($r->created_by_id));
        $new_record->administrator_id = $g->administrator_id;
        $new_record->garden_id = $g->id;
        $new_record->description = $r->description;
        $new_record->images = '[]';


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

        if ($uploaded_images != null && count($uploaded_images) > 0) {
            $new_record->images = json_encode($uploaded_images);
        }

        if ($new_record->save()) {

            if (
                isset($r->activity_id) &&
                isset($r->done_status)

            ) {
                $activity_id = ((int)($r->activity_id));
                if ($activity_id > 0) {
                    $act = GardenActivity::find($activity_id);
                    if ($act != null) {
                        $act->is_done = true;
                        $act->done_status = $r->done_status;
                        $act->done_by = $new_record->created_by_id;
                        $act->garden_production_record_id = $new_record->id;
                        $act->save();
                    }
                }
            }
            return Utils::response(['message' => 'Production record created successfully.', 'status' => 1]);
        } else {
            return Utils::response(['message' => 'Failed to create Production recoed. Please try again.', 'status' => 0]);
        }
    }




    public function pest_cases_create(Request $r)
    {

        if (!isset($_POST['garden_id'])) {
            return Utils::response(['message' => 'Garden ID is required.', 'status' => 0]);
        }

        $garden_id = ((int)($_POST['garden_id']));
        $g = Garden::find($garden_id);

        if ($g == null) {
            return Utils::response(['message' => 'Garden not found.', 'status' => 0]);
        }

        $items = PestCase::where([
            'garden_id' => $garden_id,
            'pest_id' => ((int)($r->pest_id)),
        ])->get();


        if (count($items) > 0) {
            return Utils::response(['message' => 'You have already reported this pest case on this garden.', 'status' => 0]);
        }


        $case = new PestCase();
        $case->garden_id = $g->id;
        $case->administrator_id = $g->administrator_id;
        $case->location_id = $g->location_id;
        $case->pest_id = ((int)($r->pest_id));
        $case->description = $r->description;
        $case->images = '';

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

        if ($uploaded_images != null && count($uploaded_images) > 0) {
            $case->images = json_encode($uploaded_images);
        }

        if ($case->save()) {
            return Utils::response(['message' => 'Case created successfully.', 'status' => 1]);
        } else {
            return Utils::response(['message' => 'Failed to create garden. Please try again.', 'status' => 0]);
        }
    }





    public function question_create(Request $r)
    {

        if (!isset($r->user_id)) {
            return Utils::response(['message' => 'User ID is required.', 'status' => 0]);
        }

        if (!isset($_POST['category_id'])) {
            return Utils::response(['message' => 'Category is required.', 'status' => 0]);
        }


        $q = new Question();
        $q->category_id = ((int)($r->category_id));
        $q->administrator_id = ((int)($r->user_id));
        $q->answered_by = 0;
        $q->is_answered = 0;
        $q->question = $r->question;
        $q->answer = '';
        $q->answer_images = '[]';
        $q->question_images = '[]';


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

        if ($uploaded_images != null && count($uploaded_images) > 0) {
            $q->question_images = json_encode($uploaded_images);
        }

        if ($q->save()) {
            return Utils::response(['message' => 'Qustion submitted successfully.', 'status' => 1]);
        } else {
            return Utils::response(['message' => 'Failed to create garden. Please try again.', 'status' => 0]);
        }
    }




    public function get_financial_records(Request $r)
    {
        if (!isset($_GET['user_id'])) {
            return [];
        }
        $administrator_id = ((int)($_GET['user_id']));
        return FinancialRecord::where(['administrator_id' => $administrator_id])
            ->orWhere(['created_by' => $administrator_id])
            ->get();
    }



    public function get_garden_production_record(Request $r)
    {
        if (!isset($_GET['user_id'])) {
            return [];
        }
        $administrator_id = ((int)($_GET['user_id']));
        return GardenProductionRecord::where(['administrator_id' => $administrator_id])
            ->orWhere(['created_by_id' => $administrator_id])
            ->get();
    }


    public function garden_activities(Request $r)
    {
        if (!isset($_GET['user_id'])) {
            return [];
        }
        $administrator_id = ((int)($_GET['user_id']));
        return GardenActivity::where(['administrator_id' => $administrator_id])
            ->orWhere(['person_responsible' => $administrator_id])
            ->get();
    }

    public function gardens(Request $r)
    {
        if (!isset($_GET['user_id'])) {
            return [];
        }
        $administrator_id = ((int)($_GET['user_id']));
        return Garden::where(['administrator_id' => $administrator_id])->get();
    }

    public function farms(Farm $r)
    {
        if (!isset($_GET['user_id'])) {
            return [];
        }
        $administrator_id = ((int)($_GET['user_id']));
        return Farm::where(['administrator_id' => $administrator_id])->get();
    }

    public function garden_activities_delete(Request $r)
    {
        $id = ((int)($r->id));
        $item = GardenActivity::find($id);
        if ($item != null) {
            $item->delete();
        } else {
            return Utils::response(['message' => "Activity {$id} not found.", 'status' => 0]);
        }
        return Utils::response(['message' => 'Activity deleted.', 'status' => 1]);
    }
    public function garden_activities_create(Request $r)
    {
        if (!isset($_POST['administrator_id'])) {
            return Utils::response(['message' => 'User ID is required.', 'status' => 0]);
        }
        $garden_id = ((int)($_POST['garden_id']));
        $g = Garden::find($garden_id);

        if ($g == null) {
            return Utils::response(['message' => 'Garden #' . $garden_id . ' not found.', 'status' => 0]);
        }

        $act = new GardenActivity();
        $act->name = $r->name;
        $act->due_date = $r->due_date;
        $act->details = $r->details;
        $act->administrator_id = $g->administrator_id;
        $act->person_responsible = ((int)($r->person_responsible));
        //$g_activity->person_responsible = $g->;
        $act->done_by = 0;
        $act->is_generated = 0;
        $act->is_done = 0;
        $act->position = 0;
        $act->garden_id = $g->id;
        $act->done_status = 0;
        $act->done_details = "";
        $act->done_images = "";

        if ($act->save()) {
            return Utils::response(['message' => 'Activity created successfully.', 'status' => 1]);
        } else {
            return Utils::response(['message' => 'Failed to create garden activity. Please try again.', 'status' => 0]);
        }
    }

    public function create_garden(Request $r)
    {

        if (!isset($_POST['administrator_id'])) {
            return Utils::response(['message' => 'User ID is required.', 'status' => 0]);
        }

        $g = new Garden();
        $g->administrator_id = $r->administrator_id;
        $g->name = $r->name;
        $g->image = '';
        $g->images = '';
        $g->plant_date = $r->plant_date;
        $g->harvest_date = '';
        $g->size = $r->size;
        $g->details = $r->details;
        $g->crop_category_id = $r->crop_category_id;
        $g->location_id = $r->location_id;
        $g->farm_id = $r->farm_id;

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

        if ($uploaded_images != null && count($uploaded_images) > 0) {
            $g->image = json_encode($uploaded_images[0]);
            $g->images = json_encode($uploaded_images);
        }


        if ($g->save()) {
            return Utils::response(['message' => 'Enterprise created successfully.', 'status' => 1]);
        } else {
            return Utils::response(['message' => 'Failed to create enterprise. Please try again.', 'status' => 0]);
        }
    }

    public function create_farm(Request $r)
    {

        if (!isset($_POST['administrator_id'])) {
            return Utils::response(['message' => 'User ID is required.', 'status' => 0]);
        }

        $g = new Farm();
        $g->administrator_id = $r->administrator_id;
        $g->name = $r->name;
        $g->details = $r->details;
        $g->location_id = $r->location_id;
        $g->latitude = $r->latitude;
        $g->longitude = $r->longitude;


        if ($g->save()) {
            return Utils::response(['message' => 'Farm created successfully.', 'status' => 1]);
        } else {
            return Utils::response(['message' => 'Failed to create farm. Please try again.', 'status' => 0]);
        }
    }

    public function upload_temp_file(Request $request)
    {
        if (
            isset($_FILES['file']) &&
            isset($_GET['user_id']) &&
            isset($_FILES['file']['error']) &&
            ($_FILES['file']['error'] == 0)
        ) {


            $img = $_FILES['file'];
            $raw_images = [];
            $raw_images['name'][] = $img['name'];
            $raw_images['type'][] = 'image/png';
            $raw_images['tmp_name'][] = $img['tmp_name'];
            $raw_images['error'][] = $img['error'];
            $raw_images['size'][] = $img['size'];

            $data = Utils::upload_images($raw_images);
            $user_id = $_GET['user_id'];
            if (
                isset($data[0]) &&
                isset($data[0]['src']) &&
                isset($data[0]['thumbnail']) &&
                isset($data[0]['user_id'])
            ) {
                $img = $data[0];
                $new_img = new Image();
                $new_img->src = $img['src'];
                $new_img->user_id = $user_id;
                $new_img->thumbnail = $img['thumbnail'];
                $new_img->name = 'temp';
                $new_img->save();
            }
            die("1");
        }
        die("0");
    }




    public function process_pending_images(Request $request)
    {
        $user_id  = ((int)($_GET['user_id']));
        Utils::process_pending_images($user_id);
        return 1;
    }
    public function upload_temp_image(Request $request)
    {
        if (
            isset($_FILES['file']) &&
            isset($_GET['user_id']) &&
            isset($_FILES['file']['error']) &&
            ($_FILES['file']['error'] == 0)
        ) {


            ini_set('max_execution_time', -1); //unlimit
            $img = $_FILES['file'];
            $user_id  = ((int)($_GET['user_id']));


            $ext = pathinfo($img['name'], PATHINFO_EXTENSION);
            $file_name = time() . "-" . Utils::make_slug($img['name']) . "." . $ext;
            $path = 'public/storage/' . $file_name;
            $res = move_uploaded_file($img['tmp_name'], $path);
            if (!$res) {
                return Utils::response(['message' => 'Failed to upload file.', 'status' => 0, 'data' => Utils::get_image_processing($user_id)]);
            }

            $new_img = new Image();
            $new_img->src = $path;
            $new_img->user_id = $user_id;
            $new_img->thumbnail = '';
            $new_img->name = 'processing';
            $new_img->save();

            Utils::do_background_process_pending_images($user_id);
            return Utils::response(['message' => 'Uploaded file successfully.', 'status' => 1, 'data' => Utils::get_image_processing($user_id)]);
        }


        return Utils::response(['message' => 'All parameters were not set.', 'status' => 0, 'data' => null]);
    }


    public function delete(Request $request)
    {
        $id = (int) ($request->id ? $request->id : 0);
        if ($id < 1) {
            return Utils::response(['message' => 'Poduct ID is required.', 'status' => 0]);
        }

        $pro = Product::find($id);

        if ($pro == null) {
            return Utils::response(['message' => "Poduct with ID  {$id} no found.", 'status' => 0]);
        }
        $pro->delete();

        return Utils::response(['message' => "Poduct  #{$id} deleted successfully.", 'status' => 1]);
    }
    public function upload(Request $request)
    {
        return view('dashboard.upload');
    }

    public function delete_post(Request $request)
    {
        return "delete_post";
    }

    public function create_post(Request $request)
    {
        if (!isset($_POST['user_id'])) {
            return Utils::response(['message' => 'User ID is required.', 'status' => 0]);
        }
        $p = new Post();
        $p->administrator_id = ((int)($_POST['user_id']));
        $p->posted_by = ((int)($_POST['user_id']));
        $p->post_category_id = ((int)($_POST['post_category_id']));
        if ($p->post_category_id < 1) {
            $p->post_category_id = 1;
        }
        $p->views = 0;
        $p->images = "";
        $p->audio = "";
        $p->comments = 0;
        $p->text = $_POST['text'];

        $images = [];
        $uploaded_images = [];
        if (isset($_FILES)) {
            if ($_FILES != null) {
                if (count($_FILES) > 0) {

                    if (isset($_FILES['audio'])) {
                        if ($_FILES['audio'] != null) {
                            if (isset($_FILES['audio']['tmp_name'])) {
                                $p->audio = Utils::upload_file($_FILES['audio']);
                            };
                        }
                        unset($_FILES['audio']);
                    }

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

                                $name = trim($img['name']);
                                if (str_contains($name, 'image_')) {
                                    $raw_images['name'][] = $img['name'];
                                    $raw_images['type'][] = 'image/png';
                                    $raw_images['tmp_name'][] = $img['tmp_name'];
                                    $raw_images['error'][] = $img['error'];
                                    $raw_images['size'][] = $img['size'];
                                }
                            }
                        }
                    }

                    if (isset($raw_images)) {
                        $images['images'] = $raw_images;
                        $uploaded_images = Utils::upload_images($images['images']);
                    }
                }
            }
        }



        if ($uploaded_images != null && count($uploaded_images) > 0) {
            $p->thumnnail = json_encode($uploaded_images[0]);
            $p->images = json_encode($uploaded_images);
        }



        if ($p->save()) {
            return Utils::response(['message' => 'Post create successfully.', 'status' => 1, 'data' => $p]);
        } else {
            return Utils::response(['message' => 'Failed to create post. Please try again.', 'status' => 0, 'data' => $p]);
        }
        return 'create_post';
    }


    public function create(Request $request)
    {

        Utils::process_pending_images(1); 
        die("done");
        if (!isset($_POST['user_id'])) {
            return Utils::response(['message' => 'User ID is required.', 'status' => 0]);
        }

        $user_id = ((int)($_POST['user_id']));
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
        
        Utils::process_pending_images($user_id);
        $images = Utils::get_image_processing($user_id); 
        if(!empty($images)){
            $p['thumbnail'] = json_encode($images[0]);
        }
        $p['images'] = json_encode($images);
        foreach ($images as $img) {
            $img->name = "";
            $img->save();
        }
         

        $_pro = Product::create($p);
        $pro = Product::find($_pro->id);
        return Utils::response(['message' => 'Product uploaded successfully.', 'status' => 1, 'data' => $pro]);
    }


    public function post_categories(Request $request)
    {
        $per_page = (int) ($request->per_page ? $request->per_page : 15);
        $items = PostCategory::paginate($per_page)->withQueryString()->items();

        return $items;
    }


    public function post_comments(Request $request)
    {
        $per_page = 1000;
        $post_id = (int) ($request->per_page ? $request->post_id : 0);
        $items = PostComment::paginate($per_page)->withQueryString()->items();

        return $items;
    }


    public function index(Request $request)
    {
        $per_page = (int) ($request->per_page ? $request->per_page : 200);
        $user_id = (int) ($request->user_id ? $request->user_id : 0);
        $s = trim((string) ($request->s ? $request->s : ""));
        $cat_id = (int) ($request->cat_id ? $request->cat_id : 0);


        if ($cat_id) {
            $items = Product::where('category_id', $cat_id)
                ->whereOr('sub_category_id', $cat_id)
                ->orderBy('name', 'Asc')->paginate($per_page)->withQueryString()->items();
        } else if (!empty($s)) {
            $items = Product::where('name', 'like', "%" . $s . "%")->orderBy('name', 'Asc')->paginate($per_page)->withQueryString()->items();
        } else if ($user_id > 0) {
            $items = Product::where('user_id', $user_id)->orderBy('id', 'DESC')->paginate($per_page)->withQueryString()->items();
        } else {
            $items = Product::where([])->orderBy('id', 'DESC')->paginate($per_page)->withQueryString()->items();
            //$items = Product::paginate($per_page)->orderBy('id', 'DESC')->withQueryString()->items();
        }

        return $items;
    }


    public function posts(Request $request)
    {
        // $p = new Post();
        // $p->administrator_id = 1;
        // $p->post_category_id = 1;
        // $p->posted_by = 1;
        // $p->views = 5;
        // $p->comments = 2;
        // $p->text = "Another Simple post title";
        // $p->thumnnail = "";
        // $p->images = "";
        // $p->audio = "";
        // $p->save();

        // die();


        $per_page = (int) ($request->per_page ? $request->per_page : 15);
        $user_id = (int) ($request->user_id ? $request->user_id : 0);
        if ($user_id > 0) {
            $items = Post::where('administrator_id', $user_id)->paginate($per_page)->withQueryString()->items();
        } else {
            $items = Post::paginate($per_page)->withQueryString()->items();
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
        return Location::all();
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
