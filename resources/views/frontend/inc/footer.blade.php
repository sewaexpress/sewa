


{{-- <a href="" class='button_chat'>chat</a>
<a href="#" class='top_btn'><i class="fa fa-angle-up"></i></a> --}}

<!-- FOOTER -->
<style>
   footer li{
      font-size: 14px;
   }
</style>
@php
$generalsetting = \App\GeneralSetting::first();
if($generalsetting->logo != null){
   // $color = ;
   $color = \App\Color::where('id',$generalsetting->frontend_color)->first();
}
else{
   $color = '#007bff';
}
@endphp
<footer style="background-color: {{$color->code}}!important" id="footer" class="footer-bg-color position-relative padding_top pt-5" style="--r1: 130%; --r2: 71.5%">
    <div class="footer-top">
        <div class="container">
            <div class="row cols-xs-space cols-sm-space cols-md-space">

                @php
                     $generalsetting = \App\GeneralSetting::first();
              @endphp
          <div class="col-lg-2 col-6">
             <div class="footer-logo-box text_white">
               <div class="footer-title text_white footer_after">
                  <h4 class="mb-2 mb-md-4 text-white">Follow us on</h4>
                  <ul class="">
                     @if ($generalsetting->facebook != null)
                     <li class="mb-2">
                        <a href="{{ $generalsetting->facebook }}" class="text-white"><i class="fa fa-facebook"
                              aria-hidden="true"></i>&nbsp;Facebook</a>
                     @endif
                     </li>
                     @if ($generalsetting->instagram != null)
                     <li class="mb-2">
                        <a href="{{ $generalsetting->instagram }}" class="text-white"=""=""><i class="fa fa-instagram"
                              aria-hidden="true"></i>&nbsp;Instagram</a>
                     </li>
                     @endif
                     @if ($generalsetting->google_plus != null)
                     <li class="mb-2">
                        <a href="{{ $generalsetting->google_plus }}" class="text-white"=""=""><i class="fa fa-google"
                              aria-hidden="true"></i>&nbsp;Google</a>
                     </li>
                     @endif
                     @if ($generalsetting->twitter != null)
                     <li class="mb-2">
                        <a href="{{ $generalsetting->twitter }}" class="text-white"=""=""><i class="fa fa-twitter"
                              aria-hidden="true"></i>&nbsp;Twitter</a>
                     </li>
                     @endif
                  </ul>
               </div>
             </div>
          </div>
          <div class="col-lg-2 col-6">
            <div class="footer-title text_white footer_after">
               <h4 class="mb-2 mb-md-4 text-white">About us</h4>
               <ul class="text-white">
                   @foreach (\App\Page::all() as $key => $link)
                  <li class="mb-2">
                     <a href="{{ route('custom-pages.show_custom_page',['slug' => $link->slug]) }}" class="text-white"> {{ $link->title }}</a>
                  </li>
                  @endforeach
                  <li class="mb-2">
                     <a href="{{ route('blog') }}" class="text-white"> Blogs</a>
                  </li>
                  <li class="mb-2">
                     <a href="{{ route('career') }}" class="text-white">Career</a>
                  </li>
                  <li class="mb-2">
                     <a href="{{ route('brands.all') }}" class="text-white">Brands</a>
                  </li>
               </ul>
            </div>
         </div>
          <div class="col-lg-2 col-6">
             <div class="footer-title text_white footer_after">
                <h4 class="mb-2 mb-md-4 text-white">Information</h4>
                <ul class="text-white">
                    {{-- @foreach (\App\Link::all() as $key => $link)
                   <li class="mb-2">
                      <a href="{{ $link->url }}" class="text-white"> {{ $link->name }}</a>
                   </li>
                   @endforeach --}}
                   {{-- @foreach (\App\Policy::all() as $key => $link) --}}
                   
                  <li class="mb-2">
                     <a href="{{ route('faq') }}" class="text-white"> FAQ</a>
                  </li>
                     <li class="mb-2">
                        <a href="{{ route('sellerpolicy') }}" class="text-white">
                           {{__('Seller Policy')}}
                        </a>
                     </li>
                     <li class="mb-2">
                        <a href="{{ route('returnpolicy') }}" class="text-white">
                           {{__('Return & Refund Policy')}}
                        </a>
                     </li>
                     <li class="mb-2">
                        <a href="{{ route('terms') }}" class="text-white">
                           {{__('Terms & Conditions')}}
                        </a>
                     </li>
                     <li class="mb-2">
                        <a href="{{ route('privacypolicy') }}" class="text-white">
                           {{__('Privacy Policy')}}
                        </a>
                     </li>
                     {{-- <li class="mb-2">
                        <a href="{{ route('sellerpolicy') }}" class="text-white">
                           {{__('Seller Policy')}}
                        </a>
                     </li> --}}
                   {{-- @endforeach --}}
                </ul>
             </div>
          </div>
          <div class="col-lg-2 col-6">
             <div class="footer-title text_white footer_after">
                <h4 class="text-white mb-2 mb-md-4">My Account</h4>
                <ul>
                    @auth
                    <li class="mb-2">
                        <a href="{{ route('logout') }}" class="text-white">Logout</a>
                     </li>      
                      @else             
                   <li class="mb-2">
                      <a href="{{ route('user.login') }}" class="text-white">Login</a>
                   </li>
                   <li class="mb-2">
                    <a href="{{ route('user.registration') }}" class="text-white">Register</a>
                 </li>
                 @endauth  
                   <li class="mb-2">
                      <a href="{{ route('wishlists.index') }}" class="text-white">My Wishlist</a>
                   </li>
                   <li class="mb-2">
                      <a href="{{ route('orders.track') }}" class="text-white">Track Order</a>
                   </li>     
                </ul>
             </div>
          </div>
          <div class="col-lg-2 col-6">
             <div class="footer-title text_white footer_after">
                <h4 class="text-white mb-2 mb-md-4">Contact</h4>
                <ul>
                  <li class="text-white mb-2">
                     Call us : <a class="text-white" href="tel:{{ $generalsetting->phone }}">{{ $generalsetting->phone }}</a>
                  </li>
                  <li class="text-white mb-2">
                     You can mail us at <a class="text-white" href="mailto:{{ $generalsetting->email }}">{{ $generalsetting->email }}</a>
                  </li>
                  <li class="text-white mb-2">
                     Sewa Express Service Hours:
                  </li>
                  <li class="text-white mb-2">
                     Sunday to Saturday <br>9:30 to 5:30
                  </li>
                  {{-- <li class="text-white mb-2">
                     <a href="{{route('orders.track')}}">Track Order</a>
                  </li> --}}
                  
                   {{-- <li class="text-white mb-2">
                      <span class="pr-3"><i class="fa fa-map-marker" aria-hidden="true"></i></span>{{ $generalsetting->address  }}
                   </li>
                   <li class="text-white mb-2">
                      <a href="tel:+61283870907, +61452145677" class="text-light"><span class="pr-3"><i
                               class="fa fa-phone" aria-hidden="true"></i></span>
                               {{ $generalsetting->phone }}</a>
                   </li>
                   <li>
                      <a href="mailto:{{ $generalsetting->email  }}" class="text-white"><span class="pr-3"><i
                               class="fa fa-envelope-square" aria-hidden="true"></i></span>{{ $generalsetting->email  }}</a>
                   </li> --}}
                </ul>
             </div>
          </div>
          
          <div class="col-lg-2 col-6">
               
            <div class="footer-logo-box text_white">
              <div class="footer-title text_white footer_after">
                 <h4 class="mb-2 mb-md-4 text-white">Download app</h4>
                 <a href="https://play.google.com/store/apps/details?id=com.sewaexpress.customer"><img class="w-100" src="{{asset('uploads/android.png')}}" alt="Download on Android"></a>

                 <a href="#"><img class="w-100" src="{{asset('uploads/apple.png')}}" alt="Download on Apple"></a>
  
              </div>
            </div>
           </div>
       </div>
       <hr />
       <style>
          .footer-image img {
            max-height: 25px;
            min-height: 25px;
            width: 45px;
            object-fit: contain;
            background-color: white;
            padding: 2px;
            }
       </style>
       <div class="row">
         <div class="col-md-6 text-center pb-3 pt-2 d-flex align-items-end">
            <p class="m-0 text-white" style="font-size:.8125rem;">Payment Mode:</p>
               <ul class="footer-image d-flex ml-2">
                  <li class="mr-1">
                     <img src="{{asset('uploads/4.jpg')}}" class="img-fluid ">
                  </li>
                  <li class="mr-1">
                     <img src="{{asset('uploads/3.jpg')}}" class="img-fluid ">
                  </li>
                  <li class="mr-1">
                     <img src="{{asset('uploads/1.jpg')}}" class="img-fluid ">
                  </li>
                  <li class="mr-1">
                     <img src="{{asset('uploads/2.jpg')}}" class="img-fluid ">
                  </li>
                  {{-- <li class="mr-1"><a href=""> <img
                           src="https://www.nicasiabank.com/assets/backend/uploads/nic-asia-bank.png"
                           class="img-fluid "></a></li>
                  <li class="mr-1"><a href=""> <img
                           src="https://www.nicasiabank.com/assets/backend/uploads/nic-asia-bank.png"
                           class="img-fluid "></a></li> --}}

               </ul>
         </div>
          <div class="col-md-6 text-center pb-3 pt-2">
             <p class="mb-0 text-white text-right font-weight-normal">
                Copyright All Right Reserved <?php echo(date("Y")) ?>.
                {{-- <span class="testimonial-title">Power by NEXT NEPAL </span> --}}
             </p>
          </div>
       </div>
    </div>
 </footer>
 <!--=============================FOOTER END  ============================ -->