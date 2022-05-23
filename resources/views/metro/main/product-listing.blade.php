@extends('metro.layout.layout-main')
<?php
use App\Models\Product;
use App\Models\Category;

$top_categories = Category::get_top_categories(8);

$products = [];
$conds = [];
$per_page = 24;

$seg = request()->segment(1);
$cat = Category::where('slug', $seg)->first();
if ($cat) {
    if ($cat->id != null) {
        $conds['category_id'] = $cat->id;
    }
}

$products = Product::where($conds)
    ->orderBy('id', 'desc')
    ->paginate($per_page)
    ->withQueryString();
?>
@section('main-content')
    <div class="row">

        <div class="d-flex d-flex align-items-stretch justify-content-between pt-4">
            <h2 class="my-6 h1 fw-bold">Popular items</h2>
            <a class="mb-10 d-block mt-6" href="#">See all</a>
        </div>

        <div class="row mt-2">
            @foreach ($products as $item)
                <div class="col-6 col-md-2">
                    @include('metro.components.product-item', [
                        'item' => $item,
                    ])
                </div>
            @endforeach
        </div>

        <div class="row ">
            <div class="col-lg-12">
                <div class="footer-pagection border-0">
                    @if ($products != null)
                        <p class="page-info">Showing {{ $products->count() }} of {{ $products->total() }}
                            Results</p>
                        {{ $products->onEachSide(2)->links('main.pagination') }}
                    @endif
                </div>
            </div>
        </div>




        <div class="text-center py-10">
            <a href="#" class="btn btn-primary btn-sm">SEE MORE</a>
        </div>


    </div>
@endsection
