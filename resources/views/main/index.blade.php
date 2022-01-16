@extends('layouts.layout')

@section('title', config('app.domain') )

@section('sidebar')
@parent

<p>This is appended to the master sidebar.</p>
@endsection

@section('content')




@php
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
use App\Models\Profile;
use App\Models\City;
use App\Models\Category;
$cats = Category::all();

$this_url = url('/');
if (isset($_SERVER['PATH_INFO'])) {
$this_url = url($_SERVER['PATH_INFO']);
}

$seg = "";
$is_searching = false;
$show_products = false;
$key_word = '';
$search_title = '';
$product_tab = ' _tab ';
$supplier_tab = ' _tab ';

$product_tab = ' active_tab ';
if ('products' == request()->segment(1)) {
$product_tab = ' active_tab ';
$supplier_tab = ' _tab ';
} elseif ('suppliers' == request()->segment(1)) {
$supplier_tab = ' active_tab ';
$product_tab = ' _tab ';
}

if (isset($_GET['search'])) {
if (strlen(isset($_GET['search'])) > 0) {
$key_word = trim($_GET['search']);
$is_searching = true;
}
}

$products = [];
$profiles = [];
if (str_contains($product_tab, 'active_tab')) {
$show_products = true;
if ($is_searching) {
$products = Product::where('name', 'LIKE', "%$key_word%")->paginate(2)->withQueryString();;
$search_title = 'Found ' . count($products) . " search results for \"" . $key_word . "\"";
} else {

$conds['status'] = 0;
$seg = strtolower(request()->segment(1));
if($seg!=null){
$cat = Category::where('slug',$seg)->first();
if($cat != null){
$conds['category_id'] = $cat->id;
}

$city = City::where('name',$seg)->first();
if($city != null){
$conds['city_id'] = $city->id;
}

}

$products = Product::where($conds)->orderBy('id','desc')->paginate(10)->withQueryString();

}
} else {
$show_products = false;
$profiles = Profile::where('status', 1)->paginate(2)->withQueryString();
}

$cities = City::all();

@endphp
<style>
    .product-widget-dropitem {
        margin: 0px;
        margin-top: .6rem;
    }

    .product-widget-dropdown {
        padding: 0px;
        margin: 0px;
    }

    .product-widget-dropdown li a {
        padding: 0px;
        margin: 0px;
        margin-left: 1.5rem;
    }

    .product-widget-dropdown li a:hover {
        background-color: white;
    }
</style>
<section class="inner-section ad-list-part mt-2 mt-md-3  mb-0 mb-md-3">
    <div class="container">

        <div class="row content-reverse">
            <div class="col-lg-4 col-xl-3 d-none d-md-block">
                <div class="row">
                    <div class="col-md-6 col-lg-12 ">
                        <div class="product-widget pr-4">
                            <h6 class="product-widget-title">Categories</h6>
                            <form action="{{ $this_url }}" class="product-widget-form">
                                <ul class="product-widget-list ">
                                    @foreach ($cats as $item)
                                    @php
                                    if ($item->parent == null) {
                                    $parent = 0;
                                    } else {
                                    $parent = (int) $item->parent;
                                    }

                                    if ($parent >= 1) {
                                    continue;
                                    }
                                    @endphp
                                    <li class="product-widget-dropitem active"><button type="button" class="product-widget-link active">
                                            <img width="20" src="{{url("storage/".$item->image)}}" alt="{{ $item->name
                                            }}">
                                            {{ $item->name }}
                                        </button>
                                        <ul class="product-widget-dropdown" style="display: block;">
                                            @foreach ($item->sub_categories as $sub_item)
                                            <li>
                                                <a class="  {{ (strtolower($sub_item->slug) == $seg) ? ' text-primary ' : ' text-secondary ' }} " href="{{ url($sub_item->slug) }}">{{ $sub_item->name }}
                                                    <span class="text-dark">({{count($sub_item->products)}})</span></a>
                                            </li>
                                            @endforeach
                                        </ul>
                                    </li>
                                    @endforeach

                            </form>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-12">
                        <div class="product-widget">
                            <h6 class="product-widget-title">Top cities</h6>
                            <form class="product-widget-form">
                                <ul class="product-widget-list ">

                                    @foreach (City::all() as $item)

                                    <li class="product-widget-item ">
                                        <div class="product-widget-checkbox"><input readonly {{ (strtolower($item->name)
                                            == $seg) ? ' checked ' : ' ' }} type="checkbox" id="chcek9">
                                        </div><a href="{{ url($item->name) }}" class="product-widget-label {{ (strtolower($item->name) == $seg) ? ' text-primary ' : ' text-secondary ' }} " for="chcek9"><span class="product-widget-text">{{$item->name.",
                                                ".$item->country->name}}</span><span class="product-widget-number">({{count($item->products)}})</span></a>
                                    </li>
                                    @endforeach
                                </ul>
                            </form>
                        </div>
                    </div>


                </div>
            </div>
            <div class="col-lg-10 col-xl-9 p-0">
                <div class="row p-0 m-0">
                    <div class="col-12 col-md-12  p-0 m-0">
                        <div class="row mb-0 border-bottom pb-2 pt-3 product-card-1 standard pl-2 pr-2 ml-md-2 mr-md-2 p-0 m-0"  >
                            @if ($show_products)
                            @foreach ($products as $item)
                            
                                <x-product3 :item="$item" />
                             @endforeach
                            @endif

                            @if (!$show_products)
                            @foreach ($profiles as $item)
                            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 ">
                                <x-supplier :item="$item" />
                            </div>
                            @endforeach
                            @endif




                        </div>
                        <div class="row ">
                            <div class="col-lg-12">
                                <div class="footer-pagection border-0">


                                    @if ($products!=null)

                                    <p class="page-info">Showing {{$products->count()}} of {{$products->total()}}
                                        Results</p>
                                    {{
                                    $products->onEachSide(2)->links('main.pagination')
                                    }}
                                    @endif

                                    @if ($profiles!=null)

                                    <p class="page-info">Showing {{$profiles->count()}} of {{$profiles->total()}}
                                        Results</p>
                                    {{
                                    $profiles->onEachSide(2)->links('main.pagination')
                                    }}
                                    @endif


                                    {{-- <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="#"><i
                                                    class="fas fa-long-arrow-alt-left"></i></a></li>
                                        <li class="page-item"><a class="page-link active" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">...</li>
                                        <li class="page-item"><a class="page-link" href="#">67</a></li>
                                        <li class="page-item"><a class="page-link" href="#"><i
                                                    class="fas fa-long-arrow-alt-right"></i></a></li>
                                    </ul> --}}
                                </div>
                            </div>
                        </div>

                    </div>
                     

                </div>
            </div>


        </div>
    </div>
</section>


@endsection