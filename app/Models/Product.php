<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;
use phpDocumentor\Reflection\Types\This;
use Psy\CodeCleaner\ValidConstructorPass;

use function PHPUnit\Framework\fileExists;

class Product extends Model
{
    use HasFactory;

 


    public function getCityIdAttribute($value)
    {
        $city_id = (int)($value);

        $city = City::find($city_id);
        if($city == null){
            return "-";
        }
        return $city->name;
    }

    public function getSubCategoryIdAttribute($value)
    {
        $id = (int)($value);

        $cat = Category::find($id);
        if($cat == null){
            return "-";
        }
        return $cat->name;
    }

    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->diffForHumans();
    }
 

    public function getQuantityAttribute($value)
    {
        return (int)($value);
    }

    public function getFixedPriceAttribute($value)
    {
        if ($value == null) {
            return false;
        }
        if ($value == false) {
            return false;
        }
        return true;
    }


    public static function boot()
    {
        parent::boot();

        self::creating(function($p){
            $p->slug = Utils::make_slug($p->name);
            $p->status = 1;


            return $p;
        });
     


        static::deleting(function ($model) {

            $thumbs = json_decode($model->images);
            if ($thumbs != null) {
                foreach ($thumbs as $key => $value) {
                    if (isset($value->thumbnail)) {
                        if (Storage::delete($value->thumbnail)) {
                            //echo "GOOD thumbnail <hr>";
                        }
                    }

                    if (isset($value->src)) {
                        if (Storage::delete($value->src)) {
                            // echo "GOOD  src <hr>";
                        }
                    }
                }
            }
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }


    public function category()
    {
        return $this->belongsTo(category::class, "category_id");
    }

    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function reviews()
    {
        return $this->hasMany(ProductReview::class);
    }


    public function sub_category()
    {
        return $this->belongsTo(category::class, "sub_category_id");
    }

    public function get_name_short($min_length = 50)
    {
        if (strlen($this->name) > $min_length) {
            return substr($this->name, 0, $min_length) . "...";
        }
        return $this->name;
    }
    public function get_thumbnail()
    {
        $thumbnail = "";
        if ($this->thumbnail != null) {
            if (strlen($this->thumbnail) > 3) {
                $thumb = json_decode($this->thumbnail);
                if (isset($thumb->thumbnail)) {

                    $thumb->thumbnail = str_replace("public/", "", $thumb->thumbnail);
                    $thumb->thumbnail = str_replace("storage/", "", $thumb->thumbnail);
                    $thumb->thumbnail = str_replace("/storage", "", $thumb->thumbnail);
                    $thumb->thumbnail = str_replace("/", "", $thumb->thumbnail);
                    $thumbnail = URL::asset('storage/' . $thumb->thumbnail);
                }
            }
        }
        return $thumbnail;
    }

    public function get_images()
    {
        $images = [];
        if ($this->images != null) {
            if (strlen($this->images) > 3) {
                $images_json = json_decode($this->images);
                foreach ($images_json as $key => $img) {
                    $img->src = URL::asset('storage/' . str_replace("public/", "", $img->src));
                    $img->thumbnail = URL::asset('storage/' . str_replace("public/", "", $img->thumbnail));
                    $images[] = $img;
                }
            }
        }
        return $images;
    }

    protected $fillable = [
        'name',
        'user_id',
        'category_id',
        'sub_category_id',
        'price',
        'description',
        'city_id',
        'country_id',
        'slug',
        'thumbnail',
        'status',
        'attributes',
        'images',
        'city',
    ];
}
