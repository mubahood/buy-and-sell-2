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
