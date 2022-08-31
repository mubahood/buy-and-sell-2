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


        <div class="row">
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
                                        <h3 class="fs-5 fw-bolder text-gray-900 mb-1">Add products photos.</h3>
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


                        

                        <div class="mt-3">
                            <label class="form-label fw-normal text-dark fs-3  p-0 m-0 ">Description</label>
                            <div id="kt_ecommerce_add_product_description" name="kt_ecommerce_add_product_description"
                                class="min-h-200px mb-2">
                                {!! $item->description !!}
                            </div>
                            <div class="text-muted fs-7">Set a description to the product for better
                                visibility.
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-9">
                <!--begin::Main column-->
                <div class="d-flex flex-column flex-row-fluid gap-7 gap-md-10">




                    <textarea name="description" id="description" hidden class="form-control hidden"></textarea>
                    <div class="d-flex justify-content-end">
                        <!--begin::Button-->
                        <a href="../../demo1/dist/apps/ecommerce/catalog/products.html" id="kt_ecommerce_add_product_cancel"
                            class="btn btn-light me-5">Cancel</a>
                        <!--end::Button-->
                        <!--begin::Button-->
                        <button type="submit" id="kt_ecommerce_add_product_submit" class="btn btn-primary">
                            <span class="indicator-label">Save Changes</span>
                            <span class="indicator-progress">Please wait...
                                <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                        </button>
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
