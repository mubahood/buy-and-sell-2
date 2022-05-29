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
    if (count($just_in) < 11) {
        $just_in[] = $pro;
        continue;
    }
    if (count($recomended) < 18) {
        $recomended[] = $pro;
        continue;
    }
}
?>
@section('main-content')
    <div class="row" style="background-image: url(assets/images/bg-1.jpeg);     background-size:     cover;                      /* <------ */
                        background-repeat:   no-repeat;
                        background-position: center center; ">
        <div class="col-6 col-md-3 m-20  p-0">
            <div class="card card-flush shadow-sm py-10">
                <div class="card-body py-5">
                    <p class="display-5 fw-normal lh-sm">Ready to boost your business?</p>

                    <a href="{{ url('/dashboard') }}" class="btn btn-md mt-10 d-block btn-block  btn-primary">
                        Sell now
                    </a>
                    <a class="mb-10 d-block mt-5" href="#">Learn how it works</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="d-flex d-flex align-items-stretch justify-content-between pt-4">
            <h2 class="my-6 h1 fw-bold">Popular items</h2>
            <a class="mb-10 d-block mt-6" href="#">See all</a>
        </div>

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
                    <div class="card-body py-5">
                        Do you want your item to be listed too? click on <span class="lead text-dark">sell now</span> button
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


        <h2 class="my-6 h1 fw-bold">Browse By Category</h2>
        <div class="row  g-2">
            @foreach ($top_categories as $cat)
                <div class="col">
                    <a href="#" class="card card-border card-stretch border border-1 border-secondary">
                        <div class="card-body py-5 px-2">
                            <h2 class="card-text fw-normal text-center " style="font-size: 16px">{{ $cat->name }}</h2>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>



        <div class="d-flex d-flex align-items-stretch justify-content-between pt-4">
            <h2 class="my-6 h1 fw-bold">Just in</h2>
            <a class="mb-10 d-block mt-6" href="#">See all</a>
        </div>

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
                    <div class="card-body py-5">
                        Do you want your item to be listed too? click on <span class="lead text-dark">sell now</span> button
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


        <div class="d-flex d-flex align-items-stretch justify-content-between pt-4">
            <h2 class="my-6 h1 fw-bold">Recomended</h2>
            <a class="mb-10 d-block mt-6" href="#">See all</a>
        </div>

        <div class="row mt-2">
            @foreach ($recomended as $item)
                <div class="col-6 col-md-2">
                    @include('metro.components.product-item', [
                        'item' => $item,
                    ])
                </div>
            @endforeach
        </div>

        <div class="text-center py-10">
            <a href="{{ url('product-listing') }}" class="btn btn-primary btn-sm">SEE MORE</a>
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
    </div>
@endsection
