<div class="toolbar" id="kt_toolbar">
    <div id="kt_toolbar_container" class="container-fluid d-flex flex-stack">
        <div data-kt-swapper="true" data-kt-swapper-mode="prepend"
            data-kt-swapper-parent="{default: '#kt_content_container', 'lg': '#kt_toolbar_container'}"
            class="page-title d-flex align-items-center flex-wrap me-3 mb-5 mb-lg-0">
            <h1 class="d-flex text-dark fw-bolder fs-3 align-items-center my-1">Project Users</h1>
            <span class="h-20px border-gray-300 border-start mx-4"></span>
            <ul class="breadcrumb breadcrumb-separatorless fw-bold fs-7 my-1">
                <li class="breadcrumb-item text-muted">
                    <span class="text-muted ">List</span>
                </li>
            </ul>
        </div>
        <div class="d-flex align-items-center gap-2 gap-lg-3">

            @if ($grid->showTools() || $grid->showExportBtn() || $grid->showCreateBtn())
                <div class="box-header with-border">
                    <div class="pull-right">
                        {{-- {!! $grid->renderExportButton() !!} --}}
                        {!! $grid->renderCreateButton() !!}
                    </div>
                    @if ($grid->showTools())
                        {{-- <div class="pull-left">
                            {!! $grid->renderHeaderTools() !!}
                        </div> --}}
                    @endif
                </div>
            @endif
        </div> 
    </div> 
</div> 
<div class=" ">
    <div class="card mb-0 mt-0 ">
        <div class="card-body pl-0  tab-pane fade show active pb-10" >
            <div class="table-responsive">
                <table class="table table-row-bordered align-middle gy-4 gs-9" id="{{ $grid->tableID }}">
                    <thead>
                        <tr>
                            @foreach ($grid->visibleColumns() as $column)
                                <th class="fw-bolder" {!! $column->formatHtmlAttributes() !!}>
                                    {!! $column->getLabel() !!}{!! $column->renderHeader() !!}</th>
                            @endforeach
                        </tr>
                    </thead>

                    @if ($grid->hasQuickCreate())
                        {!! $grid->renderQuickCreate() !!}
                    @endif

                    <tbody class="fw-bold text-gray-800">

                        @if ($grid->rows()->isEmpty() && $grid->showDefineEmptyPage())
                            @include('admin::grid.empty-grid')
                        @endif

                        @foreach ($grid->rows() as $row)
                            <tr {!! $row->getRowAttributes() !!}>
                                @foreach ($grid->visibleColumnNames() as $name)
                                    <td {!! $row->getColumnAttributes($name) !!}>
                                        {!! $row->column($name) !!}
                                    </td>
                                @endforeach
                            </tr>
                        @endforeach
                    </tbody>

                    {!! $grid->renderTotalRow() !!}

                </table>
            </div>

            <div class="box-footer clearfix">
                {!! $grid->paginator() !!}
            </div>

            {!! $grid->renderFooter() !!}

        </div>
   
    </div>

</div>
