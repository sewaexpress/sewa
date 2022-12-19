@extends('layouts.app')

@section('content')

<div class="col-sm-12">
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">{{__('Flash Deal Information')}}</h3>
        </div>

        <!--Horizontal Form-->
        <!--===================================================-->
        <form class="form-horizontal" action="{{ route('flash_deals.update', $flash_deal->id) }}" method="POST" enctype="multipart/form-data">
        	@csrf
            <input type="hidden" name="_method" value="PATCH">
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="name">{{__('Title')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{__('Title')}}" id="name" name="title" value="{{ $flash_deal->title }}" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="background_color">{{__('Background Color')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{__('#0000ff')}}" id="background_color" name="background_color" value="{{ $flash_deal->background_color }}" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label" for="name">{{__('Text Color')}}</label>
                    <div class="col-lg-9">
                        <select name="text_color" id="text_color" class="form-control demo-select2" required>
                            <option value="">Select One</option>
                            <option value="white" @if ($flash_deal->text_color == 'white') selected @endif>{{__('White')}}</option>
                            <option value="dark" @if ($flash_deal->text_color == 'dark') selected @endif>{{__('Dark')}}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="banner">{{__('Banner')}} <small>(1920x500)</small></label>
                    <div class="col-sm-9">
                        <input type="file" id="banner" name="banner" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="start_date">{{__('Date')}}</label>
                    <div class="col-sm-9">
                        <?php
                            $startDate = date('Y-m-d', $flash_deal->start_date);
                            $minutestart = date('h:i',$flash_deal->start_date);
                            $startDate = $startDate.'T'.$minutestart;
                            $endDate = date('Y-m-d', $flash_deal->end_date);
                            $minuteend = date('h:i',$flash_deal->end_date);
                            $endDate = $endDate.'T'.$minuteend;

                        ?>
                        <div id="demo-dp-range">
                            {{-- <input type="datetime-local" value="2018-02-25T19:24:23"/> --}}


                            <input type="datetime-local" class="form-control" name="start_date" value="{{ $startDate }}" id="startDate">
                            <span class="input-group-addon">{{__('to')}}</span>

                            <input type="datetime-local" class="form-control" name="end_date" value="{{ $endDate}}">

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="products">{{__('Products')}}</label>
                    <div class="col-sm-9">
                        <select name="products[]" id="products" class="form-control demo-select2" multiple required data-placeholder="Choose Products">
                            @foreach(\App\Product::where('published',1)->get() as $product)
                                @php
                                    $flash_deal_product = \App\FlashDealProduct::where('flash_deal_id', $flash_deal->id)->where('product_id', $product->id)->first();
                                @endphp
                                <option value="{{$product->id}}" <?php if($flash_deal_product != null) echo "selected";?> >{{__($product->name)}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <br>
                <div class="form-group" id="discount_table">

                </div>
            </div>
            <div class="panel-footer text-right">
                <button class="btn btn-purple" type="submit">{{__('Save')}}</button>
            </div>
        </form>
        <!--===================================================-->
        <!--End Horizontal Form-->

    </div>
</div>

@endsection

@section('script')
    <script type="text/javascript">
        $(function() {
     $("#demo-dp-range .input-daterange").datepicker();
         });
        $(document).ready(function(){

            get_flash_deal_discount();

            $('#products').on('change', function(){
                get_flash_deal_discount();
            });
            // $('#demo-dp-range .input-daterange').datepicker({
            //     startDate: '-0d',
            //     todayBtn: "linked",
            //     autoclose: true,
            //     todayHighlight: true
        	// });
            function get_flash_deal_discount(){
                var product_ids = $('#products').val();
                if(product_ids.length > 0){
                    $.post('{{ route('flash_deals.product_discount_edit') }}', {_token:'{{ csrf_token() }}', product_ids:product_ids, flash_deal_id:{{ $flash_deal->id }}}, function(data){
                        $('#discount_table').html(data);
                        $('.demo-select2').select2();
                    });
                }
                else{
                    $('#discount_table').html(null);
                }
            }
        });
    </script>
@endsection
