@extends('metro.layout.layout-main')
<?php
use App\Models\Product;
use App\Models\Category;

$top_categories = Category::get_top_categories(8);

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
$bgs = [url('assets/images/bg/img_1.jpeg'), url('assets/images/bg/img_2.jpeg'), url('assets/images/bg/img_3.jpeg'), url('assets/images/bg/img_4.jpeg')];
shuffle($bgs);
?>
@section('main-content')
    <div class="row">
        <div class="col-12">

            <div class="row" style="background-image: url({{ $bgs[0] }});     background-size:     cover;
                                            background-repeat:   no-repeat;
                                            background-position: center center; ">
                <div class="col-6 col-md-3 m-20  p-0">
                    <div class="card card-flush shadow-sm py-10">
                        <div class="card-body py-5">
                            <p class=" fw-normal lh-sm" style="font-size: 3rem">Ready to digitally manage <span class="text-primary">your farm</span> enterprises?</p>

                            <a href="{{ url('/dashboard') }}" class="btn btn-md mt-10 d-block btn-block  btn-primary">
                                Sell now
                            </a>
                            <a class="mb-10 d-block mt-5" href="#">Learn how it works</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


 



    <div class="row p-0 mt-10 mb-10">
        <div class="col-12 p-0 m-0">
            <div class="card">
                <div class="card-body">
                    <div class="mb-n10 mb-lg-n20 z-index-2 mt-20">
                        <!--begin::Container-->
                        <div class="container">
                            <!--begin::Heading-->
                            <div class="text-center mb-17">
                                <!--begin::Title-->
                                <h3 class="fs-2hx text-dark mb-5" id="how-it-works" data-kt-scroll-offset="{default: 100, lg: 150}">How it Works</h3>
                                <!--end::Title-->
                                <!--begin::Text-->
                                <div class="fs-5 text-muted fw-bold">Save thousands to millions of bucks by using single tool
                                <br />for different amazing and great useful admin</div>
                                <!--end::Text-->
                            </div>
                            <!--end::Heading-->
                            <!--begin::Row-->
                            <div class="row w-100 gy-10 mb-md-20">
                                <!--begin::Col-->
                                <div class="col-md-4 px-5">
                                    <!--begin::Story-->
                                    <div class="text-center mb-10 mb-md-0">
                                        <!--begin::Illustration-->
                                        <img src="assets/media/illustrations/sketchy-1/2.png" class="mh-125px mb-9" alt="" />
                                        <!--end::Illustration-->
                                        <!--begin::Heading-->
                                        <div class="d-flex flex-center mb-5">
                                            <!--begin::Badge-->
                                            <span class="badge badge-circle badge-light-success fw-bolder p-5 me-3 fs-3">1</span>
                                            <!--end::Badge-->
                                            <!--begin::Title-->
                                            <div class="fs-5 fs-lg-3 fw-bolder text-dark">Jane Miller</div>
                                            <!--end::Title-->
                                        </div>
                                        <!--end::Heading-->
                                        <!--begin::Description-->
                                        <div class="fw-bold fs-6 fs-lg-4 text-muted">Save thousands to millions of bucks
                                        <br />by using single tool for different
                                        <br />amazing and great</div>
                                        <!--end::Description-->
                                    </div>
                                    <!--end::Story-->
                                </div>
                                <!--end::Col-->
                                <!--begin::Col-->
                                <div class="col-md-4 px-5">
                                    <!--begin::Story-->
                                    <div class="text-center mb-10 mb-md-0">
                                        <!--begin::Illustration-->
                                        <img src="assets/media/illustrations/sketchy-1/8.png" class="mh-125px mb-9" alt="" />
                                        <!--end::Illustration-->
                                        <!--begin::Heading-->
                                        <div class="d-flex flex-center mb-5">
                                            <!--begin::Badge-->
                                            <span class="badge badge-circle badge-light-success fw-bolder p-5 me-3 fs-3">2</span>
                                            <!--end::Badge-->
                                            <!--begin::Title-->
                                            <div class="fs-5 fs-lg-3 fw-bolder text-dark">Setup Your App</div>
                                            <!--end::Title-->
                                        </div>
                                        <!--end::Heading-->
                                        <!--begin::Description-->
                                        <div class="fw-bold fs-6 fs-lg-4 text-muted">Save thousands to millions of bucks
                                        <br />by using single tool for different
                                        <br />amazing and great</div>
                                        <!--end::Description-->
                                    </div>
                                    <!--end::Story-->
                                </div>
                                <!--end::Col-->
                                <!--begin::Col-->
                                <div class="col-md-4 px-5">
                                    <!--begin::Story-->
                                    <div class="text-center mb-10 mb-md-0">
                                        <!--begin::Illustration-->
                                        <img src="assets/media/illustrations/sketchy-1/12.png" class="mh-125px mb-9" alt="" />
                                        <!--end::Illustration-->
                                        <!--begin::Heading-->
                                        <div class="d-flex flex-center mb-5">
                                            <!--begin::Badge-->
                                            <span class="badge badge-circle badge-light-success fw-bolder p-5 me-3 fs-3">3</span>
                                            <!--end::Badge-->
                                            <!--begin::Title-->
                                            <div class="fs-5 fs-lg-3 fw-bolder text-dark">Enjoy Nautica App</div>
                                            <!--end::Title-->
                                        </div>
                                        <!--end::Heading-->
                                        <!--begin::Description-->
                                        <div class="fw-bold fs-6 fs-lg-4 text-muted">Save thousands to millions of bucks
                                        <br />by using single tool for different
                                        <br />amazing and great</div>
                                        <!--end::Description-->
                                    </div>
                                    <!--end::Story-->
                                </div>
                                <!--end::Col-->
                            </div> 
                        </div>
                        <!--end::Container-->
                    </div>
                </div>
            </div>
        </div>
    </div>
 



    <div class="row p-0 ">
        <div class="col-12 p-0 m-0">
            <div class="card shadow-sm mt-5">
                <div class="card-header bg-primary">
                    <h3 class="card-title fs-1 text-white">Market place - Browse Crops</h3>
                    <div class="card-toolbar">
                        <a href="{{ url('/product-listing') }}" type="button" class="btn btn-sm btn-light-primary">
                            See all crops
                        </a>
                    </div>
                </div>

                <div class="card-body">


                    <div class="row mt-2">
                        @foreach ($popular as $item)
                            <div class="col-6 col-md-2">
                                @include('metro.components.product-item', [
                                    'item' => $item,
                                ])
                            </div>
                        @endforeach
                        <div class="col-6 col-md-2  p-0">
                            <div class="card card-flush shadow-sm">
                                <div class="card-header">
                                    <h3 class="card-title">Sell yours</h3>
                                </div>
                                <div class="card-body py-1">
                                    Do you want your item to be listed too? click on <span class="lead text-dark">sell
                                        now</span>
                                    button
                                    to get started
                                </div>
                                <div class="card-footer">
                                    <a href="{{ url('/dashboard') }}" class="btn btn-sm d-block btn-block  btn-primary">
                                        Sell now
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>



    




    <div class="row p-0 ">
        <div class="col-12 p-0 m-0">
            <div class="card shadow-sm mt-5">
                <div class="card-header bg-primary">
                    <h3 class="card-title fs-1 text-white">Market place - Browse Livestock products</h3>
                    <div class="card-toolbar">
                        <a href="{{ url('/product-listing') }}" type="button" class="btn btn-sm btn-light-primary">
                            See all
                        </a>
                    </div>
                </div>

                <div class="card-body">

                    <div class="row  g-2">
                        @foreach ($top_categories as $cat)
                            <div class="col">
                                <a href="{{ url($cat->slug) }}"
                                    class="card card-border card-stretch border border-1 border-secondary">
                                    <div class="card-body py-5 px-2">
                                        <h2 class="card-text fw-normal text-center " style="font-size: 16px">
                                            {{ $cat->name }}</h2>
                                    </div>
                                </a>
                            </div>
                        @endforeach
                    </div>

                </div>
            </div>
        </div>
    </div>




    <div class="row p-0 ">
        <div class="col-12 p-0 m-0">
            <div class="card shadow-sm mt-5">
                <div class="card-header bg-primary">
                    <h3 class="card-title fs-1 text-white">Popular produtcs</h3>
                    <div class="card-toolbar">
                        <a href="{{ url('/product-listing') }}" type="button" class="btn btn-sm btn-light-primary">
                            See all
                        </a>
                    </div>
                </div>

                <div class="card-body">


                    <div class="row mt-2">
                        @foreach ($just_in as $item)
                            <div class="col-6 col-md-2">
                                @include('metro.components.product-item', [
                                    'item' => $item,
                                ])
                            </div>
                        @endforeach
                        <div class="col-6 col-md-2  p-0">
                            <div class="card card-flush shadow-sm">
                                <div class="card-header">
                                    <h3 class="card-title">Sell yours</h3>
                                </div>
                                <div class="card-body py-1">
                                    Do you want your item to be listed too? click on <span class="lead text-dark">sell
                                        now</span>
                                    button
                                    to get started
                                </div>
                                <div class="card-footer">
                                    <a href="{{ url('/dashboard') }}" class="btn btn-sm d-block btn-block  btn-primary">
                                        Sell now
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>




    <div class="row p-0 ">
        <div class="col-12 p-0 m-0">
            <div class="card shadow-sm mt-5">
                <div class="card-header bg-primary">
                    <h3 class="card-title fs-1 text-white">Recommended</h3>
                    <div class="card-toolbar">
                        <a href="{{ url('/product-listing') }}" type="button" class="btn btn-sm btn-light-primary">
                            See all
                        </a>
                    </div>
                </div>

                <div class="card-body">


                    <div class="row mt-2">
                        @foreach ($recomended as $item)
                            <div class="col-6 col-md-2">
                                @include('metro.components.product-item', [
                                    'item' => $item,
                                ])
                            </div>
                        @endforeach
                        <div class="col-6 col-md-2  p-0">
                            <div class="card card-flush shadow-sm">
                                <div class="card-header">
                                    <h3 class="card-title">Sell yours</h3>
                                </div>
                                <div class="card-body py-1">
                                    Do you want your item to be listed too? click on <span class="lead text-dark">sell
                                        now</span>
                                    button
                                    to get started
                                </div>
                                <div class="card-footer">
                                    <a href="{{ url('/dashboard') }}" class="btn btn-sm d-block btn-block  btn-primary">
                                        Sell now
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>





    <div class="text-center py-10">
        <a href="{{ url('product-listing') }}" class="btn btn-primary btn-lg">SEE MORE</a>
    </div>


    {{-- <h2 class="text-center my-10 h1">Browse By Category</h2>
        <div class="row mt-2">
            @for ($i = 1; $i < 13; $i++)
                <div class="col-3 col-md-2">
                    @include('metro.components.category-item', [
                        'name' => 'Title here',
                        'img' => "assets/images/slides/$i.png",
                        'link' => '#',
                    ])
                </div>
            @endfor
        </div> --}}
@endsection
