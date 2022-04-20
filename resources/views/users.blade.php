@extends('metro.layout.layout-dashboard')

@section('dashboard-content')
    <div class="card">
        <div class="card-body">
            <div class="card card-p-0 card-flush">
                <div class="card-header align-items-center py-5 gap-2 gap-md-5">
                    <div class="card-title">
                        <!--begin::Search-->
                        <div class="d-flex align-items-center position-relative my-1">
                            <span class="svg-icon svg-icon-1 position-absolute ms-4">...</span>
                            <input type="text" data-kt-filter="search" class="form-control form-control-solid w-250px ps-14"
                                placeholder="Search Report" />
                        </div>
                        <!--end::Search-->
                        <!--begin::Export buttons-->
                        <div id="kt_datatable_example_1_export" class="d-none"></div>
                        <!--end::Export buttons-->
                    </div>
                    <div class="card-toolbar flex-row-fluid justify-content-end gap-5">
                        <!--begin::Export dropdown-->
                        <button type="button" class="btn btn-light-primary" data-kt-menu-trigger="click"
                            data-kt-menu-placement="bottom-end">
                            <span class="svg-icon svg-icon-1 position-absolute ms-4">...</span>
                            Export Report
                        </button>
                        <!--begin::Menu-->
                        <div id="kt_datatable_example_1_export_menu"
                            class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-bold fs-7 w-200px py-4"
                            data-kt-menu="true">
                            <!--begin::Menu item-->
                            <div class="menu-item px-3">
                                <a href="#" class="menu-link px-3" data-kt-export="copy">
                                    Copy to clipboard
                                </a>
                            </div>
                            <!--end::Menu item-->
                            <!--begin::Menu item-->
                            <div class="menu-item px-3">
                                <a href="#" class="menu-link px-3" data-kt-export="excel">
                                    Export as Excel
                                </a>
                            </div>
                            <!--end::Menu item-->
                            <!--begin::Menu item-->
                            <div class="menu-item px-3">
                                <a href="#" class="menu-link px-3" data-kt-export="csv">
                                    Export as CSV
                                </a>
                            </div>
                            <!--end::Menu item-->
                            <!--begin::Menu item-->
                            <div class="menu-item px-3">
                                <a href="#" class="menu-link px-3" data-kt-export="pdf">
                                    Export as PDF
                                </a>
                            </div>
                            <!--end::Menu item-->
                        </div>
                        <!--end::Menu-->
                        <!--end::Export dropdown-->
                    </div>
                </div>
                <div class="card-body">
                    <table class="table align-middle border rounded table-row-dashed fs-6 g-5" id="kt_datatable_example_1">
                        <thead>
                            <!--begin::Table row-->
                            <tr class="text-start text-gray-400 fw-bolder fs-7 text-uppercase">
                                <th class="">ID</th>
                                <th class="">Name</th>
                                <th class="">Email</th>
                                <th class="">Phone number</th>
                                <th class="">Address</th>
                                <th class="">Role</th>
                                <th class="">Actions</th>

                            </tr>
                            <!--end::Table row-->
                        </thead>
                    </table>
                </div>
            </div>


        </div>
    </div>
@endsection

@section('footer')
    <script>
        $(document).ready(function() {


            $('#kt_datatable_example_1').DataTable({
                ajax: {
                    url: 'http://localhost:8888/buy-and-sell-2/api/users',
                    dataSrc: function(json) {
                        return json;
                    }
                },
                columns: [{
                        data: 'id'
                    },
                    {
                        data: 'name'
                    },
                    {
                        data: 'email'
                    },
                    {
                        data: 'phone_number'
                    },
                    {
                        data: 'address'
                    },
                    {
                        data: 'user_type'
                    },
                    {
                        data: null
                    },
                ],
                columnDefs: [{
                    targets: -1,
                    data: null,
                    orderable: false,
                    className: 'text-end',
                    render: function(data, type, row) {
                        return `
                                <a href="javascript:;" class="text-primary" >Edit</a>,
                                <a href="javascript:;" class="text-danger" >Edlete</a>
                        `;
                    },
                }, ]
            });



        });
    </script>
@endsection
