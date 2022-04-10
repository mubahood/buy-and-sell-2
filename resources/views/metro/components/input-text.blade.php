@php
$_label = isset($label) && !empty($label) ? $label : '';
$_hint = isset($hint) && !empty($hint) ? $hint : '';
$_required = isset($required) && !empty($required) ? $required : '';
$_attributes = isset($attributes) && !empty($attributes) ? $attributes : [];
$_value = isset($value) && !empty($value) ? $value : '';

$_name = $_attributes['name']; 
$_id = $_name;

if(

    old($_name) != null  &&
    strlen(old($_name)) > 0 
){
    $_value = old($_name);
}

//$_id = 'metro_' . rand(100000000, 10000000000);

@endphp
<div class="form-group">

    @if (!empty($label))
        <label for="{{ $_id }}"
            class="form-label fw-bolder text-dark fs-6 {{ $_required }}">{{ $_label }}</label>
    @endif
    <input id="{{ $_id }}" class="form-control form-control form-control-solid"
        @foreach ($_attributes as $key => $value) {{ $key . '=' . $value }} @endforeach {{ $_required }}
        value="{{ $_value }}" />
    @error($_name)
        <div class="text-danger mt-2">{{ $message }}</div>
    @enderror


    @if (!empty($_hint))
        <div class="text-muted mt-2">{{ $_hint }}</div>
    @endif

</div>
