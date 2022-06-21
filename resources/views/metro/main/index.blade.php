@extends('metro.layout.layout-main')
<?php
use App\Models\Product;
use App\Models\Banner;
use App\Models\Category;

$top_categories = Category::get_top_categories(16);

$slide_banners = Banner::whereBetween('id', [36, 40])->get();

$products = [];
$products = Product::all();
$popular = [];
$just_in = [];
$recomended = [];
foreach ($products as $key => $pro) {
    if (count($popular) < 5) {
        $popular[] = $pro;
        continue;
    }
    if (count($just_in) < 5) {
        $just_in[] = $pro;
        continue;
    }
    if (count($recomended) < 5) {
        $recomended[] = $pro;
        continue;
    }
}
//$bgs = [url('assets/images/bg/img_1.jpeg'), url('assets/images/bg/img_2.jpeg'), url('assets/images/bg/img_3.jpeg'), url('assets/images/bg/img_4.jpeg')];

//$bgs = [url('assets/images/bg/bg_1.png'), url('assets/images/bg/bg_2.jpeg'), url('assets/images/bg/bg_3.jpeg'), url('assets/images/bg/04.png')];
$bgs = [url('storage/6.jpg'), url('storage/6.jpg'), url('storage/6.jpg'), url('storage/6.jpg'), url('storage/6.jpg')];

shuffle($bgs);
/* 
  "id" => 38
        "created_at" => "2022-06-21 09:21:41"
        "updated_at" => "2022-06-21 09:21:41"
        "section" => "web"
        "position" => null
        "name" => "Slider 3"
        "sub_title" => null
        "type" => "1"
        "category_id" => "5"
        "product_id" => null
        "image" => "storage/613b1628b657ad6aa323b1abb0969579.jpg"
        "clicks" => "0"
        "parent_id" => 0
        "order" => 0
        "title" => "0"
*/
?>
<style>
    .my-slider {
        height: 25rem;
    }

    .my-banner {
        height: 10rem;
    }

    .my-banner-product {
        height: 6rem;
    }


    @media only screen and (max-width: 600px) {
        .my-slider {
            height: 15rem;
        }
    }
