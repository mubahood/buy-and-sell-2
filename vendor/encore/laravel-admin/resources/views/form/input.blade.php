<div class="{{$viewClass['form-group']}} {!! !$errors->has($errorKey) ? '' : 'has-error' !!} fv-row mb-3 mb-md-6 ">

    <label for="{{$id}}" class="{{$viewClass['label']}} control-label d-flex align-items-center fs-5 fw-bold mb-2">{{$label}}</label>

    <div class="{{$viewClass['field']}} ">

        @include('admin::form.error')

        <div class="input-group ">

            {{-- @if ($prepend)
            <span class="input-group-addon">{!! $prepend !!}</span>
            @endif --}}

            <input  class="form-control form-control-lg form-control-solid" {!! $attributes !!} />

            {{-- @if ($append)
                <span class="input-group-addon clearfix">{!! $append !!}</span>
            @endif --}}

            @isset($btn)
                <span class="input-group-btn">
                  {!! $btn !!}
                </span>
            @endisset

        </div>

        @include('admin::form.help-block')

    </div>
</div>

{{-- <div class="fv-row mb-10 fv-plugins-icon-container fv-plugins-bootstrap5-row-invalid">
    <label class="d-flex align-items-center fs-5 fw-bold mb-2">
        <span class="required">App Name</span>
        <i class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip" title="" data-bs-original-title="Specify your unique app name" aria-label="Specify your unique app name"></i>
    </label>
    <input type="text" class="form-control form-control-lg form-control-solid" name="name" placeholder="" value="">
<div class="fv-plugins-message-container invalid-feedback"><div data-field="name" data-validator="notEmpty">App name is required</div></div></div> --}}
