<?php

namespace App\Http\Controllers;

use App\Address;
use App\AppReferList;
use App\Blog;
use Illuminate\Http\Request;
use Session;
use Auth;
use Hash;
use App\Category;
use App\FlashDeal;
use App\Brand;
use App\SubCategory;
use App\SubSubCategory;
use App\Product;
use App\PickupPoint;
use App\CustomerPackage;
use App\CustomerProduct;
use App\User;
use App\Seller;
use App\Shop;
use App\Color;
use App\Order;
use App\BusinessSetting;
use App\Career;
use App\Coupon;
use App\Faq;
use App\Http\Controllers\SearchController;
use App\Location;
use App\Lucky;
use App\Models\Policy;
use App\Recommend;
use App\RewardAmount;
use App\RewardRange;
use App\State;
use Carbon\Carbon;
use ImageOptimizer;
use Cookie;
use Exception;
use Response;
use Illuminate\Support\Facades\Auth as FacadesAuth;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat\PercentageFormatter;
use DB;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Validator;

class HomeController extends Controller
{
    public function login()
    {
        if(Auth::check()){
            return redirect()->route('home');
        }
        return view('frontend.user_login');
    }

    public function registration(Request $request)
    {
        if(Auth::check()){
            return redirect()->route('home');
        }
        if($request->has('referral_code')){
            Cookie::queue('referral_code', $request->referral_code, 43200);
        }
        return view('frontend.user_registration');
    }

    // public function user_login(Request $request)
    // {
    //     $user = User::whereIn('user_type', ['customer', 'seller'])->where('email', $request->email)->first();
    //     if($user != null){
    //         if(Hash::check($request->password, $user->password)){
    //             if($request->has('remember')){
    //                 auth()->login($user, true);
    //             }
    //             else{
    //                 auth()->login($user, false);
    //             }
    //             return redirect()->route('dashboard');
    //         }
    //     }
    //     return back();
    // }

