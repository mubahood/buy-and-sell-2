<?php
use App\Models\Banner;
use App\Models\User;
use App\Models\Category;
$show_logo = true;
$u = auth()->user();
if ($u == null) {
    $u = new User();
}

$acive_classes = ' active bg-light border-bottom border-5 fw-bolder border-primary rounded-0 ';

$banners_all = Banner::all();
$header_categories = Category::all();

$banners_1 = [];
$banners_2 = [];
$banners_3 = [];
$banners_3_tab_active = '';
$banners_2_tab_active = '';
$banners_1_tab_active = '';

$tab_seg = (int) request()->segment(2);
$seg_1 = request()->segment(1);
$seg_2 = request()->segment(2);
$seg = request()->segment(1); //done

foreach ($banners_all as $key => $value) {
    if ($value->id < 17) {
        if ($value->id < 17) {
            $banners_1[] = $value;
            if ($tab_seg == ((int) $value->id)) {
                $banners_1_tab_active = 'my-active-menu';
            }
        }
    } elseif ($value->id < 17 * 2) {
        $banners_2[] = $value;
        if ($tab_seg == ((int) $value->id)) {
            $banners_2_tab_active = 'my-active-menu';
        }
    } elseif ($value->id < 17 * 3) {
        $banners_3[] = $value;
        if ($tab_seg == ((int) $value->id)) {
            $banners_3_tab_active = 'my-active-menu';
        }
    }
}

$is_dashboard = false;
$is_logged_in = false;
$dashboard_segs = ['dashboard'];

if (Auth::check()) {
    $is_logged_in = true;
} else {
    $is_logged_in = false;
}
if (in_array($seg_1, $dashboard_segs)) {
    $is_dashboard = true;
}

