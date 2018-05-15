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
                <li class="nav-item" onclick="scrollToSection('section-about')">
                    <a class="nav-link">About</a>
                </li>

                <li class="nav-item" onclick="scrollToSection('section-services')">
                    <a class="nav-link">Services</a>
                </li>

                <li class="nav-item" onclick="scrollToSection('section-team')">
                    <a class="nav-link">Our Team</a>
                </li>

                <li class="nav-item" onclick="scrollToSection('section-community')">
                    <a class="nav-link">Community</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link">Checkout</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="{{route('login')}}">Sign in</a>
                </li>

                <li class="nav-item" onclick="scrollToSection('section-contact')">
                    <a class="nav-link">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- END Topbar -->