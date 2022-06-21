<?php
use App\Models\Banner;
$main_item = new Banner();

$_things = ['Baby Clothes', 'Sports Wear', 'Belt', 'Gloves', 'Sweaters', 'Hoodies', 'Bikini', 'T-Shirt', 'Swim wear', 'Jacket', 'Dresses', 'Pants & Trousers', 'Winter Apparel'];

/* foreach ($_things as $key => $v) {
    $x = Banner::where([
        'name' => $v,
    ])->first();

    if ($y != null) {
        //$y = new Banner();
        $y->section = 'web';
        $y->position = '#';
        $y->name = $v;
        $y->title = $v;
        $y->type = 1;
        $y->product_id = 1;
        $y->parent_id = 0;
        $y->category_id = 1;
        $y->order = 1;
        $y->clicks = 1;
        $y->sub_title = $v;
        $y->image = 'storage/wear_'.rand(1,14).".png";

       // $y->save();
    
    } 
	

} */
if (isset($items[0])) {
    $main_item = $items[0];
    unset($items[0]);
}

?><div class="row bg-white mt-8">
    <div class="col-3 p-5"
        style="background-image: url({{ $main_item->image }});     background-size:     cover;
    background-repeat:   no-repeat;
    background-position: center center; height: 32rem; ">
        <h2 class="ps-0  display-5 fw-bolder">{{ $main_item->name }}</h2>
        <a class="btn btn-primary btn-sm mt-5" href="{{ $main_item->link }}">{{ $main_item->sub_title }}</a>
    </div>
    <div class="col-9">
        <div class="row">
            @foreach ($items as $item)
                <a href="{{ $slide->link }}" class="col-3 border border-secondary"
                    style="background-image: url({{ $item->image }});     background-size:     cover;
            background-repeat:   no-repeat;
            background-position: center center; height: 16rem; ">
                    <div class="row">
                        <div class="col-md-8">
                            <h2 class="ps-4 pt-4    fw-normal text-gray-700" style="font-size: 1.5rem">
                                {{ $item->name }}</h2>
                        </div>
                    </div>
                </a>
            @endforeach

        </div>
    </div>
</div>
