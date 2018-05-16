@if(!empty($products) && !collect($products)->isEmpty())
    <ul class="row text-center list-unstyled">
        @foreach($products as $key => $product)
            <li class="col-12 product-list" style="padding: 20px 0;">
                <div class="single-product row">
                    @if($key % 2 == 0)
                        <div class="product col-6" data-aos="fade-right" data-aos-delay="0">
                            <a href="{{ route('front.get.product', [$product->slug]) }}">
                                @if(isset($product->cover))
                                    <img src="{{ asset("storage/$product->cover") }}" alt="{{ $product->name }}" class="img-bordered img-responsive">
                                @else
                                    <img src="https://placehold.it/263x330" alt="{{ $product->name }}" class="img-bordered img-responsive" />
                                @endif
                            </a>
                        </div>
                    @endif

                    <div class="product-text col-6" data-aos="fade-down" data-aos-delay="0">
                        <h1><a href="{{ route('front.get.product', [$product->slug]) }}">{{ $product->name }}</a></h1>
                        <h4>FROM {{ config('cart.currency') }} {{ number_format($product->price, 2) }}</h4>
                        <small>{!! str_limit($product->description, 200) !!}</small>
                        <div class="vcenter">
                            <div class="centrize">
                                <form action="{{ route('cart.store') }}" class="form-inline" method="post">
                                    {{ csrf_field() }}
                                    <input type="hidden" name="quantity" value="1" />
                                    <input type="hidden" name="product" value="{{ $product->id }}">
                                    <button id="add-to-cart-btn" type="submit" class="btn btn-primary btn-primary-outline btn-lg" data-toggle="modal" data-target="#cart-modal" style="border-radius: 20px">Order <i class="fa fa-arrow-right"></i> </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    @if($key % 2 == 1)
                        <div class="product col-6" data-aos="fade-left" data-aos-delay="0">

                            <a href="{{ route('front.get.product', [$product->slug]) }}">
                                @if(isset($product->cover))
                                    <img src="{{ asset("storage/$product->cover") }}" alt="{{ $product->name }}" class="img-bordered img-responsive">
                                @else
                                    <img src="https://placehold.it/263x330" alt="{{ $product->name }}" class="img-bordered img-responsive" />
                                @endif
                            </a>
                        </div>
                    @endif
                    <!-- Modal -->
                    <div class="modal fade" id="myModal_{{ $product->id }}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                @include('layouts.front.product')
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        @endforeach
        @if($products instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator)
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-left">{{ $products->links() }}</div>
                </div>
            </div>
        @endif
    </ul>
@else
    <p class="alert alert-warning">No products yet.</p>
@endif