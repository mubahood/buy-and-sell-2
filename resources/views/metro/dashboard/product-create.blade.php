<?php
use App\Models\MenuItem;
use App\Models\Chat;
use App\Models\Product;
use App\Models\Category;
use App\Models\Country;

$id = (string) Request::segment(3);
$u = Auth::user();

$_categories = [];
$cats = Category::where([])
    ->orderBy('name', 'Asc')
    ->get();
foreach ($cats as $key => $cat) {
    $_categories[$cat->id] = $cat->name;
}

$_locations = [];
$countries = Country::where([])
    ->orderBy('name', 'Asc')
    ->get();
foreach ($countries as $key => $c) {
    foreach ($c->cities as $_key => $_c) {
        $_locations[$_c->id] = $c->name . ' - ' . $_c->name;
    }
}

$chat_threads = Chat::get_chat_threads($u->id);
$thumbnail = url('no_image.jpg');

$item = new Product();
$id = ((int) Request::segment(3));
$is_edit = false;
if ($id > 0) {
    $item = Product::find($id);
}
if ($item == null || $item->id < 1) {
    $item = new Product();
    $is_edit = false;
} else {
    $thumbnail = $item->get_thumbnail();
    $is_edit = true;
}

?>@extends('metro.layout.layout-dashboard')
@section('header')
@endsection
@section('toolbar-title', 'Creating product')
@section('dashboard-content')
    <form id="form" action="{{ url('dashboard/products') }}" class="form d-flex flex-column flex-lg-row" method="POST"
        enctype="multipart/form-data">
        @csrf

        @if ($is_edit)
            <input type="hidden" name="task" value="edit">
            <input type="hidden" name="id" value="{{ $id }}">
        @else
            <input type="hidden" name="task" value="create">
        @endif

        <div class="row  d-block w-100">
            <div class="col-12 p-0">
                <div class="card card-flush py-2">
                    <div class="card-body pt-3 pt-md-5  px-2 px-md-5">

                        <div class="fv-row mb-3">
                            <div class="dropzone" id="kt_ecommerce_add_product_media">
                                <!--begin::Message-->
                                <div class="dz-message needsclick">
                                    <!--begin::Icon-->
                                    <i class="bi bi-file-earmark-arrow-up text-primary fs-3x"></i>
                                    <!--end::Icon-->
                                    <!--begin::Info-->
                                    <div class="ms-4">
                                        <h3 class="fs-5 fw-bolder text-gray-900 mb-1">Add product's photos.</h3>
                                        <span class="fs-7 fw-bold text-gray-400">Upload up to 10
                                            files</span>
                                    </div>
                                    <!--end::Info-->
                                </div>
                            </div>
                        </div>

                        <div class="mb-3  fv-row">
                            @include('metro.components.input-text', [
                                'label' => 'Product Name',
                                'required' => 'required',
                                'classes' => '  mb-0 ',
                                'value' => $item->name,
                                'attributes' => [
                                    'name' => 'name',
                                    'type' => 'text',
                                ],
                            ])
                        </div>



                        <div class="row ">
                            <div class="col-md-6 mt-3 ">
                                @include('metro.components.input-select', [
                                    'label' => 'Category',
                                    'value' => $item->category_id,
                                    'required' => 'required',
                                    'options' => $_categories,
                                    'classes' => ' form-select-sm mb-0 ',
                                    'attributes' => [
                                        'name' => 'category_id',
                                    ],
                                ])
                            </div>
                            <div class="col-md-6 mt-3 ">
                                @include('metro.components.input-text', [
                                    'label' => 'Price',
                                    'required' => 'required',
                                    'classes' => '  ',
                                    'value' => $item->get_price(),
                                    'attributes' => [
                                        'name' => 'price',
                                        'type' => 'number',
                                    ],
                                ])
                            </div>
                        </div>


                        <div class="row ">
                            <div class="col-6 mt-5">
                                @include('metro.components.input-select', [
                                    'label' => 'Product Location',
                                    'required' => 'required',
                                    'value' => $item->city_id,
                                    'options' => $_locations,
                                    'classes' => ' form-select-sm mb-0 ',
                                    'attributes' => [
                                        'name' => 'city_id',
                                    ],
                                ])
                            </div>

                            <div class="col-6 mt-5">
                                @include('metro.components.input-select', [
                                    'label' => 'Nature of this offer',
                                    'required' => 'required',
                                    'value' => $item->nature_of_offer,
                                    'options' => [
                                        'For sale' => 'For sale',
                                        'For hire' => 'For hire',
                                        'Service' => 'Service',
                                    ],
                                    'classes' => ' form-select-sm mb-0 ',
                                    'attributes' => [
                                        'name' => 'nature_of_offer',
                                    ],
                                ])
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-12 mt-5">
                                <label class="form-label fw-normal text-dark fs-3  p-0 m-0 "
                                    for="area">Description</label>
                                <textarea class="form-control" required name="description" id="area" rows="5">{!! $item->description !!}</textarea>
                            </div>
                        </div>

                        <div class="row pt-5">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary w-100 btn-block">
                                    <span class="indicator-label">UPLOAD PRODUCT</span>
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
@endsection
@section('footer')
    <script src="{{ url('/') }}/assets/js/custom/apps/ecommerce/catalog/save-product.js"></script>
    <script src="{{ url('/') }}/assets/js/widgets.bundle.js"></script>
    <script src="{{ url('/') }}/assets/js/custom/widgets.js"></script>
    <script src="{{ url('/') }}/assets/js/custom/apps/chat/chat.js"></script>
    <script src="{{ url('/') }}/assets/js/custom/utilities/modals/upgrade-plan.js"></script>
    <script src="{{ url('/') }}/assets/js/custom/utilities/modals/create-app.js"></script>
    <script src="{{ url('/') }}/assets/js/custom/utilities/modals/users-search.js"></script>
    <script>
        $description_field = $("#kt_ecommerce_add_product_description");
        $description = $("#description");

        function logSubmit(event) {
            $description.val($description_field[0].firstChild.innerHTML);
        }

        const form = document.getElementById('form');
        form.addEventListener('submit', logSubmit);

        $(document).ready(function() {


            var myDropzone = new Dropzone("#kt_ecommerce_add_product_media", {
                url: "{{ url('api/upload-temp-file?user_id=' . $u->id) }}", // Set the url for your upload script location
                paramName: "file", // The name that will be used to transfer the file
                maxFiles: 10,
                maxFilesize: 10, // MB
                addRemoveLinks: true,

                accept: function(file, done) {
                    console.log(file);
                    done();
                }
            });

            myDropzone.on("removedfile", function(file) {
                alert('remove triggered');
            });

        });
    </script>
@endsection