</style>
@section('main-content')
    <div class="row bg-white my-md-5 py-5">
        <div class="d-none d-md-block col-md-3 pt-3">
            <h2 class="ps-2 h1">Top Categories</h2>
            @foreach ($top_categories as $_item)
                <a href="#">
                    <h3 class="fw-normal fs-4 py-1 m-0 px-3 text-gray-700 bg-hover-light text-hover-primary ">
                        {{ $_item->name }}</h3>
                </a>
            @endforeach
        </div>
        <div class="col-md-6">
            <?php
            $first_seen = false;
            
            ?>
            <div class="carousel-inner slider-arrow">
                <div id="kt_carousel_1_carousel" class="carousel carousel-custom " data-bs-ride="carousel"
                    data-bs-interval="3000">
                    <div class="carousel-inner slider-arrow">
                        @foreach ($slide_banners as $slide)
                            @php
                                $active = '';
                                if (!$first_seen) {
                                    $active = ' active ';
                                    $first_seen = true;
                                }
                            @endphp
                            <div class="carousel-item  <?= $active ?>  ">

                                <a href="{{ $slide->link }}">
                                    <div class="my-slider"
                                        style="background-image: url({{ $slide->image }});     background-size:     cover;
                                                                background-repeat:   no-repeat;
                                                                background-position: center center; ">
                                    </div>
                                </a>


                            </div>
                        @endforeach
                    </div>
                    <div class="p-0 m-0 carousel-indicators carousel-indicators-dots bg-primary">
                        @php
                            $_count = 0;
                            $active_class = 'active';
                        @endphp
                        @foreach ($slide_banners as $img)
                            <div data-bs-target="#kt_carousel_1_carousel" data-bs-slide-to="{{ $_count }}"
                                class="ms-{{ $_count }} {{ $active_class }}">
                                {{-- <img class="d-block w-100" src="{{ $img->thumbnail }}" alt="details" alt="First slide"> --}}
                            </div>
                            @php
                                $_count++;
                                $active_class = '';
                            @endphp
                        @endforeach
                    </div>
                </div>


            </div>









            <div class="row ">

                @foreach (Banner::whereBetween('id', [41, 43])->get() as $item)
                    <div class="col-4 mt-4">
                        <a href="{{ $slide->link }}">
                            <div class=" my-banner p-4"
                                style="background-image: url({{ $item->image }});     background-size:     cover;
                                                        background-repeat:   no-repeat;
                                                        background-position: center center; ">
                                <div class="row">
                                    <div class="col-md-10">
                                        <h3 class="fs-2  m-0  text-gray-900 ">{{ $item->name }}</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                @endforeach

            </div>
        </div>
        <div class="d-none d-md-block col-md-3">

            <div class="">
                <h2 class="ps-0 h1">Promoted</h2>
            </div>



            @foreach (Banner::whereBetween('id', [44, 47])->get() as $item)
                <a href="{{ $slide->link }}">
                    <div class="row mt-1 mb-5">
                        <div class="col-4">
                            <div class="  my-banner-product"
                                style="background-image: url({{ $item->image }});     background-size:     cover;
                                                    background-repeat:   no-repeat;
                                                    background-position: center center; ">
                            </div>
                        </div>
                        <div class="col-8">
                            <h3 class="fs-4  m-0  text-gray-900 ">{{ $item->name }}</h3>
                            <h4 class="fw-normal fs-4  m-0  text-gray-700 ">{{ $item->sub_title }}</h4>
                        </div>
                    </div>
                </a>
            @endforeach


            <div class="row mt-1 mb-5">
                <div class="col-12 mt-2">
                    <p class="fw-normal fs-6  m-0  text-gray-700 ">Haven't found what you are looking for?</p>
                    <a href="#" class="border border-primary btn btn-light-primary d-block">Post Your Request Now</a>
                </div>
            </div>
        </div>
    </div>


    @php
    $banners = Banner::whereBetween('id', [48, 56])->get();
    @endphp
    @include('metro.components.section-grouped-banners', [
        'items' => $banners,
    ])

    @php
    $banners = Banner::whereBetween('id', [48, 56])->get();
    @endphp
    @include('metro.components.section-grouped-banners', [
        'items' => $banners,
    ])

    @php
    $banners = Banner::whereBetween('id', [48, 56])->get();
    @endphp
    @include('metro.components.section-grouped-banners', [
        'items' => $banners,
    ])






    <div class="row bg-white mt-8 p-10"
        style="background-image: url(https://www.micstatic.com/mic-search/img/home-2019/easy-sourcing.jpg?_v=1655724759401);     background-size:     cover;
        background-repeat:   no-repeat;
        background-position: center center; height: 34rem; ">
        <div class="col-5 fw-bold fs-3 py-1 m-0 px-3 text-gray-900">
            <h2 class="h1 display-4 mb-4">EASY SOURCING</h2>
            <p>{{ env('APP_NAME') }} is Uganda's largest online Farmers marketplace, connecting buyers with farmers.</p>
            <p>One request, multiple quotes</p>
            <p>Verified suppliers matching</p>
            <p>Quotes comparison and sample request</p>
        </div>
        <div class="col-1"></div>
        <div class="col-6 bg-white p-10">
            <h2 class="ps-0  display-6 fw-normal">Tell us what you need</h2>
            <form action="">
                <div class="form-group">
                    <input type="text" class="form-control border border-primary" placeholder="Product name or keyword">
                </div>
                <div class="form-group mt-4">
                    <textarea name="" placeholder="Product description" id="data" class="form-control border border-primary "
                        rows="3"></textarea>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group  mt-4">
                            <input type="email" class="form-control border border-primary" placeholder="Email address">
                        </div>
                    </div>
                    <div class="col-md-6 mt-4">
                        <div class="form-group">
                            <input type="name" class="form-control border border-primary" placeholder="Full name">
                        </div>
                    </div>
                </div>

                <a href="#" class="border border-primary btn btn-primary mt-3">Post Your Request</a>

            </form>

        </div>

    </div>
@endsection
