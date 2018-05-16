@extends('layouts.front.app')

@section('og')
    <meta property="og:type" content="product"/>
    <meta property="og:title" content="{{ $product->name }}"/>
    <meta property="og:description" content="{{ strip_tags($product->description) }}"/>
    @if(!is_null($product->cover))
        <meta property="og:image" content="{{ asset("storage/$product->cover") }}"/>
    @endif
@endsection

@section('content')
<section class="section bb-1">
    <div class="container product">
        @include('layouts.front.product')
    </div>
</section>
@endsection