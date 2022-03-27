<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Category;
use App\Models\Chat;
use App\Models\City;
use App\Models\Country;
use App\Models\Post;
use App\Models\PostCategory;
use App\Models\Product;
use App\Models\Utils;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ApiChatsController
{

 

    public function send_message(Request $request)
    {

        $sender = 0;
        $receiver = 0;
        $product_id = 0;
        if (
            (isset($_POST['sender'])) &&
            (isset($_POST['receiver'])) &&
            (isset($_POST['product_id']))
        ) {
            $product_id = ((int)($_POST['product_id']));
            $receiver = ((int)($_POST['receiver']));
            $sender = ((int)($_POST['sender']));
        }

        if (
            ($product_id < 1) ||
            ($receiver < 1) ||
            ($sender < 1)
        ) {
            return Utils::response(['message' => 'Sender or receiver was not set.', 'status' => 0]);
        }


        $msg_resp = Utils::send_message($_POST);
        if ($msg_resp != null) {
            return Utils::response(['message' => $msg_resp, 'status' => 0]);
        }

        return Utils::response(['message' => "Sent successfully", 'status' => 1]);
    }

    public function index(Request $request)
    {
        $per_page = 1000;
        $thread = (String) ($request->thread ? $request->thread : "");
        $user_id = (String) ($request->user_id ? $request->user_id : "");
        $unread = (String) ($request->user_id ? $request->unread : "");
        $thread = trim($thread);
        $unread = trim($unread);
        $received = false;
        if($unread != "1"){
            $received = false;
        }else{
            $received = true;
        }
        $user_id = trim($user_id);
        if (strlen($thread) < 1) {
            return [];
        }
        $_items = Chat::where([
            'thread' => $thread,
            'received' => $received,
        ])->paginate($per_page)->withQueryString()->items();

        $items = [];
        foreach ($_items as $key => $value) {
            $value->file = "0";
            


            if($value->receiver == $user_id){
                $value->seen = 1;
                $value->received = 1;
                $value->update();
            }

            if($received == 1){
                if($value->receiver == $user_id){
                    $items[] = $value;
                }
            }else{
                $items[] = $value;
            }
        }
        return $items;
    }

    public function threads(Request $request)
    {
        $user_id = (int) ($request->user_id ? $request->user_id : 0);
        if ($user_id < 0) {
            return [];
        }
        $chats = [];
        $threads = Chat::where('sender', $user_id)
            ->orWhere('receiver', $user_id)
            ->distinct()->get(['thread']);

        foreach ($threads as $key => $value) {
            $c = Chat::where(['thread' => $value->thread])
                ->orderBy('id', 'desc')
                ->first();

            $c->unread_count = Chat::where('thread', $value->thread)
                ->where('sender', '!=', $user_id)
                ->where('seen', false)
                ->count();
            $c->file = "1";
            $chats[] = $c;
        }
        return $chats;
    }
}
