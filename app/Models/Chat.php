<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
    use HasFactory;
    protected $fillable = [
        'thread',
        'sender',
        'receiver',
        'product_id',
        'seen',
        'received',
        'body'
    ];

    public function getSenderNameAttribute($value)
    {
        $s =  Administrator::find($this->sender);
        if ($s == null) {
            return "User $this->sender";
        }else{
            return $s->name;
        }
    }

    public function getReceiverNameAttribute($value)
    {
        $s =  Administrator::find($this->receiver);
        if ($s == null) {
            return "User {$this->receiver}";
        }else{
            return $s->name;
        }  
    }


    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->diffForHumans();
    }

    public function getProductNameAttribute($value)
    {
        $p =  Product::find($this->product_id);
        if ($p == null) {
            return "Product {$this->product_id}";
        }else{
            return $p->name;
        } 
    }

    public function getProductPicAttribute($value)
    {
        $p =  Product::find($this->product_id);
        if ($p == null) {
            return "";
        }else{
            return $p->thumbnail;
        } 
    }
 
    public function _sender()
    {
        return $this->belongsTo(User::class,"sender");
    }   

    public function product()
    {
        return $this->belongsTo(Product::class);
    }   
}
