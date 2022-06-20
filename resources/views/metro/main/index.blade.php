@extends('metro.layout.layout-main')
<?php
use App\Models\Product;
use App\Models\Category;

$top_categories = Category::get_top_categories(16);

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
$bgs = [url('assets/images/bg/bg_3.jpeg')];

$bgs = [url('assets/images/bg/bg_1.png'), url('assets/images/bg/bg_2.jpeg'), url('assets/images/bg/bg_3.jpeg'), url('assets/images/bg/04.png')];

shuffle($bgs);
?>
<style>
    .my-slider {
        height: 26rem;
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
            <div class="  my-slider"
                style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                                                    background-repeat:   no-repeat;
                                                    background-position: center center; ">
            </div>
            <div class="row ">
                <div class="col-4 mt-4">
                    <div class=" my-banner"
                        style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                                                        background-repeat:   no-repeat;
                                                        background-position: center center; ">
                    </div>
                </div>
                <div class="col-4 mt-4">
                    <div class=" my-banner"
                        style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                                                        background-repeat:   no-repeat;
                                                        background-position: center center; ">
                    </div>
                </div>
                <div class="col-4 mt-4">
                    <div class=" my-banner"
                        style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                                                        background-repeat:   no-repeat;
                                                        background-position: center center; ">
                    </div>
                </div>
            </div>
        </div>
        <div class="d-none d-md-block col-md-3">

            <div class="">
                <h2 class="ps-0 h1">Promoted</h2>
            </div>

            <div class="row mt-1 mb-5">
                <div class="col-4">
                    <div class="  my-banner-product"
                        style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                                                    background-repeat:   no-repeat;
                                                    background-position: center center; ">
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="fs-4  m-0  text-gray-700 ">Water Pump</h3>
                    <h4 class="fw-normal fs-4  m-0  text-gray-700 ">UGX 67,000</h4>
                </div>
            </div>

            <div class="row mt-1 mb-5">
                <div class="col-4">
                    <div class="  my-banner-product"
                        style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                                                    background-repeat:   no-repeat;
                                                    background-position: center center; ">
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="fs-4  m-0  text-gray-700 ">Water Pump</h3>
                    <h4 class="fw-normal fs-4  m-0  text-gray-700 ">UGX 67,000</h4>
                </div>
            </div>

            <div class="row mt-1 mb-5">
                <div class="col-4">
                    <div class="  my-banner-product"
                        style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                                                    background-repeat:   no-repeat;
                                                    background-position: center center; ">
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="fs-4  m-0  text-gray-700 ">Water Pump</h3>
                    <h4 class="fw-normal fs-4  m-0  text-gray-700 ">UGX 67,000</h4>
                </div>
            </div>

            <div class="row mt-1 mb-5">
                <div class="col-4">
                    <div class="  my-banner-product"
                        style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                                                    background-repeat:   no-repeat;
                                                    background-position: center center; ">
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="fs-4  m-0  text-gray-700 ">Water Pump</h3>
                    <h4 class="fw-normal fs-4  m-0  text-gray-700 ">UGX 67,000</h4>
                </div>
            </div>

            <div class="row mt-1 mb-5">
                <div class="col-12 mt-2">
                    <p class="fw-normal fs-6  m-0  text-gray-700 ">Haven't found what you are looking for?</p>
                    <a href="#" class="border border-primary btn btn-light-primary d-block">Post Your Request Now</a>
                </div>
            </div>
        </div>
    </div>









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







    <div class="row bg-white mt-8">
        <div class="col-3"
            style="background-image: url({{ $bgs[0] }});     background-size:     cover;
        background-repeat:   no-repeat;
        background-position: center center; height: 28rem; ">
        </div>
        <div class="col-9">
            <div class="row">
                <div class="col-3"
                    style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[1] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[2] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[3] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>
                <div class="col-3"
                    style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[1] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[2] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[3] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

            </div>
        </div>
    </div>


    <div class="row bg-white mt-8">
        <div class="col-3"
            style="background-image: url({{ $bgs[0] }});     background-size:     cover;
        background-repeat:   no-repeat;
        background-position: center center; height: 28rem; ">
        </div>
        <div class="col-9">
            <div class="row">
                <div class="col-3"
                    style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[1] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[2] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[3] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>
                <div class="col-3"
                    style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[1] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[2] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[3] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

            </div>
        </div>
    </div>


    <div class="row bg-white mt-8">
        <div class="col-3"
            style="background-image: url({{ $bgs[0] }});     background-size:     cover;
        background-repeat:   no-repeat;
        background-position: center center; height: 28rem; ">
        </div>
        <div class="col-9">
            <div class="row">
                <div class="col-3"
                    style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[1] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[2] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[3] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>
                <div class="col-3"
                    style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[1] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[2] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

                <div class="col-3"
                    style="background-image: url({{ $bgs[3] }});     background-size:     cover;
                background-repeat:   no-repeat;
                background-position: center center; height: 14rem; ">
                </div>

            </div>
        </div>
    </div>
@endsection
