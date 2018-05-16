<!-- Topbar -->
<nav class="topbar topbar-inverse topbar-expand-md topbar-sticky">
    <div class="container">

        <div class="topbar-left">
            <button class="topbar-toggler">&#9776;</button>
            <a class="topbar-brand" href="{{route('home')}}">
                <img class="logo-default" src="{{asset('img/logo.png')}}" alt="logo">
                <img class="logo-inverse" src="{{asset('img/logo.png')}}" alt="logo">
            </a>
        </div>


        <div class="topbar-right">
            <ul class="topbar-nav nav">
                @if(auth()->check())
                    <li class="nav-item"><a href="{{ route('accounts') }}"><i class="fa fa-home"></i> My Account</a></li>
                    <li class="nav-item"><a href="{{ route('logout') }}"><i class="fa fa-sign-out"></i> Logout</a></li>
                @else
                    <li class="nav-item"><a href="{{ route('login') }}"> <i class="fa fa-lock"></i> Login</a></li>
                    <li class="nav-item"><a href="{{ route('register') }}"> <i class="fa fa-sign-in"></i> Register</a></li>
                @endif
                <li id="cart" class="nav-item">
                    <a href="{{ route('cart.index') }}" title="View Cart" class="awemenu-icon menu-shopping-cart">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        <span class="cart-number">{{ $cartCount }}</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- END Topbar -->