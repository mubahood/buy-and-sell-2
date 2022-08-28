<div class="footer py-4 d-flex flex-lg-column" id="kt_footer">
    <div class="container">
        <div class="row">
            <div class="col-md-2 mt-2">
                <h2 class="mb-3  my-md-3">More from {{ env('APP_NAME') }}</h2>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Sell Fast</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Membership</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Banner Ads</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Ad Promotions</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Doorstep Delivery</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Staffing solutions</a>
            </div>
            <div class="col-md-2 mt-2">
                <h2 class="mb-3  my-md-3">Help & Support</h2>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">FAQs</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Stay safe</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Contact Us</a>
            </div>
            <div class="col-md-2 mt-2">
                <h2 class="mb-3  my-md-3">Follow {{ env('APP_NAME') }}</h2>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Facebook</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Twitter</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Youtube</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Whatsapp</a>
            </div>
            <div class="col-md-2 mt-2">
                <h2 class="mb-3  my-md-3">About {{ env('APP_NAME') }}</h2>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">About Us</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Careers</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Terms and
                    Conditions</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Privacy policy</a>
                <a href="javascript:;" class="d-block fs-3 text-gray-800 text-hover-primary py-1">Sitemap</a>
            </div>

            <div class="col-md-4 mt-2">
                <h2 class="mb-3 my-md-5">Download our app</h2>
                <div class="row">

                    <div class="col-6  ">
                        <a href="https://play.google.com/store/apps/details?id=jotrace.com" target="_blank">
                            <img class="img-fluid" src="{{ url('assets/images/download-android.webp') }}"
                                alt="">
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
    {{--  --}}


</div>

<div class=" " style="position: fixed;
bottom: 0;
width: 100%; ">

    <div class="row border-top border-primary    w-100 bg-white pt-2">
        <div class="col-4 text-center ">
            <a href="{{ url('about') }}" class="text-center">
                <i class="fa fa-search text-dark" style="font-size: 2rem"></i>
                <span class="d-block" style="font-weight: 800">SEARCH</span></a>
        </div>
        <div class="col-4 text-center ">
            <a href="{{ url('about') }}" class="text-center">
                <i class="fa fa-plus text-dark" style="font-size: 2rem"></i>
                <span class="d-block" style="font-weight: 800">SELL NOW</span></a>
        </div>
        <div class="col-4 text-center ">
            <a href="{{ url('about') }}" class="text-center">
                <i class="fa fa-user text-dark" style="font-size: 2rem"></i>
                <span class="d-block" style="font-weight: 800">My Account</span></a>
        </div>
    </div>


</div>
