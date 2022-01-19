@extends('layouts.layout')
@section('head')
    <link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/user-form.css') }}">
@endsection
@section('content')

    <body>
        <section class="user-form-part">
            <div class="user-form-banner">
                <div class="user-form-content"><a href="#"><img src="{{ URL::asset('/assets') }}/images/logo-1.png"
                            alt="logo"></a>
                    <h1>Advertise your products<span>and buy whatever you need</span></h1>
                    <p>across the Uganda.</p>
                </div>
            </div>
            <div class="user-form-category">
                <div class="user-form-header"><a href="#"><img src="{{ URL::asset('/assets') }}/images/logo-2.png"
                            alt="logo"></a><a href="{{ url('') }}"><i class="fas fa-home"></i></a></div>
                <div class="user-form-category-btn">
                    <ul class="nav nav-tabs">
                        <li><a href="#register-tab" class="nav-link active" data-toggle="tab">Password Reset</a></li>
                    </ul>
                </div>
                <div class="tab-pane active" id="register-tab">
                    <div class="user-form-title">
                        <h2>Password Reset</h2>
                        <p>Provide your existing account's email address to where we should send your reset password link.</p>
                    </div>


                    <form method="POST" action="{{ route('password-reset') }}">
                        @csrf

                        <div class="row">
                            <div class="col-12">
                                <div class="form-group"><input type="email" value="{{ old('email') }}"
                                        class="form-control" required placeholder="Enter your email address" name="email">
                                    @error('email')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror

                                </div>
                            </div>
                             
 
                            <div class="col-12">
                                <div class="form-group"><button type="submit" class="btn btn-inline"><i
                                            class="fas fa-user-check"></i><span>SUBMIT</span></button></div>
                            </div>
                        </div>
                    </form>
                    <div class="col-12">
                        <div class="form-group">
                            <div class="custom-control custom-checkbox">Don't have account? <a
                                    href="{{ route('register') }}">Register</a> </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endsection
