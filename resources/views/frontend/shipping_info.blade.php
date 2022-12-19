@extends('frontend.layouts.app')

@section('content')

<style>
    .delete-address{
        width: 20px;
    }
</style>
 <div id="page-content">
   <section id="order_list_top">
      <div class="container">
         <div class="row delivery_row_block">
  
            <div class="offset-md-1 offset-0 col-md-2 col-4  text-center ">
               <div class="img_order_list ">
                  <div class="img_block_icon">
                     <img src="{{asset('frontend/assets/images/logo/cart.svg')}}" class="img-fluid" alt="">
                  </div>
                  <div class="content_img ">
                     <h6 class=""> 1.My Cart</h6>
                  </div>
               </div>
            </div>
            <div class="col-md-2 col-4  text-center">
               <div class="img_order_list">
                  <div class="img_block_icon">
                     <img src="{{asset('frontend/assets/images/map.svg')}}" class="img-fluid" alt="">
                  </div>
                  <div class="content_img">
                     <h6 class="active-item"> 2.Shipping Info</h6>
                  </div>
               </div>
            </div>
            <div class="col-md-2 col-4  text-center">
               <div class="img_order_list">
                  <div class="img_block_icon">
                     <img src="{{asset('frontend/assets/images/delivery_new.svg')}}" class="img-fluid" alt="">
                  </div>
                  <div class="content_img">
                     <h6 class=""> 3 Delivery Info</h6>
                  </div>
               </div>
            </div>
            <div class="col-md-2 col-4  text-center">
               <div class="img_order_list">
                  <div class="img_block_icon">
                     <img src="{{asset('frontend/assets/images/payment.svg')}}" class="img-fluid" alt="">
                  </div>
                  <div class="content_img">
                     <h6 class=""> 4. Payment</h6>
                  </div>
               </div>
            </div>
            <div class="col-md-2 col-4  text-center  mr-xl-5 mr-0 pr-xl-5 pr-0">
               <div class="img_order_list">
                  <div class="img_block_icon">
                     <img src="{{asset('frontend/assets/images/confirmation.svg')}}" class="img-fluid" alt="">
                  </div>
                  <div class="content_img">
                     <h6 class=""> 5.Confirmation</h6>
                  </div>
               </div>
            </div>
         </div>
      </div>
  </section>
@php
    $default_location = '';