?>
<div id="kt_header" style="" class="header d-block">
    <div class="d-none d-md-flex container-xxl  align-items-stretch justify-content-between">
        @if (request()->segment(1) != 'dashboard')
            <div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0 me-lg-15">
                <a href="{{ url('/') }}">
                    <img alt="Logo" src="{{ url('/assets/images/logo-2.png') }}" class="h-30px h-lg-50px" />
                </a>
            </div>
        @endif

        <div class="d-flex align-items-stretch justify-content-between flex-lg-grow-1">

            <div class="d-none d-md-flex align-items-stretch" id="kt_header_nav">

                @if (!$is_dashboard)

                    <div class="align-items-stretch" data-kt-drawer-activate="{default: true, lg: false}"
                        data-kt-drawer-overlay="true" data-kt-drawer-width="{default:'200px', '300px': '250px'}"
                        data-kt-drawer-direction="end" data-kt-drawer-toggle="#kt_header_menu_mobile_toggle"
                        data-kt-swapper="true" data-kt-swapper-mode="prepend"
                        data-kt-swapper-parent="{default: '#kt_body', lg: '#kt_header_nav'}">
                        <!--begin::Menu-->
                        <div class="menu menu-lg-rounded menu-column menu-lg-row menu-state-bg menu-title-gray-700 menu-state-title-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-400 fw-bold my-5 my-lg-0 align-items-stretch"
                            id="#kt_header_menu" data-kt-menu="true">

                            <div data-kt-menu-trigger="hover" data-kt-menu-placement="bottom-start"
                                class="menu-item menu-lg-down-accordion me-lg-1  bg-hover-white bg-white d-none d-md-block mt-3">
                                <span class="menu-link py-3  bg-hover-white bg-white">
                                    <span class="menu-title fw-normal fs-5 lh-1 text-dark">Browse by categories</span>
                                    <span class="menu-arrow d-lg-none"></span>
                                    <span><i class="bi bi-chevron-down fs-3 ms-3 fw-bold h4"></i></span>
                                </span>
                                <div
                                    class="menu-sub menu-sub-lg-down-accordion menu-sub-lg-dropdown w-100 w-lg-600px p-5 p-lg-5 rounded-0">
                                    <!--begin:Row-->
                                    <div class="row" data-kt-menu-dismiss="true">

                                        @foreach ($header_categories as $cat)
                                            @php
                                                $p_id = (int) $cat->parent;
                                            @endphp
                                            @if ($p_id == 0)
                                                <div class="col-lg-4 border-left-lg-1">
                                                    <div class="menu-inline menu-column menu-active-bg">
                                                        <div
                                                            class="menu-item border border-3 border-right-0 border-top-0 border-bottom-0 border-primary p-0">
                                                            <a href="{{ url($cat->slug) }}"
                                                                class="menu-link fw-bolder bg-hover=white bg-white text-hover-primary text-dark $cat->slug">{{ $cat->name }}</a>
                                                        </div>

                                                        @foreach ($cat->kids as $kid)
                                                            <div class="menu-item py-1 bg-white">
                                                                <a href="{{ $cat->slug }}"
                                                                    class="menu-link p-0 bg-white">
                                                                    <span class="menu-bullet bg-white">
                                                                        <span class="bullet bullet-dot"></span>
                                                                    </span>
                                                                    <span class="menu-title">{{ $kid->name }}</span>
                                                                </a>
                                                            </div>
                                                        @endforeach

                                                    </div>
                                                </div>
                                            @endif
                                        @endforeach



                                    </div>
                                    <!--end:Row-->
                                </div>
                            </div>
                            <div class="menu-item d-none d-md-block mt-3"
                                style="   flex-grow: 0;
                    flex-shrink: 0;
                    flex-basis: 80%;">
                                <div class="input-group flex-nowrap">
                                    <span class="input-group-text"><i class="bi bi-search fs-4"></i></span>
                                    <div class="overflow-hidden flex-grow-1">
                                        <select data-allow-clear="true"
                                            class="form-select form-select-md rounded-start-0 " data-control="select2"
                                            data-placeholder="Search for products & sellers" id="select-search">
                                            <option></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                @endif
            </div>

            <div class="d-flex align-items-stretch flex-shrink-0">

                <!--begin::Theme mode-->
                <div class="d-none d-md-flex align-items-center ms-1 ms-lg-3">
                    <div class="d-flex align-items-center ms-1 ms-lg-3" id="kt_header_user_menu_toggle">

                        @if ($is_logged_in)
                            <a href="{{ url('dashboard') }}" class="btn btn-outline btn-outline-primary btn-sm">My
                                Products</a>
                        @else
                            <a href="{{ url('dashboard') }}" class="btn btn-outline btn-outline-primary btn-sm">Sign up
                                |
                                Login</a>
                        @endif


                        <a href="{{ url('dashboard') }}" class="btn btn-primary btn-sm " style="margin-left: .8rem">Sell
                            now</a>
                        <a href="{{ url('dashboard') }}"
                            class="btn btn-icon btn-sm btn-secondary p-0 border border-primary rounded-circle"
                            style="margin-left: .7rem" data-bs-toggle="tooltip" data-bs-trigger="hover"
                            data-bs-dismiss-="click" title="My chats">
                            <i class="bi bi-chat fs-4 text-primary"></i></a>


                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="d-flex d-md-none container-xxl  align-items-stretch justify-content-between">
        @if (request()->segment(1) != 'dashboard')
            <div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0 me-lg-15">
                <a href="{{ url('/') }}">
                    <img alt="Logo" src="{{ url('/assets/images/logo-2.png') }}" class="h-30px h-lg-50px" />
                </a>
            </div>
        @endif

        <div class="d-flex align-items-stretch justify-content-between flex-lg-grow-1">

            <div class="d-none d-md-flex align-items-stretch" id="kt_header_nav">

                @if (!$is_dashboard)

                    <div class="header-menu align-items-stretch" data-kt-drawer="true" data-kt-drawer-name="header-menu"
                        data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true"
                        data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="end"
                        data-kt-drawer-toggle="#kt_header_menu_mobile_toggle" data-kt-swapper="true"
                        data-kt-swapper-mode="prepend"
                        data-kt-swapper-parent="{default: '#kt_body', lg: '#kt_header_nav'}">
                        <!--begin::Menu-->
                        <div class="menu menu-lg-rounded menu-column menu-lg-row menu-state-bg menu-title-gray-700 menu-state-title-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-400 fw-bold my-5 my-lg-0 align-items-stretch"
                            data-kt-menu="true">


                            <div class="menu-item d-md-none ms-3">
                                <h2 class="m-1 p-1 ">Browse by categories </h2>
                                <div class="accordion accordion-icon-toggle py-1 pt-0 mt-0" id="kt_accordion_2">
                                    @foreach ($header_categories as $cat)
                                        <?php
                                        if ($cat->parent > 0) {
                                            continue;
                                        }
                                        $kids = $cat->kids;
                                        $collapsed = ' collapsed ';
                                        $aria_expanded = 'false';
                                        $show = '';
                                        foreach ($kids as $k) {
                                            if ($k->slug == $seg) {
                                                $collapsed = '';
                                                $aria_expanded = 'true';
                                                $show = ' show ';
                                            }
                                        }
                                        
                                        ?>
                                        <div class="mb-0">
                                            <div class="accordion-header py-1 d-flex {{ $collapsed }}"
                                                data-bs-toggle="collapse"
                                                data-bs-target="#menu_accordion_item_{{ $cat->id }}"
                                                aria-expanded="{{ $aria_expanded }}">
                                                <span class="accordion-icon">
                                                    <i class="las la-angle-double-right fs-1"></i>
                                                </span>
                                                <h3 class="fs-4 fw-normal m-0 text-gray-800">{{ $cat->name }}</h3>
                                            </div>
                                            <div id="menu_accordion_item_{{ $cat->id }}"
                                                class="fs-6 collapse  ps-10 {{ $show }}"
                                                data-bs-parent="#kt_accordion_2">
                                                @foreach ($kids as $kid)
                                                    @php
                                                        $active = ' text-gray-600  ';
                                                        if ($kid->slug == $seg) {
                                                            $active = ' text-primary ';
                                                        }
                                                    @endphp
                                                    <a href="{{ url($kid->slug) }}">
                                                        <h4
                                                            class="fs-5 fw-normal m-0 my-1 text-hover-primary {{ $active }}">
                                                            {{ $kid->name }}
                                                        </h4>
                                                    </a>
                                                @endforeach
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>


                        </div>

                    </div>

                @endif
            </div>

            <div class="d-flex align-items-stretch flex-shrink-0">

                <!--begin::Header menu toggle-->
                <div class="d-flex align-items-center d-lg-none ms-2 me-n3" title="Show header menu">
                    <div class="btn btn-icon btn-active-light-primary ">
                        <i class="bi bi-envelope fs-3x text-dark"></i>
                    </div>
                    <div class="btn btn-icon btn-active-light-primary ms-1" id="kt_header_menu_mobile_toggle">
                        <i class="bi bi-list fs-4x text-dark" style="font-weight: 900;"></i>
                    </div>
                </div>
                <!--end::Header menu toggle-->
            </div>
        </div>

    </div>


    <div class="menu-item d-bloc d-md-none pt-2 px-4 bg-white pb-2"
        style="   flex-grow: 0;
                    flex-shrink: 0;
                    flex-basis: 80%;">
        <div class="input-group flex-nowrap ">
            <span class="input-group-text border-primary"><i class="bi bi-search fs-4"></i></span>
            <div class="overflow-hidden flex-grow-1 ">
                <select data-allow-clear="true" class="form-select form-select-md rounded-start-0 border-primary"
                    data-control="select2" data-placeholder="Search for products & sellers" id="select-search-2">
                    <option></option>
                </select>
            </div>
        </div>
    </div> 

</div>



@section('footer')
    <script>
        $(document).ready(function() {

            var base_url = '{{ url('') }}';

            $('#select-search,#select-search-2').select2({
                ajax: {
                    url: base_url + '/api/products',

                    processResults: function(data) {
                        return {
                            results: data
                        };
                    },

                    dataType: 'json'
                },
                templateResult: function(item) {
                    return format(item);
                }
            }).on('change', function(e) {
                var val = $('#select-search').val();
                window.location.href = base_url + "/" + val;
            });

            // // Format options
            const format = (item) => {

                var img = $("<img>", {
                    class: "rounded me-2",
                    width: 40,
                    src: item.img
                });
                var span = $("<span>", {
                    text: " " + item.name
                });
                span.prepend(img);
                return span;
            }

            // // Init Select2 --- more info: https://select2.org/
            // $('#kt_docs_select2_users').select2({
            //     templateResult: function(item) {
            //         return format(item);
            //     }
            // });

        });
    </script>
@endsection
