<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="keywords" content="">

    <title>iminer</title>

    <!-- Styles -->
    <link href="{{asset('css/core.min.css')}}" rel="stylesheet">
    <link href="{{asset('css/thesaas.min.css')}}" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link href="{{asset('css/style.css')}}" rel="stylesheet">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="{{asset('img/apple-touch-icon.png')}}">
    <link rel="icon" href="{{asset('img/logo.png')}}">

    <!--  Open Graph Tags -->
    <meta property="og:title" content="TheSaaS">
    <meta property="og:description" content="A responsive, professional, and multipurpose SaaS, Software, Startup and WebApp landing template powered by Bootstrap 4.">
    <meta property="og:image" content="http://thetheme.io/thesaas/assets/img/og-img.jpg">
    <meta property="og:url" content="http://thetheme.io/thesaas/">
    <meta name="twitter:card" content="summary_large_image">
</head>
<body>

@include('layouts.front.header-cart')

@yield('content')

<script src="{{asset('js/core.min.js')}}"></script>
<script src="{{asset('js/thesaas.min.js')}}"></script>
<script src="{{asset('js/script.js')}}"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
@yield('js')
</body>
</html>