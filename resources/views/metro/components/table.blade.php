@php
$rows = isset($rows) && !empty($rows) ? $rows : [];
$head = isset($head) && !empty($head) ? $head : [];
@endphp

@section('tools')
    @include('metro.components.search')
    @if (isset($create_link))
        <a href="{{ $create_link }}" class="btn btn-sm btn-primary">Create</a>
    @endif
@endsection

<div class="card">
    <div class="card-body pt-0">
        <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_customers_table">
            <thead>
                <tr class="text-start text-gray-400 fw-bolder fs-7 text-uppercase gs-0">
                    @foreach ($head as $h)
                        <th>{!! $h !!}</th>
                    @endforeach
                    @if (isset($has_actions) && $has_actions)
                        <th>Actions</th>
                    @endif
                </tr>
            </thead>
            <tbody class="fw-bold text-gray-600">
                @foreach ($rows as $r)
                    @php
                        $id = 0;
                    @endphp
                    <tr>
                        @foreach ($r as $d)
                            @php
                                if ($id == 0) {
                                    $id = $d;
                                    continue;
                                }
                            @endphp
                            <th>{!! $d !!}</th>
                        @endforeach

                        @if (isset($has_actions) && $has_actions)
                            <td class="text-end">
                                <button type="button" class="btn btn-icon   btn-light-primary btn-active-light-primary"
                                    data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
                                    <i class="las la-ellipsis-v fs-1 text-dark"></i>
                                </button>
                                <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-bold fs-7 w-125px py-4"
                                    data-kt-menu="true">

                                    @if (isset($view_link))
                                        <div class="menu-item px-3">
                                            <a href="{{ $view_link }}/{{$r[0]}}" class="menu-link px-3">View</a>
                                        </div>
                                    @endif


                                    @if (isset($edit_link))
                                        <div class="menu-item px-3">
                                            <a href="{{ $edit_link }}/{{$r[0]}}" class="menu-link px-3">Edit</a>
                                        </div>
                                    @endif

                                    @if (isset($delete_link))
                                        <div class="menu-item px-3">
                                            <a href="{{ $delete_link }}/{{$r[0]}}" class="menu-link px-3 text-danger">Delete</a>
                                        </div>
                                    @endif

                                </div>
                            </td>
                        @endif

                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

@section('footer')
    <script>
        $(document).ready(function() {
            var t = $('#kt_customers_table');
            t.DataTable();
            var s = $('#s');
            s.keyup(function(e) {
                t.DataTable().search(e.target.value).draw();
            });
        });
    </script>
@endsection
