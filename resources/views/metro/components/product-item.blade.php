@php

$_title = isset($title) ? $title : 'No title';
$_img = isset($item) ? $item->get_thumbnail() : 'no_image.jpg';
$_link = isset($item) ? url($item->slug) : 'javascript:;';
@endphp
<a href="{{ $_link }}">
    <div class="product">

        <img data-src="{{ $_img }}" src="no_image.jpg"
            class="img-fluid ml-2 ml-md-5 mr-2 mr-md-5 text-overflow lazy" alt="{{ $_title }}">
        <h3 class="mb-0 mb-md-0 text-gray-800 fw-normal" style="font-size: 14px">{{ $item->name }}</h3>
        <h3 class="mb-2 mb-md-5 text-gray-900 fw-bold" style="font-size: 16px">
            {{ config('app.currency')  }}{{ $item->price }}</h3>
    </div>
</a>
