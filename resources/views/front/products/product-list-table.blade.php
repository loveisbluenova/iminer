<div class="row">
@if(!$products->isEmpty())
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
@endif
</div>