@endphp
   <section id="cart_user" class="py-5">
       <div class="container">
           <div class="row">
               <div class="col-xl-8 col-md-12">
                   <form class="form-default" data-toggle="validator" action="{{ route('checkout.store_shipping_infostore') }}" role="form" method="POST">
                       @csrf
                           @if(Auth::check())
                               <div class="row" id="shipping">
                                   @foreach (Auth::user()->addresses as $key => $address)
                                       <div class="col-md-6">
                                        @if ($address->set_default)
                                            @php
                                                $default_location = $address;
                                            @endphp
                                        @endif
                                        
                                           <label class="active card bg-white p-3">
                                               <a href="javascript:void(0);" class="delete-address" data-src="{{ route('addresses.destroy', $address->id) }}"><i class="fa fa-trash fa-2x"></i></a>
                                               <input type="radio" class="radio address_id" name="address_id" data-location="{{$address->delivery_location}}" value="{{ $address->id }}" @if ($address->set_default)
                                                   checked
                                               @endif required>
                                                <span class="plan-details">
                                                <span class="plan-type d-block">Address: <span class="right_bold">{{ $address->address }}</span> </span>
                                                {{-- <span class="plan-type d-block">Postal Code: <span>{{ $address->postal_code }}</span> </span> --}}
                                                <span class="plan-type d-block">City:<span class="right_bold">{{ $address->city }}</span> </span>
                                                <span class="plan-type d-block">Delivery Location:
                                                    @php
                                                        if ($address->delivery_location != null) {
                                                            $delivery_location=\App\Location::where('id',$address->delivery_location)->count();
                                                            if($delivery_location > 0){
                                                                $delivery_location=\App\Location::where('id',$address->delivery_location)->first()->toArray();
                                                            }else{
                                                                $delivery_location=[];
                                                            }
                                                        }
                                                        // dd($delivery_location);
                                                    @endphp

                                                    @if ($address->delivery_location != null)
                                                        <span class="right_bold">
                                                            {{(isset($delivery_location) && !empty($delivery_location))?$delivery_location['name']:''}}
                                                        </span>
                                                    @endif 
                                                </span>
                                                <span class="plan-type d-block">
                                                    Country: 
                                                    <span class="right_bold">
                                                        {{ $address->country }}
                                                    </span> 
                                                </span>
                                                <span class="plan-type d-block">Phone: <span class="right_bold">{{ $address->phone }}</span> </span>
                                                </span>
                                           </label>
                                       </div>
                                   @endforeach
                                   <input type="hidden" name="checkout_type" value="logged">

                                    @php
                                        $existing_addresses = \App\Address::where('user_id',Auth::user()->id)->count()
                                    @endphp
                                    @if($existing_addresses >= 3)
                                    @else
                                        <div class="col-md-6">
                                        <button type="button" class="btn add_btn_img" onclick="add_new_address()">
                                            <img src="https://www.mcicon.com/wp-content/uploads/2020/12/Abstract_Add_1-copy.jpg" alt="Add new address" class="img-fluid"> 
                                            
                                        </button>
                                        </div>
                                    @endif

                               </div>
                           @else
                               <div class="card">
                               <div class="card-body">
                                   <div class="row">
                                       <div class="col-md-12">
                                           <div class="form-group">
                                               <label class="control-label">{{__('Name')}}</label>
                                               <input type="text" class="form-control" name="name" placeholder="{{__('Name')}}" required>
                                           </div>
                                       </div>
                                   </div>

                                   <div class="row">
                                       <div class="col-md-12">
                                           <div class="form-group">
                                               <label class="control-label">{{__('Email')}}</label>
                                               <input type="text" class="form-control" name="email" placeholder="{{__('Email')}}" required>
                                           </div>
                                       </div>
                                   </div>

                                   <div class="row">
                                       <div class="col-md-12">
                                           <div class="form-group">
                                               <label class="control-label">{{__('Address')}}</label>
                                               <input type="text" class="form-control" name="address" placeholder="{{__('Address')}}" required>
                                           </div>
                                       </div>
                                   </div>

                                   <div class="row">
                                       <div class="col-md-6">
                                           <div class="form-group">
                                               <label class="control-label">{{__('Select your country')}}</label>
                                               <select class="form-control custome-control" data-live-search="true" name="country">
                                                   @foreach (\App\Country::where('status', 1)->get() as $key => $country)
                                                       <option value="{{ $country->name }}">{{ $country->name }}</option>
                                                   @endforeach
                                               </select>
                                           </div>
                                       </div>
                                       <div class="col-md-6">
                                           <div class="form-group has-feedback">
                                               <label class="control-label">{{__('City')}}</label>
                                               <input type="text" class="form-control" placeholder="{{__('City')}}" name="city" required>
                                           </div>
                                       </div>
                                   </div>

                                   <div class="row">
                                       {{-- <div class="col-md-6">
                                           <div class="form-group has-feedback">
                                               <label class="control-label">{{__('Postal code')}}</label>
                                               <input type="number" min="0" class="form-control" placeholder="{{__('Postal code')}}" name="postal_code" required>
                                           </div>
                                       </div> --}}
                                       <div class="col-md-6">
                                           <div class="form-group has-feedback">
                                               <label class="control-label">{{__('Phone')}}</label>
                                               <input type="number" min="0" class="form-control" placeholder="{{__('Phone')}}" name="phone" required>
                                           </div>
                                       </div>
                                   </div>
                                   <input type="hidden" name="checkout_type" value="guest">
                               </div>
                               </div>
                           @endif
                       <div class="row">
                           <div class="col-md-12 mb-3 mb-md-">
                              <div class="button_block d-flex justify-content-between align-items-center mb-4 mb-md-0">
                                 <a href="{{ route('home') }}"> <span><i class="fa fa-reply-all"></i></span> Return to shop</a>
                                 <button class="btn_custom" type="submit">Continue to Delivery Info
                                 </button>
                              </div>
                           </div>
                       </div>
                   </form>
               </div>

               <div class="col-xl-4 col-md-7 m-auto m-xl-0">
                   @include('frontend.partials.cart_summary')
               </div>
           </div>
       </div>
   </section>
