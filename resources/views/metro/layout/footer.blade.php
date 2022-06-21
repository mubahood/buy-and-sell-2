<div class="footer py-4 d-flex flex-lg-column" id="kt_footer">
    <div class="container">
        <div class="row">

            <div class="col-md-2">
                <h2 class="mb-3  my-md-3">More from {{ env('APP_NAME') }}</h2>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Sell Fast</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Membership</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Banner Ads</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Ad Promotions</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Doorstep Delivery</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Staffing solutions</a>
            </div>
            <div class="col-md-2">
                <h2 class="mb-3  my-md-3">Help & Support</h2>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">FAQs</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Stay safe</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Contact Us</a>
            </div>
            <div class="col-md-2">
                <h2 class="mb-3  my-md-3">Follow {{ env('APP_NAME') }}</h2>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Facebook</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Twitter</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Youtube</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Whatsapp</a>
            </div>
            <div class="col-md-2">
                <h2 class="mb-3  my-md-3">About {{ env('APP_NAME') }}</h2>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">About Us</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Careers</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Terms and
                    Conditions</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Privacy policy</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Sitemap</a>
            </div>

            <div class="col-md-4">
                <h2 class="mb-3 my-md-5">Download our app</h2>
                <div class="row">
                    <div class="col-md-6">
                        <a href="javascript:;">
                            <img class="img-fluid" src="{{ url('assets/images/download-apple.png') }}" alt="">
                        </a>
                    </div>
                    <div class="col-md-6">
                        <a href="javascript:;">
                            <img class="img-fluid" src="{{ url('assets/images/download-android.webp') }}"
                                alt="">
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
    {{--  --}}

    <div
        class="container border-top border-primary pt-5 mt-5 d-flex flex-column flex-md-row align-items-center justify-content-between">


        <div class="text-dark order-2 order-md-1">
            <span class="text-muted fw-bold me-1">2022©</span>
            <a href="javascript:;" class="text-gray-800 text-hover-primary">8Technologies</a>
        </div>
        <ul class="menu menu-gray-600 menu-hover-primary fw-bold order-1">
            <li class="menu-item">
                <a href="{{ url('about') }}" class="menu-link px-2">About</a>
            </li>
            <li class="menu-item">
                <a href="javascript:;" class="menu-link px-2">Contact</a>
            </li>
            <li class="menu-item">
                <a href="{{ url('privacy-policy') }}" class="menu-link px-2">Privacy policy</a>
            </li>
        </ul>
    </div>
</div>
