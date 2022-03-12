<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ Admin::title() }} @if ($header)
            | {{ $header }}
        @endif
    </title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    @if (!is_null($favicon = Admin::favicon()))
        <link rel="shortcut icon" href="{{ $favicon }}">
    @endif

    {!! Admin::css() !!}

    <script src="{{ Admin::jQuery() }}"></script>
    {!! Admin::headerJs() !!}
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="kt_body"
    class="hold-transition {{ config('admin.skin') }} {{ join(' ', config('admin.layout')) }}

header-fixed header-tablet-and-mobile-fixed toolbar-enabled toolbar-fixed aside-enabled aside-fixed
"
    style="--kt-toolbar-height:55px;--kt-toolbar-height-tablet-and-mobile:55px">

    @if ($alert = config('admin.top_alert'))
        <div style="text-align: center;padding: 5px;font-size: 12px;background-color: #ffffd5;color: #ff0000;">
            {!! $alert !!}
        </div>
    @endif

    <div class="d-flex flex-column flex-root">

        <div class="page d-flex flex-row flex-column-fluid">
            @include('admin::partials.sidebar')



            <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
                @include('admin::partials.header')


                <div class="content d-flex flex-column flex-column-fluid pt-0 pb-0" style="background-color: #F5F8FA" id="kt_content">
                    <div class="post d-flex flex-column-fluid" id="kt_post">
                        <!--begin::Container-->
                        <div id="kt_content_container" class="container-xxl">
                            <div id="pjax-container">
                                {!! Admin::style() !!}
                                <div id="app">
                                    @yield('content')
                                </div>
                                {!! Admin::script() !!}
                                {!! Admin::html() !!}
                            </div>
                        </div>
                    </div>
                </div>
                @include('admin::partials.footer')
            </div>


        </div>

    </div>

    <script>
        function LA() {}
        LA.token = "{{ csrf_token() }}";
        LA.user = @json($_user_);
    </script>

    <!-- REQUIRED JS SCRIPTS -->
    {!! Admin::js() !!}

</body>

</html>
