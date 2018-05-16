@extends('layouts.front.app')

@section('content')
<section class="section">
    <div class="container product-in-cart-list">
        @if(!$cartItems->isEmpty())
            <div class="row">
                <div class="col-md-12 content">
                    <div class="box-body">
                        @include('layouts.errors-and-messages')
                    </div>
                    <div class="row">
                        <h3 class="col-md-12"><i class="fa fa-cart-plus"></i> Shopping Cart</h3>
                        <div class="col-12 col-lg-8">
                            <table class="table table-cart">
                                <tbody valign="middle">
                                    @foreach($cartItems as $cartItem)
                                        <tr>
                                            <td>
                                                <form action="{{ route('cart.destroy', $cartItem->rowId) }}" method="post">
                                                    {{ csrf_field() }}
                                                    <input type="hidden" name="_method" value="delete">
                                                    <button onclick="return confirm('Are you sure?')" class="btn btn-danger btn-danger-outline"><i class="fa fa-times"></i></button>
                                                </form>
                                            </td>

                                            <td>
                                                <a href="{{ route('front.get.product', [$cartItem->product->slug]) }}">
                                                    @if(isset($cartItem->cover))
                                                        <img src="{{ asset("storage/$cartItem->cover") }}" alt="{{ $cartItem->name }}">
                                                    @else
                                                        <img src="https://placehold.it/120x120" alt="">
                                                    @endif
                                                </a>
                                            </td>

                                            <td style="width: 40%">
                                                <h5>{{ $cartItem->name }}</h5>
                                                <p>{!! str_limit($cartItem->product->description, 200) !!}</p>
                                            </td>

                                            <td>
                                                <label>Quantity</label>
                                                <form action="{{ route('cart.update', $cartItem->rowId) }}" class="form-inline" method="post">
                                                    {{ csrf_field() }}
                                                    <input type="hidden" name="_method" value="put">
                                                    <div class="input-group">
                                                        <input type="text" name="quantity" value="{{ $cartItem->qty }}" class="form-control" />
                                                        <span class="input-group-btn"><button class="btn btn-success btn-success-outline"><i class="ti-check"></i></button></span>
                                                    </div>
                                                </form>
                                            </td>

                                            <td>
                                                <h4 class="price">{{config('cart.currency')}} {{ number_format($cartItem->price, 2) }}</h4>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <div class="col-12 col-lg-4">
                            <div class="cart-price">
                                <div class="flexbox">
                                    <div>
                                        <p><strong>Subtotal:</strong></p>
                                        @if(isset($shippingFee) && $shippingFee != 0)
                                            <p><strong>Shipping:</strong></p>
                                        @endif
                                        <p><strong>Tax:</strong></p>
                                    </div>

                                    <div>
                                        <p>{{config('cart.currency')}} {{ $subtotal }}</p>
                                        @if(isset($shippingFee) && $shippingFee != 0)
                                            <p>{{config('cart.currency')}} {{ $shippingFee }}</p>
                                        @endif
                                        <p>{{config('cart.currency')}} {{ number_format($tax, 2) }}</p>
                                    </div>
                                </div>

                                <hr>

                                <div class="flexbox">
                                    <div>
                                        <p><strong>Total:</strong></p>
                                    </div>

                                    <div>
                                    <p class="fw-600">{{config('cart.currency')}} {{ $total }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="btn-group pull-right">
                                <a href="{{ route('home') }}" class="btn btn-default"><i class="ti-angle-left fs-9"></i> Continue shopping</a>
                                <a href="{{ route('checkout.index') }}" class="btn btn-primary">Go to checkout <i class="ti-angle-right fs-9"></i></a>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        @else
            <div class="row">
                <div class="col-md-12">
                    <p class="alert alert-warning">No products in cart yet. <a href="{{ route('home') }}">Shop now!</a></p>
                </div>
            </div>
        @endif
    </div>
</section>
@endsection
@section('css')
    <style type="text/css">
        .product-description {
            padding: 10px 0;
        }
        .product-description p {
            line-height: 18px;
            font-size: 14px;
        }
    </style>
@endsection