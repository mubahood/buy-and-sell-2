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
    $parent = (int) $cat->parent;
    if ($parent < 1) {
        foreach ($cat->sub_categories as $_key => $sub_cat) {
            $_categories[$sub_cat->id] = $cat->name . ' - ' . $sub_cat->name;
        }
    }
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

$item = new Product();


?>@extends('metro.layout.layout-dashboard')
@section('header')
@endsection
@section('dashboard-content')
    <form id="form" action="{{ url('dashboard/products') }}" class="form d-flex flex-column flex-lg-row" method="POST"
        enctype="multipart/form-data">
        @csrf

        <input type="hidden" name="task" value="create">

        <div class="row">
            <div class="col-md-3">



                <div class="d-flex flex-column   ">
                    <div class="card card-flush py-4">
                        <div class="card-header">
                            <div class="card-title">
                                <h2>Thumbnail</h2>
                            </div>
                        </div>
                        <div class="card-body text-center pt-0">
                            <div class="image-input image-input-empty image-input-outline mb-3" data-kt-image-input="true"
                                style="background-image: url(assets/media/svg/files/blank-image.svg)">
                                <div class="image-input-wrapper w-150px h-150px"></div>
                                <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                    data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                    <i class="bi bi-pencil-fill fs-7"></i>
                                    <input type="file" name="avatar" accept=".png, .jpg, .jpeg" />
                                    <input type="hidden" name="avatar_remove" />
                                </label>
                                <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                    data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel avatar">
                                    <i class="bi bi-x fs-2"></i>
                                </span>
                                <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                    data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="Remove avatar">
                                    <i class="bi bi-x fs-2"></i>
                                </span>
                            </div>
                            <div class="text-muted fs-7">Set the product thumbnail image. Only *.png, *.jpg and *.jpeg image
                                files
                                are accepted</div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-9">
                <!--begin::Main column-->
                <div class="d-flex flex-column flex-row-fluid gap-7 gap-md-10">
                    <!--begin:::Tabs-->
                    <ul class="nav nav-custom nav-tabs nav-line-tabs nav-line-tabs-2x border-0 fs-4 fw-bold mb-n2">
                        <!--begin:::Tab item-->
                        <li class="nav-item">
                            <a class="nav-link text-active-primary pb-4 active" data-bs-toggle="tab"
                                href="#kt_ecommerce_add_product_general">General</a>
                        </li>
                        <!--end:::Tab item-->
                        <!--begin:::Tab item-->
                        <li class="nav-item">
                            <a class="nav-link text-active-primary pb-4" data-bs-toggle="tab"
                                href="#kt_ecommerce_add_product_advanced">Advanced</a>
                        </li>
                        <!--end:::Tab item-->
                    </ul>
                    <!--end:::Tabs-->
                    <!--begin::Tab content-->

                    <div class="tab-content">
                        <!--begin::Tab pane-->
                        <div class="tab-pane fade show active" id="kt_ecommerce_add_product_general" role="tab-panel">
                            <div class="d-flex flex-column gap-7 gap-lg-10">
                                <!--begin::General options-->
                                <div class="card card-flush py-2">
                                    <!--begin::Card header-->
                                    <div class="card-header">
                                        <div class="card-title">
                                            <h2>General</h2>
                                        </div>
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="mb-3 fv-row">
                                            @include('metro.components.input-text', [
                                                'label' => 'Product Name',
                                                'required' => 'required',
                                                'hint' =>
                                                    'A product name is required and recommended to be unique.',
                                                'classes' => ' form-control-sm mb-0 ',
                                                'value' => $item->name,
                                                'attributes' => [
                                                    'name' => 'name',
                                                    'type' => 'text',
                                                ],
                                            ])
                                        </div>



                                        <div class="row mt-5">
                                            <div class="col-md-4 mb-5">
                                                @include(
                                                    'metro.components.input-select',
                                                    [
                                                        'label' => 'Nature of this offer',
                                                        'value' => $item->nature_of_offer,
                                                        'options' => [
                                                            'For sale' => 'For sale',
                                                            'For hire' => 'For hire',
                                                        ],
                                                        'hint' => 'For sale or for hire?',
                                                        'classes' => ' form-select-sm mb-0 ',
                                                        'attributes' => [
                                                            'name' => 'nature_of_offer',
                                                        ],
                                                    ]
                                                )
                                            </div>
                                            <div class="col-md-4 mb-5">
                                                @include('metro.components.input-text', [
                                                    'label' => 'Price',
                                                    'required' => 'required',
                                                    'hint' => 'Unit price',
                                                    'classes' => ' form-control-sm ',
                                                    'value' => $item->get_price(),
                                                    'attributes' => [
                                                        'name' => 'price',
                                                        'type' => 'number',
                                                    ],
                                                ])
                                            </div>

                                            <div class="col-md-4 mb-5">
                                                @include(
                                                    'metro.components.input-select',
                                                    [
                                                        'label' => 'Nature of this price',
                                                        'required' => 'required',
                                                        'value' => $item->fixed_price,
                                                        'options' => [
                                                            'Fixed price' => 'Fixed price',
                                                            'Negotiable' => 'Negotiable',
                                                        ],
                                                        'hint' => 'For sale or for hire?',
                                                        'classes' => ' form-select-sm mb-0 ',
                                                        'attributes' => [
                                                            'name' => 'fixed_price',
                                                        ],
                                                    ]
                                                )
                                            </div>
                                        </div>


                                        <div class="row mt-0">

                                            <div class="col-md-4 mb-5">
                                                @include('metro.components.input-text', [
                                                    'label' => 'Quantity',
                                                    'required' => 'required',
                                                    'hint' => 'Unit quantity available',
                                                    'classes' => ' form-control-sm ',
                                                    'value' => $item->get_quantity(),
                                                    'attributes' => [
                                                        'name' => 'quantity',
                                                        'min' => '0',
                                                        'type' => 'number',
                                                    ],
                                                ])
                                            </div>


                                            <div class="col-md-4 mb-5">
                                                @include(
                                                    'metro.components.input-select',
                                                    [
                                                        'label' => 'Product category',
                                                        'value' => $item->category_id,
                                                        'required' => 'required',
                                                        'options' => $_categories,
                                                        'hint' => 'Pick a right category',
                                                        'classes' => ' form-select-sm mb-0 ',
                                                        'attributes' => [
                                                            'name' => 'category_id',
                                                        ],
                                                    ]
                                                )
                                            </div>


                                            <div class="col-md-4 mb-5">
                                                @include(
                                                    'metro.components.input-select',
                                                    [
                                                        'label' => 'Product Location',
                                                        'required' => 'required',
                                                        'value' => $item->city_id,
                                                        'options' => $_locations,
                                                        'hint' => 'Where is this product?',
                                                        'classes' => ' form-select-sm mb-0 ',
                                                        'attributes' => [
                                                            'name' => 'city_id',
                                                        ],
                                                    ]
                                                )
                                            </div>
                                        </div>

                                        <div>
                                            <label class="form-label">Description</label>
                                            <div id="kt_ecommerce_add_product_description"
                                                name="kt_ecommerce_add_product_description" class="min-h-200px mb-2">
                                                {!! $item->description !!}
                                            </div>
                                            <div class="text-muted fs-7">Set a description to the product for better
                                                visibility.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-flush py-4">
                                    <div class="card-header">
                                        <div class="card-title">
                                            <h2>Media</h2>
                                        </div>
                                    </div>
                                    <div class="card-body pt-0">
                                        <!--begin::Input group-->
                                        <div class="fv-row mb-2">
                                            <!--begin::Dropzone-->
                                            <div class="dropzone" id="kt_ecommerce_add_product_media">
                                                <!--begin::Message-->
                                                <div class="dz-message needsclick">
                                                    <!--begin::Icon-->
                                                    <i class="bi bi-file-earmark-arrow-up text-primary fs-3x"></i>
                                                    <!--end::Icon-->
                                                    <!--begin::Info-->
                                                    <div class="ms-4">
                                                        <h3 class="fs-5 fw-bolder text-gray-900 mb-1">Drop files here or
                                                            click to
                                                            upload.</h3>
                                                        <span class="fs-7 fw-bold text-gray-400">Upload up to 10
                                                            files</span>
                                                    </div>
                                                    <!--end::Info-->
                                                </div>
                                            </div>
                                            <!--end::Dropzone-->
                                        </div>
                                        <!--end::Input group-->
                                        <!--begin::Description-->
                                        <div class="text-muted fs-7">Set the product media gallery.</div>
                                        <!--end::Description-->
                                    </div>
                                    <!--end::Card header-->
                                </div>

                            </div>
                        </div>
                        <!--end::Tab pane-->
                        <!--begin::Tab pane-->
                        <div class="tab-pane fade" id="kt_ecommerce_add_product_advanced" role="tab-panel">
                            <div class="d-flex flex-column gap-7 gap-lg-10">
                                <!--begin::Inventory-->
                                <div class="card card-flush py-4">
                                    <!--begin::Card header-->
                                    <div class="card-header">
                                        <div class="card-title">
                                            <h2>Inventory</h2>
                                        </div>
                                    </div>
                                    <!--end::Card header-->
                                    <!--begin::Card body-->
                                    <div class="card-body pt-0">
                                        <!--begin::Input group-->
                                        <div class="mb-10 fv-row">
                                            <!--begin::Label-->
                                            <label class="required form-label">SKU</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" name="sku" class="form-control mb-2" placeholder="SKU Number"
                                                value="" />
                                            <!--end::Input-->
                                            <!--begin::Description-->
                                            <div class="text-muted fs-7">Enter the product SKU.</div>
                                            <!--end::Description-->
                                        </div>
                                        <!--end::Input group-->
                                        <!--begin::Input group-->
                                        <div class="mb-10 fv-row">
                                            <!--begin::Label-->
                                            <label class="required form-label">Barcode</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" name="sku" class="form-control mb-2"
                                                placeholder="Barcode Number" value="" />
                                            <!--end::Input-->
                                            <!--begin::Description-->
                                            <div class="text-muted fs-7">Enter the product barcode number.</div>
                                            <!--end::Description-->
                                        </div>
                                        <!--end::Input group-->
                                        <!--begin::Input group-->
                                        <div class="mb-10 fv-row">
                                            <!--begin::Label-->
                                            <label class="required form-label">Quantity</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <div class="d-flex gap-3">
                                                <input type="number" name="shelf" class="form-control mb-2"
                                                    placeholder="On shelf" value="" />
                                                <input type="number" name="warehouse" class="form-control mb-2"
                                                    placeholder="In warehouse" />
                                            </div>
                                            <!--end::Input-->
                                            <!--begin::Description-->
                                            <div class="text-muted fs-7">Enter the product quantity.</div>
                                            <!--end::Description-->
                                        </div>
                                        <!--end::Input group-->
                                        <!--begin::Input group-->
                                        <div class="fv-row">
                                            <!--begin::Label-->
                                            <label class="form-label">Allow Backorders</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <div class="form-check form-check-custom form-check-solid mb-2">
                                                <input class="form-check-input" type="checkbox" value="" />
                                                <label class="form-check-label">Yes</label>
                                            </div>
                                            <!--end::Input-->
                                            <!--begin::Description-->
                                            <div class="text-muted fs-7">Allow customers to purchase products that are out
                                                of
                                                stock.</div>
                                            <!--end::Description-->
                                        </div>
                                        <!--end::Input group-->
                                    </div>
                                    <!--end::Card header-->
                                </div>
                                <!--end::Inventory-->
                                <!--begin::Variations-->
                                <div class="card card-flush py-4">
                                    <!--begin::Card header-->
                                    <div class="card-header">
                                        <div class="card-title">
                                            <h2>Variations</h2>
                                        </div>
                                    </div>
                                    <!--end::Card header-->
                                    <!--begin::Card body-->
                                    <div class="card-body pt-0">
                                        <!--begin::Input group-->
                                        <div class="" data-kt-ecommerce-catalog-add-product="auto-options">
                                            <!--begin::Label-->
                                            <label class="form-label">Add Product Variations</label>
                                            <!--end::Label-->
                                            <!--begin::Repeater-->
                                            <div id="kt_ecommerce_add_product_options">
                                                <!--begin::Form group-->
                                                <div class="form-group">
                                                    <div data-repeater-list="kt_ecommerce_add_product_options"
                                                        class="d-flex flex-column gap-3">
                                                        <div data-repeater-item=""
                                                            class="form-group d-flex flex-wrap gap-5">
                                                            <!--begin::Select2-->
                                                            <div class="w-100 w-md-200px">
                                                                <select class="form-select" name="product_option"
                                                                    data-placeholder="Select a variation"
                                                                    data-kt-ecommerce-catalog-add-product="product_option">
                                                                    <option></option>
                                                                    <option value="color">Color</option>
                                                                    <option value="size">Size</option>
                                                                    <option value="material">Material</option>
                                                                    <option value="style">Style</option>
                                                                </select>
                                                            </div>
                                                            <!--end::Select2-->
                                                            <!--begin::Input-->
                                                            <input type="text" class="form-control mw-100 w-200px"
                                                                name="product_option_value" placeholder="Variation" />
                                                            <!--end::Input-->
                                                            <button type="button" data-repeater-delete=""
                                                                class="btn btn-sm btn-icon btn-light-danger">
                                                                <!--begin::Svg Icon | path: icons/duotune/arrows/arr088.svg-->
                                                                <span class="svg-icon svg-icon-2">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                        height="24" viewBox="0 0 24 24" fill="none">
                                                                        <rect opacity="0.5" x="7.05025" y="15.5356"
                                                                            width="12" height="2" rx="1"
                                                                            transform="rotate(-45 7.05025 15.5356)"
                                                                            fill="black" />
                                                                        <rect x="8.46447" y="7.05029" width="12" height="2"
                                                                            rx="1" transform="rotate(45 8.46447 7.05029)"
                                                                            fill="black" />
                                                                    </svg>
                                                                </span>
                                                                <!--end::Svg Icon-->
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--end::Form group-->
                                                <!--begin::Form group-->
                                                <div class="form-group mt-5">
                                                    <button type="button" data-repeater-create=""
                                                        class="btn btn-sm btn-light-primary">
                                                        <!--begin::Svg Icon | path: icons/duotune/arrows/arr087.svg-->
                                                        <span class="svg-icon svg-icon-2">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                                viewBox="0 0 24 24" fill="none">
                                                                <rect opacity="0.5" x="11" y="18" width="12" height="2"
                                                                    rx="1" transform="rotate(-90 11 18)" fill="black" />
                                                                <rect x="6" y="11" width="12" height="2" rx="1"
                                                                    fill="black" />
                                                            </svg>
                                                        </span>
                                                        <!--end::Svg Icon-->Add another variation
                                                    </button>
                                                </div>
                                                <!--end::Form group-->
                                            </div>
                                            <!--end::Repeater-->
                                        </div>
                                        <!--end::Input group-->
                                    </div>
                                    <!--end::Card header-->
                                </div>
                                <!--end::Variations-->
                                <!--begin::Shipping-->
                                <div class="card card-flush py-4">
                                    <!--begin::Card header-->
                                    <div class="card-header">
                                        <div class="card-title">
                                            <h2>Shipping</h2>
                                        </div>
                                    </div>
                                    <!--end::Card header-->
                                    <!--begin::Card body-->
                                    <div class="card-body pt-0">
                                        <!--begin::Input group-->
                                        <div class="fv-row">
                                            <!--begin::Input-->
                                            <div class="form-check form-check-custom form-check-solid mb-2">
                                                <input class="form-check-input" type="checkbox"
                                                    id="kt_ecommerce_add_product_shipping_checkbox" value="1" />
                                                <label class="form-check-label">This is a physical product</label>
                                            </div>
                                            <!--end::Input-->
                                            <!--begin::Description-->
                                            <div class="text-muted fs-7">Set if the product is a physical or digital item.
                                                Physical
                                                products may require shipping.</div>
                                            <!--end::Description-->
                                        </div>
                                        <!--end::Input group-->
                                        <!--begin::Shipping form-->
                                        <div id="kt_ecommerce_add_product_shipping" class="d-none mt-10">
                                            <!--begin::Input group-->
                                            <div class="mb-10 fv-row">
                                                <!--begin::Label-->
                                                <label class="form-label">Weight</label>
                                                <!--end::Label-->
                                                <!--begin::Editor-->
                                                <input type="text" name="weight" class="form-control mb-2"
                                                    placeholder="Product weight" value="" />
                                                <!--end::Editor-->
                                                <!--begin::Description-->
                                                <div class="text-muted fs-7">Set a product weight in kilograms (kg).</div>
                                                <!--end::Description-->
                                            </div>
                                            <!--end::Input group-->
                                            <!--begin::Input group-->
                                            <div class="fv-row">
                                                <!--begin::Label-->
                                                <label class="form-label">Dimension</label>
                                                <!--end::Label-->
                                                <!--begin::Input-->
                                                <div class="d-flex flex-wrap flex-sm-nowrap gap-3">
                                                    <input type="number" name="width" class="form-control mb-2"
                                                        placeholder="Width (w)" value="" />
                                                    <input type="number" name="height" class="form-control mb-2"
                                                        placeholder="Height (h)" value="" />
                                                    <input type="number" name="length" class="form-control mb-2"
                                                        placeholder="Lengtn (l)" value="" />
                                                </div>
                                                <!--end::Input-->
                                                <!--begin::Description-->
                                                <div class="text-muted fs-7">Enter the product dimensions in centimeters
                                                    (cm).
                                                </div>
                                                <!--end::Description-->
                                            </div>
                                            <!--end::Input group-->
                                        </div>
                                        <!--end::Shipping form-->
                                    </div>
                                    <!--end::Card header-->
                                </div>
                                <!--end::Shipping-->
                                <!--begin::Meta options-->
                                <div class="card card-flush py-4">
                                    <!--begin::Card header-->
                                    <div class="card-header">
                                        <div class="card-title">
                                            <h2>Meta Options</h2>
                                        </div>
                                    </div>
                                    <!--end::Card header-->
                                    <!--begin::Card body-->
                                    <div class="card-body pt-0">
                                        <!--begin::Input group-->
                                        <div class="mb-10">
                                            <!--begin::Label-->
                                            <label class="form-label">Meta Tag Title</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" class="form-control mb-2" name="meta_title"
                                                placeholder="Meta tag name" />
                                            <!--end::Input-->
                                            <!--begin::Description-->
                                            <div class="text-muted fs-7">Set a meta tag title. Recommended to be simple and
                                                precise
                                                keywords.</div>
                                            <!--end::Description-->
                                        </div>
                                        <!--end::Input group-->
                                        <!--begin::Input group-->
                                        <div class="mb-10">
                                            <!--begin::Label-->
                                            <label class="form-label">Meta Tag Description</label>
                                            <!--end::Label-->
                                            <!--begin::Editor-->
                                            <div id="kt_ecommerce_add_product_meta_description"
                                                name="kt_ecommerce_add_product_meta_description" class="min-h-100px mb-2">
                                            </div>
                                            <!--end::Editor-->
                                            <!--begin::Description-->
                                            <div class="text-muted fs-7">Set a meta tag description to the product for
                                                increased
                                                SEO ranking.</div>
                                            <!--end::Description-->
                                        </div>
                                        <!--end::Input group-->
                                        <!--begin::Input group-->
                                        <div>
                                            <!--begin::Label-->
                                            <label class="form-label">Meta Tag Keywords</label>
                                            <!--end::Label-->
                                            <!--begin::Editor-->
                                            <input id="kt_ecommerce_add_product_meta_keywords"
                                                name="kt_ecommerce_add_product_meta_keywords" class="form-control mb-2" />
                                            <!--end::Editor-->
                                            <!--begin::Description-->
                                            <div class="text-muted fs-7">Set a list of keywords that the product is related
                                                to.
                                                Separate the keywords by adding a comma
                                                <code>,</code>between each keyword.
                                            </div>
                                            <!--end::Description-->
                                        </div>
                                        <!--end::Input group-->
                                    </div>
                                    <!--end::Card header-->
                                </div>
                                <!--end::Meta options-->
                            </div>
                        </div>
                        <!--end::Tab pane-->
                    </div>


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
            $description.val($description_field.html());
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
