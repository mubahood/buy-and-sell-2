@extends('metro.layout.layout-auth')
@section('content')
    <form class="form w-100" autocomplete="off" 
        action="{{url('login')}}"
        method="POST"
    >
    @csrf
        <div class="mb-10 text-center">
            <h1 class="fw-100  fs-1">Login to your dashboard</h1>
            <div class="text-gray-400 fw-bold fs-6 mt-10">Don't have account?
                <a href="{{ url('register') }}" class="link-primary fw-bolder">Register
                    here</a>
            </div>
        </div>
 
        <div class="fv-row mb-7">
            @include('metro.components.input-text', [
                'label' => 'Email address or Username',
                'required' => 'required',
                'attributes' => [
                    'name' => 'email',
                    'type' => 'text',
                    'autocomplete' => 'off',
                ],
            ])
        </div>
        <div class="mb-5 fv-row" data-kt-password-meter="true">
            <div class="mb-1">
                @include('metro.components.input-text', [
                    'label' => 'Password',
                    'required' => 'required', 
                    'attributes' => [
                        'name' => 'password_1',
                        'type' => 'password',
                        'autocomplete' => 'off',
                    ],
                ])
            </div>
        </div>
 

        {{-- <div class="fv-row my-5">
            <label class="form-check form-check-custom form-check-solid form-check-inline">
                <input class="form-check-input" type="checkbox" name="toc" value="1" required />
                <span class="form-check-label fw-bold text-gray-700 fs-6">I Agree
                    <a href="javasxript:;" class="ms-1 link-primary">Terms and conditions</a>.</span>
            </label>
        </div> --}}
        <div class="text-center">
            <button type="submit" class="btn btn-lg btn-primary">
                <span class="indicator-label">Login</span>
            </button>
        </div>
    </form>
@endsection
