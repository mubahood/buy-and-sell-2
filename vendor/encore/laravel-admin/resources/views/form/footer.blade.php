<div class="card-footer">

    {{ csrf_field() }}

    {{-- <div class="col-md-{{$width['label']}}">
    </div> --}}

    <div class="row">

        @if (in_array('submit', $buttons))


            <div class="col-7 form-check form-check-custom form-check-solid">
                @foreach ($submit_redirects as $value => $redirect)
                    @if (in_array($redirect, $checkboxes))

                  
                        <label class="form-check-label" style="margin: 5px 10px 5px 10px;">                            


                            <input type="radio" class="form-check-input" name="after-save" value="{{ $value }}"
                            {{ $default_check == $redirect ? 'checked' : '' }}>

                            {{ trans("admin.{$redirect}") }}

                        </label>
                    @endif
                @endforeach

            </div>

            <div class="col">
                <button type="submit" class="btn btn-primary">{{ trans('admin.submit') }}</button>
            </div>

        @endif

        {{-- @if (in_array('reset', $buttons))
        <div class="btn-group pull-left">
            <button type="reset" class="btn btn-warning">{{ trans('admin.reset') }}</button>
        </div>
        @endif --}}
    </div>
</div>
