<div id="sidebar_men_block" class="sidebar sidebar--style-3 no-border stickyfill p-0">
   <div class="widget mb-0">
      <div class="widget-profile-box text-center p-3">
        <style>
            .modal-backdrop{
                display: none;
            }
            .modal {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
            .code-input {
                /* display: flex; */
                text-align: center;
                margin-bottom: 15px;
            }

            .code-input__digit {
                display: inline-block;
                width: 40px;
                height: 40px;
                border: 1px solid #cccccc;
                border-radius: 4px;
                text-align: center;
                margin-right: 8px;
            }
            .title{
                font-weight:600;
                margin-top:20px;
                font-size:24px
            }
            .otp-form{
                margin-top: 15px;
            }
            .otp-form input{
                display:inline-block;
                width:50px;
                height:50px;
                text-align:center;
            }
            .submit-btn{
                margin-bottom: 25px;
            }

        </style>
          @if(Auth::user())
          {{-- {{dd('hi')}} --}}
           @if (Auth::user()->avatar_original != null)
               @if (file_exists(Auth::user()->avatar_original))
                  <div class="image" style="background-image:url('{{ asset(Auth::user()->avatar_original) }}')"></div>
               @else
                  <img src="{{ asset('frontend/images/user.png') }}" class="image rounded-circle">
               @endif
           @else
               <img src="{{ asset('frontend/images/user.png') }}" class="image rounded-circle">
           @endif
           <div class="name">{{ Auth::user()->name }}</div>
           @endif
           @if (Auth::user()->email_verified_at == '')
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target=".bd-example-modal-md">Verify your Email</button>
           @endif
           
           <div class="modal fade bd-example-modal-md" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
              <div class="modal-content">
                <div class="row">
                    <div class="col-md-12 title">
                        Verify OTP
                      </div>
                    <form class="col-md-12 otp-form" action="{{route('verify.otp')}}" method="post" id="form">
                        @csrf
                        <div class="code-input">
                            <input required type="text" maxlength="1" pattern="\d*" class="code-input__digit">
                            <input required type="text" maxlength="1" pattern="\d*" class="code-input__digit">
                            <input required type="text" maxlength="1" pattern="\d*" class="code-input__digit">
                            <input required type="text" maxlength="1" pattern="\d*" class="code-input__digit">
                            <input required type="text" maxlength="1" pattern="\d*" class="code-input__digit">
                            <input required type="hidden" name="otp" id="code" />
                        </div>
                        <button type="submit" class="btn btn-success submit-btn">Submit</button>
                    </form>

                </div>
              </div>
            </div>
          </div>
         {{-- <div class="image" style="background-image:url('http://durbarmart.nextnepal.org/public/uploads/ucQhvfz4EQXNeTbN8Eif0Cpq5LnOwvg8t7qKNKVs.jpeg')">
         </div>
         <div class="name mb-0">Mr. Seller <span class="ml-2"><i class="fa fa-check-circle" style="color:green"></i></span></div> --}}
      </div>
      <div class="sidebar-widget-title py-3">
       <span>{{__('Menu')}}</span>
      </div>
      <div class="widget-profile-menu py-3">
       <ul class="categories categories--style-3">
           <li>
               <a href="{{ route('dashboard') }}" class="{{ areActiveRoutesHome(['dashboard'])}}">
                   <i class="la la-dashboard"></i>
                   <span class="category-name">
                       {{__('Dashboard')}}
                   </span>
               </a>
           </li>

           {{-- @if(\App\BusinessSetting::where('type', 'classified_product')->first()->value == 1)
           <li>
               <a href="{{ route('customer_products.index') }}" class="{{ areActiveRoutesHome(['customer_products.index', 'customer_products.create', 'customer_products.edit'])}}">
                   <i class="la la-diamond"></i>
                   <span class="category-name">
                       {{__('Classified Products')}}
                   </span>
               </a>
           </li>
           @endif --}}
           @if(Auth::user())
           @php
               $delivery_viewed = App\Order::where('user_id', Auth::user()->id)->where('delivery_viewed', 0)->get()->count();
               $payment_status_viewed = App\Order::where('user_id', Auth::user()->id)->where('payment_status_viewed', 0)->get()->count();
               $refund_request_addon = \App\Addon::where('unique_identifier', 'refund_request')->first();
               $club_point_addon = \App\Addon::where('unique_identifier', 'club_point')->first();
           @endphp
           <li>
               <a href="{{ route('purchase_history.index') }}" class="{{ areActiveRoutesHome(['purchase_history.index'])}}">
                   <i class="la la-file-text"></i>
                   <span class="category-name">
                       {{__('Purchase History')}} @if($delivery_viewed > 0 || $payment_status_viewed > 0)<span class="ml-2" style="color:green"><strong>({{ __('New Notifications') }})</strong></span>@endif
                   </span>
               </a>
           </li>
           @endif
           {{-- <li>
               <a href="{{ route('digital_purchase_history.index') }}" class="{{ areActiveRoutesHome(['digital_purchase_history.index'])}}">
                   <i class="la la-download"></i>
                   <span class="category-name">
                       {{__('Downloads')}}
                   </span>
               </a>
           </li> --}}

           @if ($refund_request_addon != null && $refund_request_addon->activated == 1)
               <li>
                   <a href="{{ route('customer_refund_request') }}" class="{{ areActiveRoutesHome(['customer_refund_request'])}}">
                       <i class="la la-file-text"></i>
                       <span class="category-name">
                           {{__('Sent Refund Request')}}
                       </span>
                   </a>
               </li>
           @endif

           <li>
               <a href="{{ route('wishlists.index') }}" class="{{ areActiveRoutesHome(['wishlists.index'])}}">
                   <i class="la la-heart-o"></i>
                   <span class="category-name">
                       {{__('Wishlist')}}
                   </span>
               </a>
           </li>
           {{-- @if(Auth::user())
            @if (\App\BusinessSetting::where('type', 'conversation_system')->first()->value == 1)
                @php
                    $conversation = \App\Conversation::where('sender_id', Auth::user()->id)->where('sender_viewed', 0)->get();
                @endphp
                <li>
                    <a href="{{ route('conversations.index') }}" class="{{ areActiveRoutesHome(['conversations.index', 'conversations.show'])}}">
                        <i class="la la-comment"></i>
                        <span class="category-name">
                            {{__('Conversations')}}
                            @if (count($conversation) > 0)
                                <span class="ml-2" style="color:green"><strong>({{ count($conversation) }})</strong></span>
                            @endif
                        </span>
                    </a>
                </li>
            @endif
           @endif --}}
           <li>
               <a href="{{ route('profile') }}" class="{{ areActiveRoutesHome(['profile'])}}">
                   <i class="la la-user"></i>
                   <span class="category-name">
                       {{__('Manage Profile')}}
                   </span>
               </a>
           </li>
           @if (\App\BusinessSetting::where('type', 'wallet_system')->first()->value == 1)
               <li>
                   <a href="{{ route('wallet.index') }}" class="{{ areActiveRoutesHome(['wallet.index'])}}">
                       <i class="la la-dollar"></i>
                       <span class="category-name">
                           {{__('My Wallet')}}
                       </span>
                   </a>
               </li>
           @endif
            @if(Auth::user())
           @if ($club_point_addon != null && $club_point_addon->activated == 1)
               <li>
                   <a href="{{ route('earnng_point_for_user') }}" class="{{ areActiveRoutesHome(['earnng_point_for_user'])}}">
                       <i class="la la-dollar"></i>
                       <span class="category-name">
                           {{__('Earning Points')}}
                       </span>
                   </a>
               </li>
           @endif
           @endif

           {{-- @if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated && Auth::user()->affiliate_user != null && Auth::user()->affiliate_user->status)
               <li>
                   <a href="{{ route('affiliate.user.index') }}" class="{{ areActiveRoutesHome(['affiliate.user.index', 'affiliate.payment_settings'])}}">
                       <i class="la la-dollar"></i>
                       <span class="category-name">
                           {{__('Affiliate System')}}
                       </span>
                   </a>
               </li>
           @endif --}}
           @if(Auth::user())
           @php
               $support_ticket = DB::table('tickets')
                           ->where('client_viewed', 0)
                           ->where('user_id', Auth::user()->id)
                           ->count();
           @endphp
           <li>
               <a href="{{ route('support_ticket.index') }}" class="{{ areActiveRoutesHome(['support_ticket.index'])}}">
                   <i class="la la-support"></i>
                   <span class="category-name">
                       {{__('Support Ticket')}} @if($support_ticket > 0)<span class="ml-2" style="color:green"><strong>({{ $support_ticket }} {{ __('New') }})</strong></span></span>@endif
                   </span>
               </a>
           </li>
           @endif
       </ul>
      </div>
   </div>
</div>

@section('script')
    <script>
         $('.code-input__digit').keyup(function() {
            if ($(this).val().length === 1) {
            $(this).next('.code-input__digit').focus();
            }
        });
         $('.submit-btn').on('click',function(event) {
            // event.preventDefault();
  event.stopPropagation();

            let codeValue = '';
            $('.code-input__digit').each(function() {
                codeValue += $(this).val();
            }); 
            $('#code').val(codeValue);
            // console.log('a');
            // return false;
            $(this).submit();
        });
    </script>
@endsection