    public function cart_login(Request $request)
    {
        $user = User::whereIn('user_type', ['customer', 'seller'])->where('email', $request->email)->first();
        if($user != null){
            updateCartSetup();
            if(Hash::check($request->password, $user->password)){
                if($request->has('remember')){
                    auth()->login($user, true);
                }
                else{
                    auth()->login($user, false);
                }
            }
        }
        return back();
    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the admin dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function admin_dashboard()
    {
        return view('dashboard');
    }

    /**
     * Show the customer/seller dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function resendOTP(Request $request){
        $user = Auth::user();
        try{
            $now = Carbon::parse('now');
            $thirtyMinutesLater = $now->addMinutes(30);
            $otp_code = strval(rand(10000, 99999));
            $otp_expiry = $thirtyMinutesLater;
            $user->otp = $otp_code;
            $user->otp_expiry = $otp_expiry;
            $user->save();

            $user->sendCustomVerificationEmail($otp_code);
            return json_encode(['status' => 'true','message' => 'OTP code was sent to your email.']);
        }catch(Exception $e){
            return json_encode(['status' => 'false','message' => $e->getMessage()]);
        }

    }
    public function verifyOTP(Request $request){
        // dd($_POST);
        $user = Auth::user();
        $otpExpiry = $user->otp_expiry;
        $otp = $request->otp;
        $currentDateTime = Carbon::now();
        $otpExpiry = Carbon::parse($otpExpiry);

        if ($currentDateTime->gt($otpExpiry)) {
            // OTP has expired
            flash(__('OTP code has expired. Please request a new code.'))->error();
            return back();
        } else {
            if ($otp == $user->otp) {
                // OTP matches
                $user->email_verified_at = Carbon::now();
                $user->otp = null;
                $user->otp_expiry = null;
                $user->save();
                flash(__('Congratulations, Your account has been verified'))->success();
                return back();
                // return redirect()->route('dashboard')->with('success', 'Congratulations, Your account has been verified');
                // dd('1');
            } else {
                // OTP does not match
                flash(__('Invalid OTP'))->error();
                return back();
                // dd('2');
            }
        // OTP has not expired
        }
    }
    public function dashboard()
    {
        // $client = new Client();
        // $response = $client->request('GET', 'https://qrcode.tec-it.com/API/QRCode', [
        //     'query' => [
        //         'data' => 'Your QR code data here',
        //         'moduleSize' => '5',
        //         'errorCorrectionLevel' => 'L'
        //     ]
        // ]);
        
        // $response = $client->request('GET', 'https://barcode.tec-it.com/barcode.ashx', [
        //     'query' => [
        //         'data' => 'asd',
        //         'dpi' => '72',
        //         'unit' => '1'
        //     ]
        // ]);
        // $image = $response->getBody()->getContents();
        // return response($image)->header('Content-Type', 'image/png');
        // session()->forget('cart');
        if(Auth::user()->user_type == 'seller'){
            return view('frontend.seller.dashboard');
        }
        elseif(Auth::user()->user_type == 'customer'){            
            if(Auth::user()->referral_code == ''){
                $referral_code = $this->createReferralCode();
            }else{
                $referral_code = Auth::user()->referral_code;
            }
            $reward_amount = RewardAmount::where('user_id',Auth::user()->id)->first();
            $refer_count = AppReferList::where('referrer_user_id',Auth::user()->id)->where('status',null)->count();
            return view('frontend.customer.dashboard',compact('referral_code','reward_amount','refer_count'));
        }
        else {
            abort(404);
        }
    }
    public function redeemReward(){
        $user_id = Auth::user()->id;
        $refer_count = AppReferList::where('referrer_user_id', $user_id)->where('status', null)->count();
        if($refer_count > 0){    
            $reward_amount = RewardAmount::where('user_id', $user_id)->count();
            $business_settings = BusinessSetting::where('type', 'app_refer_point')->first();
            $final_amount = 0;
            if($reward_amount > 0){
                $reward_amount = RewardAmount::where('user_id', $user_id)->first();
                $reward_amount->amount +=  $refer_count * $business_settings->value;
                $final_amount = $reward_amount->amount;
                $reward_amount->save();
            }else{                
                $reward_amount = new RewardAmount;
                $reward_amount->user_id = strval(Auth::user()->id);
                $reward_amount->amount =  $refer_count * $business_settings->value;
                $final_amount = $reward_amount->amount;
                $reward_amount->save();
            }
                
            $refer_count = AppReferList::where('referrer_user_id', $user_id)->update(['status' => 'redeemed']);

            return response()->json([
                'success' => true,
                'message' => 'Successfully Redeemed',
                'data'=> $final_amount,
            ]); 

        }else{       
            $reward_amount = RewardAmount::where('user_id', $user_id)->count();
            $final_amount = 0;
            if($reward_amount > 0){
                $reward_amount = RewardAmount::where('user_id', $user_id)->first();
                $final_amount =  $reward_amount->amount;
            }
            return response()->json([
                'success' => false,
                'message' => 'You have no refers left.',
                'data'=> $final_amount,
            ]); 
        }
    }
    
    public function createReferralCode(){
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $referral_code = substr(Auth::user()->id.(substr(str_shuffle($characters), 0, 6)), 0, 10);
        $validator = Validator::make(['referral_code' => $referral_code], ['referral_code' => 'unique:users']);
        if ($validator->fails()) {
            $this->createReferralCode();
        } else {
            Auth::user()->referral_code = $referral_code;
            Auth::user()->save();
            return $referral_code;
        }

    }
    public function customerAppRefer(){
        if(Auth::user()->referral_code == ''){
            $referral_code = $this->createReferralCode();
        }else{
            $referral_code = Auth::user()->referral_code;
        }
        $list = AppReferList::where('referrer_user_id',Auth::user()->id)->where('status', null)->with('referred_to')->orderBy('id','desc');
        $reward_amount = RewardAmount::where('user_id',Auth::user()->id)->first();
        if($list->count() > 0){
            $list = $list->get()->toArray();
        }else{
            $list = [];
        }
        return view('frontend.app-referral.index', compact('list','referral_code','reward_amount'));

    }
    public function profile(Request $request)
    {
        // dd(Auth::user()->addresses);
        if(Auth::user()->user_type == 'customer'){
            return view('frontend.customer.profile');
        }
        elseif(Auth::user()->user_type == 'seller'){
            return view('frontend.seller.profile');
        }
    }

    public function customer_update_profile(Request $request)
    {
        $user = Auth::user();
        $user->name = $request->name;
        $user->address = $request->address;
        $user->country = $request->country;
        $user->city = $request->city;
        $user->postal_code = $request->postal_code;
        $user->phone = $request->phone;
// dd($_POST);
        if($request->old_password != null && $request->new_password != '' && $request->new_password != null){
            if(($request->new_password == $request->confirm_password)){
                if (Hash::check($request->old_password, $user->password)) { 
                    $user->password = Hash::make($request->new_password);
                }else{               
                    flash(__('Old password doesnot match'))->error();
                    return back();
                }
            }else{            
                flash(__('Passwords donot match'))->error();
                return back();
            }
        }

        if($request->hasFile('photo')){
            $user->avatar_original = $request->photo->store('uploads/users');
        }

        if($user->save()){
            flash(__('Your Profile has been updated successfully!'))->success();
            return back();
        }

        flash(__('Sorry! Something went wrong.'))->error();
        return back();
    }
    public function getLocation(Request $request){
        $district_id = $request->district_id;
        $locations = Location::where('district',$district_id)->count();

        // return Response::json($locations);
        if($locations > 0){
            $locations = Location::where('district',$district_id)->get()->toArray();
            return Response::json($locations);
        }else{
            return Response::json('false');
        }
    }
    public function orderStatus(){
        $user = Auth::user();
        $order = Order::where('user_id', $user->id)->get();
        return view('frontend.customer.order_status', compact('order'));
    }


    public function seller_update_profile(Request $request)
    {
        $user = Auth::user();
        $user->name = $request->name;
        $user->address = $request->address;
        $user->country = $request->country;
        $user->city = $request->city;
        $user->postal_code = $request->postal_code;
        $user->phone = $request->phone;
       
// dd($request->old_password,Hash::make($request->old_password),$user->password);
        if($request->new_password != null && ($request->new_password == $request->confirm_password)){
            if (Hash::check($request->old_password, $user->password)) { 
                $user->password = Hash::make($request->new_password);
            }else{               
                flash(__('Old password doesnot match'))->error();
                return back();
            }
        }else{            
            flash(__('Passwords donot match'))->error();
            return back();
        }

        if($request->hasFile('photo')){
            $user->avatar_original = $request->photo->store('uploads');
        }

        $seller = $user->seller;
        $seller->cash_on_delivery_status = $request->cash_on_delivery_status;
        $seller->bank_payment_status = $request->bank_payment_status;
        $seller->bank_name = $request->bank_name;
        $seller->bank_acc_name = $request->bank_acc_name;
        $seller->bank_acc_no = $request->bank_acc_no;
        $seller->bank_routing_no = $request->bank_routing_no;

        if($user->save() && $seller->save()){
            flash(__('Your Profile has been updated successfully!'))->success();
            return back();
        }

        flash(__('Sorry! Something went wrong.'))->error();
        return back();
    }

    /**
     * Show the application frontend home.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $user = User::where('email', 'munirajrajbanshi5@gmail.com')->first();
        // FacadesAuth::login($user);
        // return view('frontend.seller.dashboard');
        $recommended = [];
        if(Auth::check()){
            $recommended = Recommend::where('user_id',Auth::user()->id)->orderBy('id','desc')->limit(7)->get();
        }
        return view('frontend.index',compact('recommended'));
    }

    public function flash_deal_details($slug)
    {
        $flash_deal = FlashDeal::where('slug', $slug)->with('flash_deal_products')->first();
        if($flash_deal != null)
            return view('frontend.flash_deal_details', compact('flash_deal'));
        else {
            abort(404);
        }
    }

    public function load_featured_section(){
        return view('frontend.partials.featured_products_section');
    }

    public function load_best_selling_section(){
        return view('frontend.partials.best_selling_section');
    }

    public function load_home_categories_section(){
        return view('frontend.partials.home_categories_section');
    }
    public function luckies(){
        $data = Lucky::with('user')->whereHas('user')->orderBy('id','desc')->paginate(100);
        // dd($data);
        return view('luckies.index',compact('data'));
    }
    public function luckiesDestroy($id)
    {
        $order = Lucky::findOrFail($id);
        if ($order != null) {
            $order->delete();
            flash('User has been deleted successfully')->success();
        } else {
            flash('Something went wrong')->error();
        }
        return back();
    }

    public function load_best_sellers_section(){
        return view('frontend.partials.best_sellers_section');
    }

    public function trackOrder(Request $request)
    {
        if($request->has('order_code')){
            $order = Order::where('code', $request->order_code)->first();
            if($order != null){
                return view('frontend.track_order', compact('order'));
            }
        }
        return view('frontend.track_order');
    }

    public function product(Request $request, $slug)
    {
        // $detailedProduct = Session::get($slug);
        // if($detailedProduct === null){
        //     $detailedProduct  = Product::where('slug', $slug)->first();
        //     Session::put($slug, $detailedProduct);
        // }else{
        //     echo 'loaded from session';
        // }
        $detailedProduct  = Product::where('slug', $slug)->first();
        if($detailedProduct!=null && $detailedProduct->published){
            updateCartSetup();
            if(Auth::check()){
                if(Recommend::where('product_id',$detailedProduct->id)->where('user_id',Auth::user()->id)->count() == 0)
                Recommend::create([
                    'product_id' => $detailedProduct->id,
                    'user_id' => Auth::user()->id
                ]);
            }
            if(Session::has('key')){
                // echo '2<br>';
                $old = explode(',',Session::get('key'));
                array_push($old,$detailedProduct->name);
                session(['key' => implode(',',array_unique($old))]);
                Session::save();
            }else{
                session([ 'key' => ($detailedProduct->name)]);
                Session::save();
            }
            if($request->has('product_referral_code')){
                Cookie::queue('product_referral_code', $request->product_referral_code, 43200);
                Cookie::queue('referred_product_id', $detailedProduct->id, 43200);
            }
            $districts = State::where('country_id','154')->get();
            $default_address = [];
            if(Auth::user()){
                $default_address_count = Address::where('user_id',Auth::user()->id)->where('set_default',1)->count();
                if($default_address_count == 0){
                    $address_count = Address::where('user_id',Auth::user()->id)->count();
                    if($address_count > 0){
                        $default_address = Address::where('user_id',Auth::user()->id)->first()->toArray();
                    }
                }else{
                    $default_address = Address::where('user_id',Auth::user()->id)->where('set_default',1)->first()->toArray();                
                }
            }
            // dd('123');
            if($detailedProduct->digital == 1){
                return view('frontend.digital_product_details', compact('detailedProduct','districts','default_address'));
            }
            else {
                return view('frontend.product_details', compact('detailedProduct','districts','default_address'));
            }
            // return view('frontend.product_details', compact('detailedProduct'));
        }
        abort(404);
    }

    public function shop($slug)
    {
        $shop  = Shop::where('slug', $slug)->first();
        if($shop!=null){
            $seller = Seller::where('user_id', $shop->user_id)->first();
            if ($seller->verification_status != 0){
                return view('frontend.seller_shop', compact('shop'));
            }
            else{
                return view('frontend.seller_shop_without_verification', compact('shop', 'seller'));
            }
        }
        abort(404);
    }

    public function filter_shop($slug, $type)
    {
        $shop  = Shop::where('slug', $slug)->first();
        if($shop!=null && $type != null){
            return view('frontend.seller_shop', compact('shop', 'type'));
        }
        abort(404);
    }

    public function listing(Request $request)
    {
        // dd($request->all());
        // $products = filter_products(Product::orderBy('created_at', 'desc'))->paginate(12);
        // return view('frontend.product_listing', compact('products'));
        return $this->search($request);
    }

    public function all_categories(Request $request)
    {
        $categories = Category::all();
        return view('frontend.all_category', compact('categories'));
    }
    public function all_brands(Request $request)
    {
        $categories = Category::all();
        return view('frontend.all_brand', compact('categories'));
    }

    public function show_product_upload_form(Request $request)
    {
        if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated){
            if(Auth::user()->seller->remaining_uploads > 0){
                $categories = Category::all();
                return view('frontend.seller.product_upload', compact('categories'));
            }
            else {
                flash('Upload limit has been reached. Please upgrade your package.')->warning();
                return back();
            }
        }
        $categories = Category::all();
        return view('frontend.seller.product_upload', compact('categories'));
    }

    public function show_product_edit_form(Request $request, $id)
    {
        $categories = Category::all();
        $product = Product::find(decrypt($id));
        return view('frontend.seller.product_edit', compact('categories', 'product'));
    }

    public function seller_product_list(Request $request)
    {
        $search = null;
        $products = Product::where('user_id', Auth::user()->id)->orderBy('created_at', 'desc');
        if ($request->has('search')) {
            $search = $request->search;
            $products = $products->where('name', 'like', '%'.$search.'%');
        }
        $products = $products->paginate(10);
        return view('frontend.seller.products', compact('products', 'search'));
    }

    public function show_coupon_upload_form(Request $request)
    {
        return view('frontend.seller.coupon_upload');
    }

    public function show_coupon_edit_form(Request $request, $id)
    {
        $coupon = Coupon::findOrFail(decrypt($id));
        return view('frontend.seller.coupon_edit', compact('coupon'));
    }

    public function seller_coupon_list(Request $request)
    {
        $search = null;
        $coupons = Coupon::where('user_id', Auth::user()->id)->orderBy('created_at', 'desc');
        if ($request->has('search')) {
            $search = $request->search;
            $coupons = $coupons->where('code', 'like', '%'.$search.'%');
        }
        $coupons = $coupons->paginate(10);
        return view('frontend.seller.coupons', compact('coupons', 'search'));
    }

    public function ajax_search(Request $request)
    {
        $keywords = array();
        $products = Product::where('published', 1)->where('tags', 'like', '% '.$request->search.' %')->get();
        foreach ($products as $key => $product) {
            foreach (explode(',',$product->tags) as $key => $tag) {
                if(stripos($tag, $request->search) !== false){
                    if(sizeof($keywords) > 5){
                        break;
                    }
                    else{
                        if(!in_array(strtolower($tag), $keywords)){
                            array_push($keywords, strtolower($tag));
                        }
                    }
                }
            }
        }

        $products = filter_products(Product::where('published', 1)->where('name', 'like', '% '.$request->search.' %'))->get()->take(3);

        $subsubcategories = SubSubCategory::where('name', 'like', '% '.$request->search.' %')->get()->take(3);

        $shops = Shop::whereIn('user_id', verified_sellers_id())->where('name', 'like', '% '.$request->search.' %')->get()->take(3);

        if(sizeof($keywords)>0 || sizeof($subsubcategories)>0 || sizeof($products)>0 || sizeof($shops) >0){
            return view('frontend.partials.search_content', compact('products', 'subsubcategories', 'keywords', 'shops'));
        }
        return '0';
    }

    public function search(Request $request)
    {
        // dd($request);

        $query = $request->q;
        // Session::forget('key');
        // Session::put('key',$query);
        // session([ 'data' => $query]);
        // Session::save();
        // echo '1<br>';  
        if(Session::has('key')){
            // echo '2<br>';
            $old = explode(',',Session::get('key'));
            array_push($old,$query);
            session(['key' => implode(',',array_unique($old))]);
            Session::save();
        }else{
            session([ 'key' => ($query)]);
            Session::save();
        }
        // echo '4<br>';
        // dd(array_slice(explode(',',Session::get('key')), -3),Session::get('key'));
        $brand_id = (Brand::where('slug', $request->brand)->first() != null) ? Brand::where('slug', $request->brand)->first()->id : null;
        $sort_by = $request->sort_by;

        $location_id = (Location::where('id', $request->location)->first() != null) ? Location::where('id', $request->location)->first()->id : null;
        
        $shops=\App\Shop::all();
        $user_id=array();
        foreach ($shops as $key => $shop) {
            if(!empty($shop->location)){
                $array = explode('!!', $shop->location);
                // dd($array);
                if(in_array($location_id,$array)){
                    array_push($user_id,$shop->user_id);  
                }
            }
        }

        
        $category_id = (Category::where('slug', $request->category)->first() != null) ? Category::where('slug', $request->category)->first()->id : null;
        $subcategory_id = (SubCategory::where('slug', $request->subcategory)->first() != null) ? SubCategory::where('slug', $request->subcategory)->first()->id : null;
        $subsubcategory_id = (SubSubCategory::where('slug', $request->subsubcategory)->first() != null) ? SubSubCategory::where('slug', $request->subsubcategory)->first()->id : null;
        $min_price = $request->min_price;
        $max_price = $request->max_price;
        $seller_id = $request->seller_id;
        $rating = $request->rating;
        // dd($rating);
        
        // dd($min_rating);


        $conditions = ['published' => 1];

        if($brand_id != null){
            $conditions = array_merge($conditions, ['brand_id' => $brand_id]);
        }
        if($category_id != null){
            $conditions = array_merge($conditions, ['category_id' => $category_id]);
        }
        if($subcategory_id != null){
            $conditions = array_merge($conditions, ['subcategory_id' => $subcategory_id]);
        }
        if($subsubcategory_id != null){
            $conditions = array_merge($conditions, ['subsubcategory_id' => $subsubcategory_id]);

        }
        if($seller_id != null){
            $conditions = array_merge($conditions, ['user_id' => Seller::findOrFail($seller_id)->user->id]);
        }

        // if($user_id != null){
        //     $conditions = array_merge($conditions, ['user_id' => $user_id]);
        // }
        
        if($user_id){
            $products = Product::whereIn('user_id',(array)$user_id)->where('published',1);
        }
        else{
            $products = Product::where($conditions);
        }

        if($min_price != null && $max_price != null){
            $products = $products->where('unit_price', '>=', $min_price)->where('unit_price', '<=', $max_price);
        }

        if($rating != null){
            $products = $products->where('rating', $rating);
            // dd($products);
        }
         
        
        if($query != null){
            $searchController = new SearchController;
            $searchController->store($request);
            $products = $products->where(function ($query2) use ($query) {
                $query2->where('name', 'like', '% ' . $query . ' %')
                      ->orWhere('tags', 'like', '% ' . $query . ' %');
            });      
            // $products = $products->where('name', 'like', '% '.$query.' %')->orWhere('tags', 'like', '%'.$query.'%');
        }

        if($sort_by != null){
            switch ($sort_by) {
                case '1':
                    $products->orderBy('created_at', 'desc');
                    break;
                case '2':
                    $products->orderBy('created_at', 'asc');
                    break;
                case '3':
                    $products->selectRaw('*,case 
                                    when discount_type = "amount" then (unit_price - discount)
                                    when discount_type = "percent" then (unit_price - (unit_price * (discount/100)))
                                    end as unit_price2');
                    // type = amount 
                    // unit_price - discount

                    // type = Percentage
                    // unit_price - ((unit_price * discount)/100)
                    // $products->orderByRaw('(unit_price - discount) asc');
                    //                     SELECT id,price,
                    // CASE WHEN discount="amount" THEN price-discountAmount
                    // WHEN discount="percentage" THEN price-(price*discountAmount/100)
                    // END AS afterdiscount
                    // FROM products ORDER by afterdiscount desc;
                    $products->orderBy('unit_price2', 'asc');
                    break;
                case '4':
                    $products->selectRaw('*,case 
                                    when discount_type = "amount" then (unit_price - discount)
                                    when discount_type = "percent" then (unit_price - (unit_price * (discount/100)))
                                    end as unit_price2');
                    $products->orderBy('unit_price2', 'desc');
                    // $products->orderByRaw('(unit_price - discount) desc');
                    // $products->orderBy('unit_price', 'desc');
                    break;
                default:
                    // code...
                    break;
            }
        }
        // $products->with('category');
// dd($products->get()->toArray());
        $non_paginate_products = filter_products($products)->get();

        //Attribute Filter

        $attributes = array();
        foreach ($non_paginate_products as $key => $product) {
            if($product->attributes != null && is_array(json_decode($product->attributes))){
                foreach (json_decode($product->attributes) as $key => $value) {
                    $flag = false;
                    $pos = 0;
                    foreach ($attributes as $key => $attribute) {
                        if($attribute['id'] == $value){
                            $flag = true;
                            $pos = $key;
                            break;
                        }
                    }
                    if(!$flag){
                        $item['id'] = $value;
                        $item['values'] = array();
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if($choice_option->attribute_id == $value){
                                $item['values'] = $choice_option->values;
                                break;
                            }
                        }
                        array_push($attributes, $item);
                    }
                    else {
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if($choice_option->attribute_id == $value){
                                foreach ($choice_option->values as $key => $value) {
                                    if(!in_array($value, $attributes[$pos]['values'])){
                                        array_push($attributes[$pos]['values'], $value);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        $selected_attributes = array();

        foreach ($attributes as $key => $attribute) {
            if($request->has('attribute_'.$attribute['id'])){
                foreach ($request['attribute_'.$attribute['id']] as $key => $value) {
                    $str = '"'.$value.'"';
                    $products = $products->where('choice_options', 'like', '%'.$str.'%');
                }

                $item['id'] = $attribute['id'];
                $item['values'] = $request['attribute_'.$attribute['id']];
                array_push($selected_attributes, $item);
            }
        }
    

        //Color Filter
        $all_colors = array();

        foreach ($non_paginate_products as $key => $product) {
            if ($product->colors != null) {
                foreach (json_decode($product->colors) as $key => $color) {
                    if(!in_array($color, $all_colors)){
                        array_push($all_colors, $color);
                    }
                }
            }
        }

        $selected_color = null;

        if($request->has('color')){
            $str = '"'.$request->color.'"';
            $products = $products->where('colors', 'like', '%'.$str.'%');
            $selected_color = $request->color;
        }


    
        $products = filter_products($products)->inRandomOrder()->paginate(12)->appends(request()->query());

        // $products = $products->shuffle();

        return view('frontend.product_listing', compact('products', 'query', 'category_id', 'subcategory_id', 'subsubcategory_id', 'brand_id', 'sort_by', 'seller_id','min_price', 'max_price', 'attributes', 'selected_attributes', 'all_colors', 'selected_color','location_id','rating'));
    }

    public function product_content(Request $request){
        $connector  = $request->connector;
        $selector   = $request->selector;
        $select     = $request->select;
        $type       = $request->type;
        productDescCache($connector,$selector,$select,$type);
    }

    public function home_settings(Request $request)
    {
        return view('home_settings.index');
    }

    public function top_10_settings(Request $request)
    {
        foreach (Category::all() as $key => $category) {
            if(in_array($category->id, $request->top_categories)){
                $category->top = 1;
                $category->save();
            }
            else{
                $category->top = 0;
                $category->save();
            }
        }

        foreach (Brand::all() as $key => $brand) {
            if(in_array($brand->id, $request->top_brands)){
                $brand->top = 1;
                $brand->save();
            }
            else{
                $brand->top = 0;
                $brand->save();
            }
        }

        flash(__('Top 10 categories and brands have been updated successfully'))->success();
        return redirect()->route('home_settings.index');
    }

    public function variant_price(Request $request)
    {
           $product = Product::find($request->id);
        $str = '';
        $quantity = 0;
        if ($request->has('color')) {
            $data['color'] = $request['color'];
            $str = Color::where('code', $request['color'])->first()->name;
        }

        if (json_decode(Product::find($request->id)->choice_options) != null) {
            foreach (json_decode(Product::find($request->id)->choice_options) as $key => $choice) {
                if ($str != null) {
                    $str .= '-' . str_replace(' ', '', $request['attribute_id_' . $choice->attribute_id]);
                } else {
                    $str .= str_replace(' ', '', $request['attribute_id_' . $choice->attribute_id]);
                }
            }
        }


        if ($str != null && $product->variant_product) {
            $product_stock = $product->stocks->where('variant', $str)->count();
            if($product_stock > 0){
                $product_stock = $product->stocks->where('variant', $str)->first();                
                $price = $product_stock->price;
                $quantity = $product_stock->qty;                
            }else{
                $price = $product->unit_price;
                $quantity = $product->current_stock;                
            }
        } else {
            $price = $product->unit_price;
            $quantity = $product->current_stock;
        }

        //discount calculation
        $flash_deals = \App\FlashDeal::where('status', 1)->get();
        $inFlashDeal = false;
        foreach ($flash_deals as $key => $flash_deal) {
            if ($flash_deal != null && $flash_deal->status == 1 && strtotime(date('d-m-Y')) >= $flash_deal->start_date && strtotime(date('d-m-Y')) <= $flash_deal->end_date && \App\FlashDealProduct::where('flash_deal_id', $flash_deal->id)->where('product_id', $product->id)->first() != null) {
                $flash_deal_product = \App\FlashDealProduct::where('flash_deal_id', $flash_deal->id)->where('product_id', $product->id)->first();
                if ($flash_deal_product->discount_type == 'percent') {
                    $price -= ($price * $flash_deal_product->discount) / 100;
                } elseif ($flash_deal_product->discount_type == 'amount') {
                    $price -= $flash_deal_product->discount;
                }
                $inFlashDeal = true;
                break;
            }
        }
        if (!$inFlashDeal) {
            if ($product->discount_type == 'percent') {
                $price -= ($price * $product->discount) / 100;
            } elseif ($product->discount_type == 'amount') {
                $price -= $product->discount;
            }
        }

        if ($product->tax_type == 'percent') {
            $price += ($price * $product->tax) / 100;
        } elseif ($product->tax_type == 'amount') {
            $price += $product->tax;
        }
        return array('price' => single_price($price * $request->quantity), 'quantity' => $quantity, 'digital' => $product->digital);
    }

    public function sellerpolicy(){
        return view("frontend.policies.sellerpolicy");
    }

    public function returnpolicy(){
        return view("frontend.policies.returnpolicy");
    }

    public function supportpolicy(){
        return view("frontend.policies.supportpolicy");
    }

    public function terms(){
        return view("frontend.policies.terms");
    }

    public function privacypolicy(){
        return view("frontend.policies.privacypolicy");
    }

    public function get_pick_ip_points(Request $request)
    {
        $pick_up_points = PickupPoint::all();
        return view('frontend.partials.pick_up_points', compact('pick_up_points'));
    }
    
    public function getLocationCharge(Request $request){
        try{
            $category = Location::findOrFail($request->deliveryLocation);
            $location_charge = $category->delivery_charge;
            $shippingBeforeLocation = $request->shippingBeforeLocation;
            $subTotal = $request->subTotal;
            $taxTotal = $request->taxTotal;
            $data = [
                'location_charge' => $location_charge,
                'shippingBeforeLocation' => $shippingBeforeLocation,
                'subTotal' => $subTotal,
                'taxTotal' => $taxTotal,
            ];
            // return Response::json($data);
    
            $value = [
                'total' => $shippingBeforeLocation+$subTotal+$taxTotal+$location_charge,
                'total_shipping' => $shippingBeforeLocation+$location_charge,
                'location_charge' => $location_charge,
            ];
            return Response::json($value);
        }catch(Exception $e){
            return Response::json($e->getMessage());
        }
        // return view('frontend.partials.category_elements', compact('category'));
    }
    public function get_category_items(Request $request){
        $category = Category::findOrFail($request->id);
        return view('frontend.partials.category_elements', compact('category'));
    }

    public function premium_package_index()
    {
        $customer_packages = CustomerPackage::all();
        return view('frontend.customer_packages_lists', compact('customer_packages'));
    }

    public function rewardPolicy()
    {
        $reward_policy = '';
        $policy = Policy::where('name','reward_policy')->first();
        if(isset($policy->content)){
            $reward_policy = $policy->content;
        }
        $rewardRange = RewardRange::get();

        return view('frontend.partials.reward_policy', compact('reward_policy','rewardRange'));
    }
    public function seller_digital_product_list(Request $request)
    {
        $products = Product::where('user_id', Auth::user()->id)->where('digital', 1)->orderBy('created_at', 'desc')->paginate(10);
        return view('frontend.seller.digitalproducts.products', compact('products'));
    }
    public function show_digital_product_upload_form(Request $request)
    {
        if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated){
            if(Auth::user()->seller->remaining_digital_uploads > 0){
                $business_settings = BusinessSetting::where('type', 'digital_product_upload')->first();
                $categories = Category::where('digital', 1)->get();
                return view('frontend.seller.digitalproducts.product_upload', compact('categories'));
            }
            else {
                flash('Upload limit has been reached. Please upgrade your package.')->warning();
                return back();
            }
        }

        $business_settings = BusinessSetting::where('type', 'digital_product_upload')->first();
        $categories = Category::where('digital', 1)->get();
        return view('frontend.seller.digitalproducts.product_upload', compact('categories'));
    }

    public function show_digital_product_edit_form(Request $request, $id)
    {
        $categories = Category::where('digital', 1)->get();
        $product = Product::find(decrypt($id));
        return view('frontend.seller.digitalproducts.product_edit', compact('categories', 'product'));
    }


    public function getStates(Request $request)
    {
        $states = State::where('country_id', $request->country_id)->pluck('name', 'id');
        return response()->json($states);
    }

    public function flash_deals(){
        $flash_deals=FlashDeal::where('status',1)->get();
        return view('frontend.flashdeals',compact('flash_deals'));
    }
    public function sitemap() {
        $categories = Category::get(['id','name','slug','updated_at']);
        $subcategories = SubCategory::get(['id','name','slug','updated_at']);
        $subsubcategories = SubSubCategory::get(['id','name','slug','updated_at']);
        $products = Product::get(['name','slug','updated_at']);
        return response()->view('sitemap', [
            'categories' => $categories,
            'products' => $products,
            'subcategories' => $subcategories,
            'subsubcategories' => $subsubcategories,

        ])->header('Content-Type', 'text/xml');
    }
    public function career()
    {
        $career = Career::where('published',1)->get();
        return view('frontend.career',compact('career'));
    }
    public function faq()
    {
        $faq = Faq::where('published',1)->get();
        return view('frontend.faq',compact('faq'));
    }
    public function blogs()
    {
        $blogs = Blog::where('published',1)->get();
        return view('frontend.blog',compact('blogs'));
    }
    public function blogDetails($id)
    {
        $blog = Blog::where('id',$id)->first();
        $blogs = Blog::where('published',1)->where('id','!=',$id)->get();
        return view('frontend.blogDetails',compact('blog','blogs'));
    }
}
