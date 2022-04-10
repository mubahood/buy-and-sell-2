<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
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

 

    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->diffForHumans();
    }


    public function getQuantityAttribute($value)
    {
        return (int)($value);
    }


    public function getPriceAttribute($value)
    {
        return number_format((int)($value));
    }

    public function getFixedPriceAttribute($value)
    {
        if ($value == null) {
            return "Negotiable";
        }
        if ($value == false) {
            return "Negotiable";
        }
        return "Fixed price";
    }


    public static function boot()
    {
        parent::boot();

        self::creating(function ($p) {
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
        return $this->belongsTo(User::class, 'user_id');
    }


    public function category()
    {
        return $this->belongsTo(Category::class, "category_id");
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
        return $this->belongsTo(Category::class, "sub_category_id");
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
        $thumbnail = "no_image.jpg";
        if ($this->thumbnail != null) {
            if (strlen($this->thumbnail) > 3) {
                $thumb = json_decode($this->thumbnail);
                if (isset($thumb->thumbnail)) {

                    $thumbnail = url($thumb->thumbnail);
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
                    $img->src = url($img->src);
                    $img->thumbnail = url($img->thumbnail);
                    $images[] = $img;
                }
            }
        }
        return $images;
    }


    protected $appends = [
        'seller_name',
        'category_name',
        'city_name',
    ];

    public function getCityNameAttribute($value)
    {
        $city_id = (int)($this->city_id);
        $city = City::find($city_id);
        if ($city == null) {
            return "-";
        }
        $c = $city->country;
        if($c!=null){
            return $c->name.", ".$city->name;
        }
        return $city->name;
    }


    public function getCategoryNameAttribute()
    {

        $name = "-";
        $cat = Category::find($this->category_id);
        if ($cat == null) {
            return "-";
        }else {
            if(
                isset($cat->parent) &&
                ($cat->parent > 0 ) 
            ){
                $name = $cat->name;
                $_cat = Category::find($cat->parent);
                if($_cat != null){
                    $name = $_cat->name.", ".$cat->name;
                }
            }
        }
        return $name;
    }

    public function getSellerNameAttribute()
    {
        $u = User::find($this->user_id);
        if ($u == null) {
            $u = new User();
        }
        if ($u->company_name == null || (strlen($u->company_name) < 2)) {
            return $u->name;
        } else {
            return $u->company_name;
        }
    }

    public function getNatureofOfferAttribute($val)
    {
        
        if($val == null || strlen($val)<2){
            return "For sale";
        }else{
            return "For hire";
        }
    }
    
    public function init_attributes(){

        $attributes = json_decode($this->attributes['attributes']);
        if($attributes == null){
            $attributes = [];
        }
        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Nature of offer';
        $att->units = '';
        $att->value = $this->nature_of_offer;; 
        $attributes[] = $att;


        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Quantity available';
        $att->units = '';
        $att->value = $this->quantity;; 
        $attributes[] = $att;
 
 
        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Category';
        $att->units = '';
        $att->value = $this->category_name;; 
        $attributes[] = $att;


        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Location';
        $att->units = '';
        $att->value = $this->city_name;
        $attributes[] = $att; 


        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Offered by';
        $att->units = '';
        $att->value = $this->seller_name;
        $attributes[] = $att; 


        $att = new Attribute();
        $att->type = 'text';
        $att->name = 'Posted';
        $att->units = '';
        $att->value = $this->created_at;
        $attributes[] = $att; 

        $this->attributes['attributes'] =  json_encode($attributes);

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
