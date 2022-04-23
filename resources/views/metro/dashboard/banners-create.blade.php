<?php
use App\Models\Category;
use App\Models\Banner;
$_options = [];
$menus = Category::where([])
    ->orderBy('order', 'Asc')
    ->get();
foreach ($menus as $key => $value) {
    $_options[$value->id] = $value->name;
}

$edit_item = new Banner();
$id = ((int) Request::segment(3));
if ($id > 0) {
    $edit_item = Banner::find($id);
}
if ($edit_item == null) {
    $edit_item = new Banner();
}

?>@extends('metro.layout.layout-dashboard')

@section('header')
    <link rel="stylesheet" href="{{ url('assets/css/vendor/nestable.css') }}">
@endsection


@section('dashboard-content')
    <div class="row">

        <div class="col-md-6">
            <form enctype="multipart/form-data" method="POST" action="{{ url('dashboard/banners') }}"
                class="form-horizontal" accept-charset="UTF-8">
                @csrf

                @if ($id > 0)
                    <input type="hidden" value="{{ $id }}" name="edit">
                @else
                    <input type="hidden" value="{{ $id }}" name="create" value="create">
                @endif
                <div class="card shadow-sm ">
                    <div class="card-header">
                        <h2 class="card-title">Create</h2>
                    </div>

                    <div class="card-body">
                        @include('metro.components.input-select', [
                            'label' => 'Parent Category',
                            'value' => $edit_item->category_id,
                            'options' => $_options,
                            'attributes' => [
                                'name' => 'parent',
                                'type' => 'text',
                            ],
                        ])
                        <br>
                        @include('metro.components.input-text', [
                            'label' => 'Name',
                            'required' => 'required',
                            'value' => $edit_item->name,
                            'attributes' => [
                                'name' => 'name',
                                'type' => 'text',
                            ],
                        ])
                        <br>
                        @include('metro.components.input-text', [
                            'label' => 'Description', 
                            'classes' => 'mt-1',
                            'value' => $edit_item->description,
                            'attributes' => [
                                'name' => 'description',
                                'type' => 'text',
                            ],
                        ])


                        <div class="image-input image-input-empty image-input-outline mb-3 mt-5" data-kt-image-input="true"
                            style="background-image: url({{ url('storage/' . $edit_item->image) }})">
                            <label for="avatar" class="mb-2">Thumbnail</label>
                            <div class="image-input-wrapper w-150px h-150px"></div>
                            <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow"
                                data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                <i class="bi bi-pencil-fill fs-7"></i>
                                <input id="avatar" type="file" name="avatar" accept=".png, .jpg, .jpeg" />
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


                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary float-right">Submit</button>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </div>

    </div>
@endsection
