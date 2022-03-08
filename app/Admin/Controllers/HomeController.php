<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\User;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\InfoBox;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        Admin::html('<div class="col-xl-4">
        <!--begin::Mixed Widget 5-->
        <div class="card card-xxl-stretch mb-xl-8">
            <!--begin::Beader-->
            <div class="card-header border-0 py-5">
                <h3 class="card-title align-items-start flex-column">
                    <span class="card-label fw-bolder fs-3 mb-1">Trends</span>
                    <span class="text-muted fw-bold fs-7">Latest trends</span>
                </h3>
                <div class="card-toolbar">
                    <!--begin::Menu-->
                    <button type="button" class="btn btn-sm btn-icon btn-color-primary btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
                        <!--begin::Svg Icon | path: icons/duotune/general/gen024.svg-->
                        <span class="svg-icon svg-icon-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect x="5" y="5" width="5" height="5" rx="1" fill="#000000"></rect>
                                    <rect x="14" y="5" width="5" height="5" rx="1" fill="#000000" opacity="0.3"></rect>
                                    <rect x="5" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3"></rect>
                                    <rect x="14" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3"></rect>
                                </g>
                            </svg>
                        </span>
                        <!--end::Svg Icon-->
                    </button>
                    <!--begin::Menu 3-->
                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-bold w-200px py-3" data-kt-menu="true">
                        <!--begin::Heading-->
                        <div class="menu-item px-3">
                            <div class="menu-content text-muted pb-2 px-3 fs-7 text-uppercase">Payments</div>
                        </div>
                        <!--end::Heading-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-3">
                            <a href="#" class="menu-link px-3">Create Invoice</a>
                        </div>
                        <!--end::Menu item-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-3">
                            <a href="#" class="menu-link flex-stack px-3">Create Payment 
                            <i class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip" title="" data-bs-original-title="Specify a target name for future usage and reference" aria-label="Specify a target name for future usage and reference"></i></a>
                        </div>
                        <!--end::Menu item-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-3">
                            <a href="#" class="menu-link px-3">Generate Bill</a>
                        </div>
                        <!--end::Menu item-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-3" data-kt-menu-trigger="hover" data-kt-menu-placement="right-end">
                            <a href="#" class="menu-link px-3">
                                <span class="menu-title">Subscription</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <!--begin::Menu sub-->
                            <div class="menu-sub menu-sub-dropdown w-175px py-4">
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <a href="#" class="menu-link px-3">Plans</a>
                                </div>
                                <!--end::Menu item-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <a href="#" class="menu-link px-3">Billing</a>
                                </div>
                                <!--end::Menu item-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <a href="#" class="menu-link px-3">Statements</a>
                                </div>
                                <!--end::Menu item-->
                                <!--begin::Menu separator-->
                                <div class="separator my-2"></div>
                                <!--end::Menu separator-->
                                <!--begin::Menu item-->
                                <div class="menu-item px-3">
                                    <div class="menu-content px-3">
                                        <!--begin::Switch-->
                                        <label class="form-check form-switch form-check-custom form-check-solid">
                                            <!--begin::Input-->
                                            <input class="form-check-input w-30px h-20px" type="checkbox" value="1" checked="checked" name="notifications">
                                            <!--end::Input-->
                                            <!--end::Label-->
                                            <span class="form-check-label text-muted fs-6">Recuring</span>
                                            <!--end::Label-->
                                        </label>
                                        <!--end::Switch-->
                                    </div>
                                </div>
                                <!--end::Menu item-->
                            </div>
                            <!--end::Menu sub-->
                        </div>
                        <!--end::Menu item-->
                        <!--begin::Menu item-->
                        <div class="menu-item px-3 my-1">
                            <a href="#" class="menu-link px-3">Settings</a>
                        </div>
                        <!--end::Menu item-->
                    </div>
                    <!--end::Menu 3-->
                    <!--end::Menu-->
                </div>
            </div>
            <!--end::Header-->
            <!--begin::Body-->
            <div class="card-body d-flex flex-column">
                <!--begin::Chart-->
                <div class="mixed-widget-5-chart card-rounded-top" data-kt-chart-color="success" style="height: 150px; min-height: 150px;"><div id="apexchartsosobs57l" class="apexcharts-canvas apexchartsosobs57l apexcharts-theme-light" style="width: 332px; height: 150px;"><svg id="SvgjsSvg1069" width="332" height="150" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1071" class="apexcharts-inner apexcharts-graphical" transform="translate(0, 0)"><defs id="SvgjsDefs1070"><clipPath id="gridRectMaskosobs57l"><rect id="SvgjsRect1074" width="339" height="153" x="-3.5" y="-1.5" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskosobs57l"></clipPath><clipPath id="nonForecastMaskosobs57l"></clipPath><clipPath id="gridRectMarkerMaskosobs57l"><rect id="SvgjsRect1075" width="336" height="154" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1082" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1083" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"></g></g><g id="SvgjsG1091" class="apexcharts-grid"><g id="SvgjsG1092" class="apexcharts-gridlines-horizontal" style="display: none;"><line id="SvgjsLine1094" x1="0" y1="0" x2="332" y2="0" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1095" x1="0" y1="15" x2="332" y2="15" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1096" x1="0" y1="30" x2="332" y2="30" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1097" x1="0" y1="45" x2="332" y2="45" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1098" x1="0" y1="60" x2="332" y2="60" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1099" x1="0" y1="75" x2="332" y2="75" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1100" x1="0" y1="90" x2="332" y2="90" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1101" x1="0" y1="105" x2="332" y2="105" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1102" x1="0" y1="120" x2="332" y2="120" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1103" x1="0" y1="135" x2="332" y2="135" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1104" x1="0" y1="150" x2="332" y2="150" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line></g><g id="SvgjsG1093" class="apexcharts-gridlines-vertical" style="display: none;"></g><line id="SvgjsLine1106" x1="0" y1="150" x2="332" y2="150" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line><line id="SvgjsLine1105" x1="0" y1="1" x2="0" y2="150" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line></g><g id="SvgjsG1076" class="apexcharts-area-series apexcharts-plot-series"><g id="SvgjsG1077" class="apexcharts-series" seriesName="NetxProfit" data:longestSeries="true" rel="1" data:realIndex="0"><path id="SvgjsPath1080" d="M0 150L0 80.76923076923077C23.240000000000002 80.76923076923077 43.160000000000004 80.76923076923077 66.4 80.76923076923077C89.64000000000001 80.76923076923077 109.56 11.538461538461547 132.8 11.538461538461547C156.04 11.538461538461547 175.96 92.3076923076923 199.2 92.3076923076923C222.44 92.3076923076923 242.36 92.3076923076923 265.6 92.3076923076923C288.84000000000003 92.3076923076923 308.76 57.69230769230769 332 57.69230769230769C332 57.69230769230769 332 57.69230769230769 332 150M332 57.69230769230769C332 57.69230769230769 332 57.69230769230769 332 57.69230769230769 " fill="rgba(232,255,243,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMaskosobs57l)" pathTo="M 0 150L 0 80.76923076923077C 23.240000000000002 80.76923076923077 43.160000000000004 80.76923076923077 66.4 80.76923076923077C 89.64000000000001 80.76923076923077 109.56 11.538461538461547 132.8 11.538461538461547C 156.04 11.538461538461547 175.96 92.3076923076923 199.2 92.3076923076923C 222.44 92.3076923076923 242.36 92.3076923076923 265.6 92.3076923076923C 288.84000000000003 92.3076923076923 308.76 57.69230769230769 332 57.69230769230769C 332 57.69230769230769 332 57.69230769230769 332 150M 332 57.69230769230769z" pathFrom="M -1 150L -1 150L 66.4 150L 132.8 150L 199.2 150L 265.6 150L 332 150"></path><path id="SvgjsPath1081" d="M0 80.76923076923077C23.240000000000002 80.76923076923077 43.160000000000004 80.76923076923077 66.4 80.76923076923077C89.64000000000001 80.76923076923077 109.56 11.538461538461547 132.8 11.538461538461547C156.04 11.538461538461547 175.96 92.3076923076923 199.2 92.3076923076923C222.44 92.3076923076923 242.36 92.3076923076923 265.6 92.3076923076923C288.84000000000003 92.3076923076923 308.76 57.69230769230769 332 57.69230769230769C332 57.69230769230769 332 57.69230769230769 332 57.69230769230769 " fill="none" fill-opacity="1" stroke="#50cd89" stroke-opacity="1" stroke-linecap="butt" stroke-width="3" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMaskosobs57l)" pathTo="M 0 80.76923076923077C 23.240000000000002 80.76923076923077 43.160000000000004 80.76923076923077 66.4 80.76923076923077C 89.64000000000001 80.76923076923077 109.56 11.538461538461547 132.8 11.538461538461547C 156.04 11.538461538461547 175.96 92.3076923076923 199.2 92.3076923076923C 222.44 92.3076923076923 242.36 92.3076923076923 265.6 92.3076923076923C 288.84000000000003 92.3076923076923 308.76 57.69230769230769 332 57.69230769230769" pathFrom="M -1 150L -1 150L 66.4 150L 132.8 150L 199.2 150L 265.6 150L 332 150"></path><g id="SvgjsG1078" class="apexcharts-series-markers-wrap" data:realIndex="0"><g class="apexcharts-series-markers"><circle id="SvgjsCircle1112" r="0" cx="0" cy="0" class="apexcharts-marker whz5a5sng no-pointer-events" stroke="#50cd89" fill="#e8fff3" fill-opacity="1" stroke-width="3" stroke-opacity="0.9" default-marker-size="0"></circle></g></g></g><g id="SvgjsG1079" class="apexcharts-datalabels" data:realIndex="0"></g></g><line id="SvgjsLine1107" x1="0" y1="0" x2="332" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1108" x1="0" y1="0" x2="332" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1109" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1110" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1111" class="apexcharts-point-annotations"></g></g><g id="SvgjsG1090" class="apexcharts-yaxis" rel="0" transform="translate(-18, 0)"></g><g id="SvgjsG1072" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend" style="max-height: 75px;"></div><div class="apexcharts-tooltip apexcharts-theme-light"><div class="apexcharts-tooltip-title" style="font-family: inherit; font-size: 12px;"></div><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(232, 255, 243);"></span><div class="apexcharts-tooltip-text" style="font-family: inherit; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light"><div class="apexcharts-xaxistooltip-text" style="font-family: inherit; font-size: 12px;"></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div></div></div>
                <!--end::Chart-->
                <!--begin::Items-->
                <div class="mt-5">
                    <!--begin::Item-->
                    <div class="d-flex flex-stack mb-5">
                        <!--begin::Section-->
                        <div class="d-flex align-items-center me-2">
                            <!--begin::Symbol-->
                            <div class="symbol symbol-50px me-3">
                                <div class="symbol-label bg-light">
                                    <img src="/metronic8/demo1/assets/media/svg/brand-logos/plurk.svg" class="h-50" alt="">
                                </div>
                            </div>
                            <!--end::Symbol-->
                            <!--begin::Title-->
                            <div>
                                <a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bolder">Top Authors</a>
                                <div class="fs-7 text-muted fw-bold mt-1">Ricky Hunt, Sandra Trepp</div>
                            </div>
                            <!--end::Title-->
                        </div>
                        <!--end::Section-->
                        <!--begin::Label-->
                        <div class="badge badge-light fw-bold py-4 px-3">+82$</div>
                        <!--end::Label-->
                    </div>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <div class="d-flex flex-stack mb-5">
                        <!--begin::Section-->
                        <div class="d-flex align-items-center me-2">
                            <!--begin::Symbol-->
                            <div class="symbol symbol-50px me-3">
                                <div class="symbol-label bg-light">
                                    <img src="/metronic8/demo1/assets/media/svg/brand-logos/figma-1.svg" class="h-50" alt="">
                                </div>
                            </div>
                            <!--end::Symbol-->
                            <!--begin::Title-->
                            <div>
                                <a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bolder">Top Sales</a>
                                <div class="fs-7 text-muted fw-bold mt-1">PitStop Emails</div>
                            </div>
                            <!--end::Title-->
                        </div>
                        <!--end::Section-->
                        <!--begin::Label-->
                        <div class="badge badge-light fw-bold py-4 px-3">+82$</div>
                        <!--end::Label-->
                    </div>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <div class="d-flex flex-stack">
                        <!--begin::Section-->
                        <div class="d-flex align-items-center me-2">
                            <!--begin::Symbol-->
                            <div class="symbol symbol-50px me-3">
                                <div class="symbol-label bg-light">
                                    <img src="/metronic8/demo1/assets/media/svg/brand-logos/vimeo.svg" class="h-50" alt="">
                                </div>
                            </div>
                            <!--end::Symbol-->
                            <!--begin::Title-->
                            <div class="py-1">
                                <a href="#" class="fs-6 text-gray-800 text-hover-primary fw-bolder">Top Engagement</a>
                                <div class="fs-7 text-muted fw-bold mt-1">KT.com</div>
                            </div>
                            <!--end::Title-->
                        </div>
                        <!--end::Section-->
                        <!--begin::Label-->
                        <div class="badge badge-light fw-bold py-4 px-3">+82$</div>
                        <!--end::Label-->
                    </div>
                    <!--end::Item-->
                </div>
                <!--end::Items-->
            </div>
            <!--end::Body-->
        </div>
        <!--end::Mixed Widget 5-->
    </div>');

        return $content
            ->title('Dashboard')
            ->description('Description...') 
            ->row(function (Row $row) {

                   $row->column(4, new InfoBox(
                    "All users",
                    'wpforms',
                    'blue',
                    admin_url('/users'),
                    User::count() . " - Users"
                ));
            
            
                   $row->column(4, new InfoBox(
                    "All Products",
                    'wpforms',
                    'blue',
                    admin_url('/products'),
                    Product::count() . " - Products"
                ));
            
            
            });
    }
}