</div>
 <!--======================================================= CART END ======-->

<div class="modal fade" id="new-address-modal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-zoom" role="document">
   <div class="modal-content">
      <div class="modal-header">
            <h6 class="modal-title" id="exampleModalLabel">{{__('New Address')}}</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
      </div>
      <form class="form-default" role="form" action="{{ route('addresses.store') }}" method="POST">
            @csrf
            <div class="modal-body">
               <div class="p-3">
                  <div class="row">
                        <div class="col-md-2">
                           <label>{{__('Country')}}</label>
                        </div>
                        <div class="col-md-10">
                           <div class="mb-3">
                              <select class="form-control mb-3 selectpicker" data-placeholder="{{__('Select your country')}}" name="country" required>
                                    @foreach (\App\Country::where('status', 1)->get() as $key => $country)
                                       <option value="{{ $country->name }}" {{($country->name == 'Nepal')?'selected':''}}>{{ $country->name }}</option>
                                    @endforeach
                              </select>
                           </div>
                        </div>
                  </div>
                  <div class="row">
                      <div class="col-md-2">
                          <label>{{__('District')}}</label>
                      </div>
                      <div class="col-md-10">
                          <div class="mb-3">
                              <select class="form-control mb-3 selectpicker address-district" data-placeholder="{{__('Select your district')}}" name="district.
                              " required>
                              <option selected>Choose a District</option>
                                  @foreach (\App\State::where('country_id','154')->get() as $key => $country)
                                      <option value="{{ $country->id }}">{{ $country->name }}</option>
                                  @endforeach
                              </select>
                          </div>
                      </div>
                  </div>
                    <div class="row">
                        <div class="col-md-2">
                            <label>{{__('Delivery Location')}}</label>
                        </div>
                        <div class="col-md-10">
                            <div class="mb-3">
                                <select class="form-control mb-3 selectpicker address-location" data-placeholder="{{__('Select your country')}}" name="delivery_location" required>
                                    {{-- @foreach (\App\Location::get() as $key => $country)
                                        <option value="{{ $country->id }}">{{ $country->name }}</option>
                                    @endforeach --}}
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                          <div class="col-md-2">
                             <label>{{__('Address')}}</label>
                          </div>
                          <div class="col-md-10">
                             <textarea class="form-control textarea-autogrow mb-3" placeholder="{{__('Your Address')}}" rows="1" name="address" required></textarea>
                          </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-2">
                        <label>{{__('City')}}</label>
                        </div>
                        <div class="col-md-10">
                        <input type="text" class="form-control mb-3" placeholder="{{__('Your City')}}" name="city" value="" required>
                        </div>
                    </div>
                  <div class="row">
                        <div class="col-md-2">
                           <label>{{__('Postal code')}}</label>
                        </div>
                        <div class="col-md-10">
                           <input type="text" class="form-control mb-3" placeholder="{{__('Your Postal Code')}}" name="postal_code" value="">
                        </div>
                  </div>
                  <div class="row">
                        <div class="col-md-2">
                           <label>{{__('Phone')}}</label>
                        </div>
                        <div class="col-md-10">
                           <input type="number" class="form-control mb-3" placeholder="{{__('9801234567')}}" name="phone" value="" maxlength="10" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required>
                        </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="submit" class="btn btn-base-1">{{ __('Save') }}</button>
            </div>
      </form>
   </div>
</div>
</div>

@endsection

@section('script')
<script type="text/javascript">
    function add_new_address(){
        $('#new-address-modal').modal('show');
    }

    $(document).ready(function() {
        $('.delivery').select2();

        $('.delete-address').on('click',function(e){
            e.preventDefault();
            var red = $(this).data('src');
            Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                console.log(result);
                if (result===false) {
                    console.log('no0');
                } else {
                    console.log('asdf');
                    window.location.href = red;
                }
            });
        });
    });
</script>
@endsection
