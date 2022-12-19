@extends('frontend.layouts.app')

@section('content')
  <!--======================================================= HEADER END ======-->
      <!--======================================================= ORDER TOP LIST START ==-->
      <section id="order_list_top">
        <div class="container">
            <div class="row delivery_row_block">
               
                <div class="offset-md-1 offset-0 col-md-2 col-4  text-center ">
                    <div class="img_order_list ">
                       <div class="img_block_icon">
                        <img src="./frontend/assets/images/logo/cart.svg" class="img-fluid" alt="">
                       </div>
                       <div class="content_img ">
                        <h6 class="active-item"> 1.My Cart</h6>
                       </div>
                    </div>
                </div>
                <div class="col-md-2 col-4  text-center">
                    <div class="img_order_list">
                       <div class="img_block_icon">
                        <img src="./frontend/assets/images/map.svg" class="img-fluid" alt="">
                       </div>
                       <div class="content_img">
                        <h6 class=""> 2.Shipping Info</h6>
                       </div>
                    </div>
                </div>
                <div class="col-md-2 col-4  text-center">
                    <div class="img_order_list">
                       <div class="img_block_icon">
                        <img src="./frontend/assets/images/delivery_new.svg" class="img-fluid" alt="">
                       </div>
                       <div class="content_img">
                        <h6 class=""> 3 Delivery Info</h6>
                       </div>
                    </div>
                </div>
                <div class="col-md-2 col-4  text-center">
                    <div class="img_order_list">
                       <div class="img_block_icon">
                        <img src="./frontend/assets/images/payment.svg" class="img-fluid" alt="">
                       </div>
                       <div class="content_img">
                        <h6 class=""> 4. Payment</h6>
                       </div>
                    </div>
                </div>
                <div class="col-md-2 col-4  text-center  mr-xl-5 mr-0 pr-xl-5 pr-0">
                    <div class="img_order_list">
                       <div class="img_block_icon">
                        <img src="./frontend/assets/images/confirmation.svg" class="img-fluid" alt="">
                       </div>
                       <div class="content_img">
                        <h6 class=""> 5.Confirmation</h6>
                       </div>
                    </div>
                </div>
            </div>
        </div>
     </section>
     <!--======================================================= ORDER TOP LIST END ======-->
     <!--======================================================= CART START ======-->
     <section id="cart_user" class="py-5">
        <div class="container">
          
            <form data-toggle="validator" action="{{ route('checkout.store_shipping_infostore') }}" role="form" method="POST">
                @csrf
           <div class="row">
              <div class="col-xl-8 col-md-12">
                 <div class="row" id="shipping">
                    @foreach (Auth::user()->addresses as $key => $address)
                    <div class="col-md-6">
                       <label class="active card bg-white p-3 ">
                        <input type="radio"  name="address_id" value="{{ $address->id }}" @if ($address->set_default) checked @endif required>
                       <span class="plan-details">
                       <span class="plan-type d-block">Address: <span class="right_bold">{{ $address->address }}</span> </span>
                       <span class="plan-type d-block">Postal Code: <span>{{ $address->postal_code }}</span> </span>
                       <span class="plan-type d-block">City:<span class="right_bold">{{ $address->city }}</span> </span>
                       <span class="plan-type d-block">Country: <span class="right_bold">{{ $address->country }}</span> </span>
                       <span class="plan-type d-block">Phone: <span class="right_bold">{{ $address->phone }}</span> </span>
                       </span>
                       </label>
                    </div>
                    @endforeach
                   <div class="col-md-6">
                    <button type="button" class="btn add_btn_img" data-toggle="modal" data-target="#spipping_add">
                       <img src="https://image.flaticon.com/icons/png/512/1104/1104261.png" alt="" class="img-fluid"> 
                     </button>
                   </div>
                 </div>

                 <div class="row">
                    <div class="col-md-12 mb-3 mb-md-">
                       <div class="button_block d-flex justify-content-between align-items-center mb-4 mb-md-0">
                          <a href=""> <span><i class="fa fa-reply-all"></i></span> Return to shop</a>
                          <!-- <a href="" class="btn_custom">Continue to Shipping</a> -->
                          <button type="submit" class="btn_custom">Continue to Delivery Info
                          </button>
                       </div>
                    </div>
                 </div> 
              </div>
            </form>
              @include('frontend.partials.cart_summary')
           </div>
           
        </div>
     </section>
     <!--======================================================= CART END ======-->
 <!-- SHIPPING ADDRESS ADD MODAL START -->
 <!-- Modal -->
 <div class="modal fade" id="spipping_add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Add Address</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body p-0">
          <div class="row mx-1">
             <div class="col-md-12">
                <form action="{{ route('addresses.store') }}" method="POST">
                    @csrf
                   <div class="row bg-white pb-4">
                      <div class="col-md-6">
                         <label for="" class="text_gray mt-3">Address</label>
                         <input type="text" class="form-control w-100" placeholder="Address" name="address">
                      </div>
                      <div class="col-md-6">
                         <label for="" class="text_gray mt-3">Country</label>
                         <input type="text" class="form-control w-100" placeholder="Country" name="country">
                      </div>
                      <div class="col-md-6">
                         <label for="" class="text_gray mt-3">City</label>
                         <input type="text" class="form-control w-100" placeholder="Your City" name="city">
                      </div>
                      <div class="col-md-6">
                         <label for="" class="text_gray mt-3">Postal code</label>
                         <input type="text" class="form-control w-100" placeholder="Your Postal Code" name="postal_code">
                      </div>
                      <div class="col-md-6">
                         <label for="" class="text_gray mt-3">Phone</label>
                         <input type="text" class="form-control w-100" placeholder="9840000000" name="phone">
                      </div>
                      <div class="col-md-6">
                         <button type="submit" class="btn-custom rounded-0 mt-md-5 mt-3">Save</button>
                      </div>
                   </div>
                </form>
             </div>
            
          </div>
        </div>
        
      </div>
    </div>
  </div>
       <!-- SHIPPING ADDRESS ADD MODAL END -->
@endsection