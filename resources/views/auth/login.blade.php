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
    <nav class="topbar topbar-inverse topbar-expand-md">
        <div class="container">

            <div class="topbar-left">
                <button class="topbar-toggler">&#9776;</button>
                <a class="topbar-brand" href="{{route('home')}}">
                    <img class="logo-default" src="{{asset('img/logo.png')}}" alt="logo">
                    <img class="logo-inverse" src="{{asset('img/logo.png')}}" alt="logo">
                </a>
            </div>
        </div>
    </nav>
    <hr>
    <!-- Main content -->
    <section class="container content">
        <div class="col-md-12">@include('layouts.errors-and-messages')</div>
        <div class="col-md-4 mx-auto">
            <h2>Login to your account</h2>
            <form action="{{ route('login') }}" method="post" class="form-horizontal">
                {{ csrf_field() }}
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="{{ old('email') }}" class="form-control" placeholder="Email" autofocus>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" value="" class="form-control" placeholder="xxxxx">
                </div>
                <div class="row">
                    <a href="{{route('password.request')}}">I forgot my password</a><br>
                </div>
                <div class="row">
                    <button class="btn btn-default btn-block" type="submit">Login now</button>
                </div>
            </form>
            <div class="row">
                <hr>                
                <a href="{{route('register')}}" class="text-center">No account? Register here.</a>
            </div>
        </div>
    </section>
    <!-- /.content -->
<script src="{{asset('js/core.min.js')}}"></script>
<script src="{{asset('js/thesaas.min.js')}}"></script>
<script src="{{asset('js/script.js')}}"></script>
</body>
</html>