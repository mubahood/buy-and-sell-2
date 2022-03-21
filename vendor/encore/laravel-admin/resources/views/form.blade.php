<?php
$slug = request()->segment(2);
?><div class="toolbar" id="kt_toolbar">
    <div id="kt_toolbar_container" class="container-fluid d-flex flex-stack">
        <div data-kt-swapper="true" data-kt-swapper-mode="prepend"
            data-kt-swapper-parent="{default: '#kt_content_container', 'lg': '#kt_toolbar_container'}"
            class="page-title d-flex align-items-center flex-wrap me-3 mb-5 mb-lg-0">
            <h1 class="d-flex align-items-center text-dark fw-bolder fs-3 my-1 text-capitalize">{{ $slug }}</h1>
            <span class="h-20px border-gray-300 border-start mx-4"></span>
            <ul class="breadcrumb breadcrumb-separatorless fw-bold fs-7 my-1">
                <li class="breadcrumb-item text-muted">
                    {{ $form->title() }}
                </li>
            </ul>
        </div>
        <div class="d-flex align-items-center gap-2 gap-lg-3">
            {!! $form->renderTools() !!}
        </div>
    </div>
</div>



<div class=" ">
    <div class="card mb-0 mt-0 shadow-sm" style="border-top: solid 4px #009EF7;">
        <div class="card-body pl-0  tab-pane fade show active pb-10">


            <div class="box box-info">
                {!! $form->open() !!}

                <div class="box-body">

                    @if (!$tabObj->isEmpty())
                        @include('admin::form.tab', compact('tabObj'))
                    @else
                        <div class="fields-group">

                            @if ($form->hasRows())
                                @foreach ($form->getRows() as $row)
                                    {!! $row->render() !!}
                                @endforeach
                            @else
                                @foreach ($layout->columns() as $column)
                                    <div class="col-md-{{ $column->width() }}">
                                        @foreach ($column->fields() as $field)
                                            {!! $field->render() !!}
                                        @endforeach
                                    </div>
                                @endforeach
                            @endif
                        </div>
                    @endif

                </div>
                <!-- /.box-body -->

                {!! $form->renderFooter() !!}

                @foreach ($form->getHiddenFields() as $field)
                    {!! $field->render() !!}
                @endforeach

                <!-- /.box-footer -->
                {!! $form->close() !!}
            </div>


        </div>
    </div>
</div>
