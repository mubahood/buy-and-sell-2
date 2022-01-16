<div class="row mb-0 pb-2 pt-3 product-card-1 standard pl-2 pr-2 ml-md-2 mr-md-2 bg-light">
    <div class="col-12 col-md-4 p-0">
        <a href="<?= URL::asset('/') ?>{{ $item->slug }}">
            <img class="img-fluid" src={{ $item->get_thumbnail() }} alt="product">
        </a>
    </div>
    <div class="col-8 pl-0 ">
        <div class="product-content pl-0   mr-0 pr-0 ">
            <a href="<?= URL::asset('/') ?>{{ $item->slug }}">
                <h2 class="m-0 h6 product-title" style="font-size: .8rem;  ">{{ $item->name }}</h2>
            </a> 
            <div class="product-info  mt-0 p-0 ">
                <h5 class="product-price h6">{{ config('app.currency') }} {{ number_format($item->price) }}<span>/
                        @if ($item->fixed_price)
                            Fixed
                        @else
                            Negotiable.
                        @endif</span></h5>
            </div>
        </div>
    </div>
</div>
