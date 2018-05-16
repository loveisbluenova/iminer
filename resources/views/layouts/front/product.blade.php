
<div class="row">
    <div class="col-12 col-md-6">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide text-center">
                    @if(isset($product->cover))
                    <img src="{{ asset("storage/$product->cover") }}"
                         alt="{{ $product->name }}" />
                    @else
                    <img src="{{ asset("https://placehold.it/180x180") }}"
                         alt="{{ $product->name }}" />
                    @endif
                </div>
                @if(isset($images) && !$images->isEmpty())
                    @foreach($images as $image)
                        <div class="swiper-slide text-center">
                            <img src="{{ asset("storage/$image->src") }}" alt="{{ $product->name }}">
                        </div>
                    @endforeach
                @endif
            </div>
            <div class="swiper-pagination"></div>
        </div>

    </div>


    <div class="col-12 col-md-6">
        <br>
        <h5>{{ $product->name }}</h5>

        <p>
            <span class="lead ml-20">{{ config('cart.currency') }} {{ $product->price }}</span>
        </p>

        <p>{!! $product->description !!}</p>


        <hr>
        @include('layouts.errors-and-messages')
        <form action="{{ route('cart.store') }}" class="form-inline" method="post">
            {{ csrf_field() }}
            @if(isset($productAttributes) && !$productAttributes->isEmpty())
                <div class="form-group">
                    <label for="productAttribute">Choose Combination</label> <br />
                    <select name="productAttribute" id="productAttribute" class="form-control select2">
                        @foreach($productAttributes as $productAttribute)
                            <option value="{{ $productAttribute->id }}">
                                @foreach($productAttribute->attributesValues as $value)
                                    {{ $value->attribute->name }} : {{ ucwords($value->value) }}
                                @endforeach
                                @if(!is_null($productAttribute->price))
                                    ( {{ config('cart.currency') }} {{ $productAttribute->price }})
                                @endif
                            </option>
                        @endforeach
                    </select>
                </div><hr>
            @endif
            <div class="row">
                <div class="col-7 form-group">
                    <input type="text"
                           class="form-control"
                           name="quantity"
                           placeholder="Quantity"
                           value="{{ old('quantity') }}" />
                    <input type="hidden" name="product" value="{{ $product->id }}" />
                </div>
                <div class="col-5 form-group">
                    <button type="submit" class="btn btn-block btn-primary"><i class="fa fa-cart-plus"></i> Add to cart
                    </button>
                </div>
            </div>
        </form>

    </div>
</div>
