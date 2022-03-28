<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Product;
use App\Models\Profile;
use App\Models\User;
use App\Models\Utils;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ApiUsersController 
{
    public function index(Request $request)
    {
        $items = Administrator::paginate(10)->withQueryString()->items();
        return $items;
    }
    
    public function update(Request $request)
    {

        if (
            $request->email == null ||
            $request->name == null ||
            $request->user_id == null
        ) {
            return Utils::response([
                'status' => 0,
                'message' => "You must provide Name, email and user id.",
                'data' => null
            ]);
        }

        $user_id = (int) ($request->user_id ? $request->user_id : 0);
        $email = (String) ($request->email ? $request->email : "");
        $u = Administrator::find($user_id); 
        if($u == null){
            return Utils::response([
                'status' => 0,
                'message' => "Failed to find account with ID {$user_id}",
                'data' => null
            ]);
        }

        $_u = Administrator::where('email',$email)->get();
        if(isset($_u['0'])){
            if($_u['0']->id != $u->id){
                return Utils::response([
                    'status' => 0,
                    'message' => "Changes not saved because user with same email ({$user_id}) that you provided already exist.",
                    'data' => null
                ]);
            }
        }

        $u->email = $email;
        $u->email = $u->email;
        $u->username = $u->email;
        
        $u->name = (String) ($request->name ? $request->name : "");
        $u->username = (String) ($request->email ? $request->email : "");
        $u->company_name = (String) ($request->company_name ? $request->company_name : "");
        $u->phone_number = (String) ($request->phone_number ? $request->phone_number : "");
        $u->address = (String) ($request->address ? $request->address : "");
        $u->about = (String) ($request->about ? $request->about : "");
        $u->services = (String) ($request->services ? $request->services : "");
        $u->longitude = (String) ($request->longitude ? $request->longitude : "");
        $u->latitude = (String) ($request->latitude ? $request->latitude : "");
        $u->division = (String) ($request->division ? $request->division : "");
        $u->facebook = (String) ($request->facebook ? $request->facebook : "");
        $u->twitter = (String) ($request->twitter ? $request->twitter : "");
        $u->whatsapp = (String) ($request->whatsapp ? $request->whatsapp : "");
        $u->instagram = (String) ($request->instagram ? $request->instagram : "");
        $u->category_id = (String) ($request->category_id ? $request->category_id : "");
        $u->country_id = (String) ($request->country_id ? $request->country_id : "");
        $u->region = (String) ($request->region ? $request->region : "");
        $u->district = (String) ($request->district ? $request->district : "");
        $u->sub_county = (String) ($request->sub_county ? $request->sub_county : "");
        
        unset($u->password);
        unset($u->status_comment);
        unset($u->opening_hours);
        unset($u->remember_token);
        unset($u->cover_photo);
        unset($u->youtube);
        unset($u->last_seen);
        unset($u->status);
        unset($u->linkedin);

        $u->save();
        
        return Utils::response([
            'status' => 1,
            'message' => "Profile updated successfully.",
            'data' => $u
        ]); 

    }
    
    public function create_account(Request $request)
    {

        if (
            $request->email == null ||
            $request->name == null ||
            $request->password == null
        ) {
            return Utils::response([
                'status' => 0,
                'message' => "You must provide Name, email and password. {$request->name}",
                'data' => $request
            ]);
        }


        $u['name'] = $request->input("name");
        $u['username'] = $request->input("email").rand(10000,1000000);

        $old_user = Administrator::where('username', $u['username'])->first();
        if ($old_user) {
            return Utils::response([
                'status' => 0,
                'message' => "User with same email address already exist."
            ]);
        } 

        $u['password'] = Hash::make($request->input("password"));
        $user = Administrator::create($u);
        $_user = Administrator::find($user->id);

        return Utils::response([
            'status' => 1,
            'message' => "You must provide Name, email and password.",
            'data' => $_user
        ]); 

    }
}
