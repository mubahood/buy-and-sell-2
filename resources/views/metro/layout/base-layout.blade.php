<!DOCTYPE html>
<html lang="en">

<head>
    <title>{{ config('app.app_slogan') }}</title>
    <meta charset="utf-8" />
    <meta name="description"
        content="{{ config('app.app_slogan') }}" />
    <meta name="keywords"
        content="{{ config('app.app_slogan') }}" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="article" />
    <meta property="og:title"
        content="Metronic - Bootstrap 5 HTML, VueJS, React, Angular &amp; Laravel Admin Dashboard Theme" />
    <meta property="og:url" content="<?=  (url('logo.png')) ?>" />
    <meta property="og:site_name" content="Keenthemes | Metronic" />
    <link rel="canonical" href="<?=  (url('/')) ?>" />
    <link rel="shortcut icon" href="<?=  (url('logo.png')) ?>" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" async/>

    <link href="{{ url('/') }}/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" async/>


    @yield('header')

    <style>
        .my-active-menu {
            border-bottom: var(--bs-blue) 5px solid;
            background-color: rgb(235, 235, 235);
        }

        .menu-link {
            border-radius: 0px !important;
        }

        .product:hover {
            margin: 2px;
            -webkit-box-shadow: 0px 0px 6px 2px #A6A6A6;
            box-shadow: 0px 0px 6px 2px #A6A6A6;
        }

        img.lazy {
            /* width: 700px;
            height: 467px;
            display: block;
 
            background-image: url('images/loading.gif');
            background-repeat: no-repeat;
            background-position: 50% 50%; */
        }

    </style>
</head>

@yield('base-content')


<script src="{{ url('/') }}/assets/js/scripts.bundle.js"></script>
<script>
    $(function() {
        $('.lazy').Lazy({
            // your configuration goes here
            scrollDirection: 'vertical',
            placeholder: '{{ url('no_image.jpg') }}',
            effect: 'fadeIn',
            visibleOnly: true,
            onError: function(element) {
                console.log('error loading ' + element.data('src'));
            }
        });
    });
</script>
@yield('footer')
@yield('footer-2')

</html>
