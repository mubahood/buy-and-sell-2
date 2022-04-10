@php
$_label = isset($label) && !empty($label) ? $label : '';
$_hint = isset($hint) && !empty($hint) ? $hint : '';
$_value = isset($value) && !empty($value) ? $value : '';
$_required = isset($required) && !empty($required) ? $required : '';
$_attributes = isset($attributes) && !empty($attributes) ? $attributes : [];
$_options = isset($options) && !empty($options) ? $options : [];
//$_id = 'metro_' . rand(100000000, 10000000000);
$_name = $_attributes['name'];
$_id = $_name;


if(
    old($_name) != null  &&
    strlen(old($_name)) > 0 
){
    $_value = old($_name);
}


@endphp
<div class="form-group">

    @if (!empty($label))
        <label for="{{ $_id }}"
            class="form-label fw-bolder text-dark fs-6 {{ $_required }}">{{ $_label }}</label>
    @endif

    <select id="{{ $_id }}" class="form-select form-control form-select-solid" data-control="select2"
        data-placeholder="Select an option"
        @foreach ($_attributes as $key => $value) {{ $key . '=' . $value }} @endforeach {{ $_required }}
        value="{{ old($_name) }}">
        <option></option>

        @foreach ($_options as $key => $value)
            @php
                $selected = "";
                if($_value == $key){
                    $selected = "selected";
                }
            @endphp
            <option value="{{ $key }}" {{$selected}}>{{ $value }}</option>
        @endforeach

    </select>

    @error($_name)
        <div class="text-danger mt-2">{{ $message }}</div>
    @enderror

    @if (!empty($_hint))
        <div class="text-muted mt-2">{{ $_hint }}</div>
    @endif

</div>
