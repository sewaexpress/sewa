<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\ProductCollection;
use App\Http\Resources\ProductDetailCollection;
use App\Http\Resources\SearchProductCollection;
use App\Http\Resources\FlashDealCollection;
use App\Models\Brand;
use App\Models\Category;
use App\Models\FlashDeal;
use App\Models\FlashDealProduct;
use App\Models\Product;
use App\Models\Shop;
use App\Models\Color;
use App\Recommend;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    public function index()
    {
        $scope = request('scope');

        switch ($scope) {
            case 'price_low_to_high':                
                $product_get = filter_products(Product::selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'asc'))->paginate(10);
                $collection = new SearchProductCollection($product_get);
                $collection->appends(['scope' => $scope]);
                return $collection;

            case 'price_high_to_low':
                $product_get = filter_products(Product::selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'desc'))->paginate(10);
                $collection = new SearchProductCollection($product_get);
                $collection->appends(['scope' => $scope]);
                return $collection;

            default:
                $collection = new SearchProductCollection(filter_products(Product::orderBy('num_of_sale', 'desc'))->paginate(10));
                $collection->appends(['scope' => $scope]);
                return $collection;
        }
        // $products =  filter_products(\App\Product::orderBy('id','DESC')->where('current_stock','>',0)->with('stocks'))->paginate(10);;
        // $products = $products->shuffle();
        // return new ProductCollection($products);
    }

    public function show($id)
    {
        
        if(Auth::check()){
            // return 'hello';
            if(Recommend::where('product_id',$id)->where('user_id',Auth::user()->id)->count() == 0)
            Recommend::create([
                'product_id' => $id,
                'user_id' => Auth::user()->id
            ]);
        }
        return new ProductDetailCollection(Product::where('id', $id)->get());
    }

    public function admin()
    {
        return new ProductCollection(Product::where('added_by', 'admin')->latest()->paginate(10));
    }

    public function seller()
    {
        return new ProductCollection(Product::where('added_by', 'seller')->latest()->paginate(10));
    }

    public function category($id)
    {
        $scope = request('scope');

        $products = [];

        switch ($scope) {       
            case 'price_low_to_high':
                $products = Product::where('category_id', $id)->selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'asc')->paginate(10);
                break;

            case 'price_high_to_low':
                $products = Product::where('category_id', $id)->selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'desc')->paginate(10);
                break;

            case 'new_arrival':
                $products = Product::where('category_id', $id)->orderBy('created_at', 'desc')->paginate(10);
                break;

            case 'popularity':
                $products = Product::where('category_id', $id)->orderBy('num_of_sale', 'desc')->paginate(10);
                break;

            case 'top_rated':
                $products = Product::where('category_id', $id)->orderBy('rating', 'desc')->paginate(10);
                break;

            default:
                $products = Product::where('category_id', $id)->paginate(10);
                break;
        }
        return new ProductCollection($products);
    }
    // public function category($id)
    // {
    //     return new ProductCollection(Product::where('category_id', $id)->latest()->paginate(10));
    // }

    // public function subCategory($id)
    // {
    //     return new ProductCollection(Product::where('subcategory_id', $id)->latest()->paginate(10));
    // }
    public function subCategory($id)
    {
        $scope = request('scope');

        $products = [];

        switch ($scope) {       
            case 'price_low_to_high':
                $products = Product::where('subcategory_id', $id)->selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'asc')->paginate(10);
                break;

            case 'price_high_to_low':
                $products = Product::where('subcategory_id', $id)->selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'desc')->paginate(10);
                break;

            case 'new_arrival':
                $products = Product::where('subcategory_id', $id)->orderBy('created_at', 'desc')->paginate(10);
                break;

            case 'popularity':
                $products = Product::where('subcategory_id', $id)->orderBy('num_of_sale', 'desc')->paginate(10);
                break;

            case 'top_rated':
                $products = Product::where('subcategory_id', $id)->orderBy('rating', 'desc')->paginate(10);
                break;

            default:
                $products = Product::where('subcategory_id', $id)->paginate(10);
                break;
        }
        return new ProductCollection($products);
    }

    // public function subSubCategory($id)
    // {
    //     return new ProductCollection(Product::where('subsubcategory_id', $id)->latest()->paginate(10));
    // }
    public function subSubCategory($id)
    {
        $scope = request('scope');

        $products = [];

        switch ($scope) {       
            case 'price_low_to_high':
                $products = Product::where('subsubcategory_id', $id)->selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'asc')->paginate(10);
                break;

            case 'price_high_to_low':
                $products = Product::where('subsubcategory_id', $id)->selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'desc')->paginate(10);
                break;

            case 'new_arrival':
                $products = Product::where('subsubcategory_id', $id)->orderBy('created_at', 'desc')->paginate(10);
                break;

            case 'popularity':
                $products = Product::where('subsubcategory_id', $id)->orderBy('num_of_sale', 'desc')->paginate(10);
                break;

            case 'top_rated':
                $products = Product::where('subsubcategory_id', $id)->orderBy('rating', 'desc')->paginate(10);
                break;

            default:
                $products = Product::where('subsubcategory_id', $id)->paginate(10);
                break;
        }
        return new ProductCollection($products);
    }

    public function brand($id)
    {
        return new ProductCollection(Product::where('brand_id', $id)->latest()->paginate(10));
    }

    public function todaysDeal()
    {
        return new ProductCollection(Product::where('todays_deal', 1)->latest()->get());
    }

    public function flashDeal()
    {
        $flash_deals = FlashDeal::where('status', 1)
                                ->where('featured', 1)
                                ->where('start_date', '<=', strtotime(date('Y-m-d H:i:s')))
                                ->where('end_date', '>=', strtotime(date('Y-m-d H:i:s')))
                                ->get();
        // dd($flash_deals);
        return new FlashDealCollection($flash_deals);
    }

    public function featured()
    {
        $products =  filter_products(\App\Product::orderBy('id','DESC')->where('featured', 1)->where('current_stock','>',0)->with('stocks'))->get();;
        return new ProductCollection($products);
        // return new ProductCollection(filter_products(Product::orderBy('id','DESC')->where('featured', 1)->get()));
    }

    public function bestSeller()
    {
        return new ProductCollection(Product::orderBy('num_of_sale', 'desc')->limit(20)->get());
    }

    public function related($id)
    {
        $product = Product::find($id);
        return new ProductCollection(Product::where('subcategory_id', $product->subcategory_id)->where('id', '!=', $id)->limit(10)->get());
    }

    public function topFromSeller($id)
    {
        $product = Product::find($id);
        return new ProductCollection(Product::where('user_id', $product->user_id)->orderBy('num_of_sale', 'desc')->limit(4)->get());
    }

    public function search()
    {
        $key = request('key');
        // return $key;
        $scope = request('scope');


        switch ($scope) {

            case 'price_low_to_high':
                
                $product_get = Product::where('name', 'like', "%{$key}%")->orWhere('tags', 'like', "%{$key}%")->selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'asc')->paginate(10);
                $collection = new SearchProductCollection($product_get);
                // $product_get->orderBy('unit_price', 'asc');
                // $product_get->selectRaw('*,case 
                //                     when discount_type = "amount" then (unit_price - discount)
                //                     when discount_type = "percent" then (unit_price - (unit_price * (discount/100)))
                //                     end as unit_price2');
                // $product_get->orderBy('unit_price2', 'asc');
                // $product_get->orderBy('unit_price', 'asc');
                // $product_get->get();
                // return \Response::json($product_get);
                // $collection = new SearchProductCollection(Product::where('name', 'like', "%{$key}%")->orWhere('tags', 'like', "%{$key}%")->orderBy('unit_price', 'asc')->paginate(10));
                // $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            case 'price_high_to_low':
                $product_get = Product::where('name', 'like', "%{$key}%")->orWhere('tags', 'like', "%{$key}%")->selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'desc')->paginate(10);
                $collection = new SearchProductCollection($product_get);
                // $collection = new SearchProductCollection(Product::where('name', 'like', "%{$key}%")->orWhere('tags', 'like', "%{$key}%")->orderBy('unit_price', 'asc')->paginate(10));

                // $collection = new SearchProductCollection(Product::where('name', 'like', "%{$key}%")->orWhere('tags', 'like', "%{$key}%")->orderBy('unit_price', 'desc')->paginate(10));
                // $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            case 'new_arrival':
                $collection = new SearchProductCollection(Product::where('name', 'like', "%{$key}%")->orWhere('tags', 'like', "%{$key}%")->orderBy('created_at', 'desc')->paginate(10));
                $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            case 'popularity':
                $collection = new SearchProductCollection(Product::where('name', 'like', "%{$key}%")->orWhere('tags', 'like', "%{$key}%")->orderBy('num_of_sale', 'desc')->paginate(10));
                $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            case 'top_rated':
                $collection = new SearchProductCollection(Product::where('name', 'like', "%{$key}%")->orWhere('tags', 'like', "%{$key}%")->orderBy('rating', 'desc')->paginate(10));
                $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            // case 'category':
            //
            //     $categories = Category::select('id')->where('name', 'like', "%{$key}%")->get()->toArray();
            //     $collection = new SearchProductCollection(Product::where('category_id', $categories)->orderBy('num_of_sale', 'desc')->paginate(10));
            //     $collection->appends(['key' =>  $key, 'scope' => $scope]);
            //     return $collection;
            //
            // case 'brand':
            //
            //     $brands = Brand::select('id')->where('name', 'like', "%{$key}%")->get()->toArray();
            //     $collection = new SearchProductCollection(Product::where('brand_id', $brands)->orderBy('num_of_sale', 'desc')->paginate(10));
            //     $collection->appends(['key' =>  $key, 'scope' => $scope]);
            //     return $collection;
            //
            case 'shop':
            
                $shops = Shop::select('user_id')->where('name', 'like', "%{$key}%")->get()->toArray();
                $collection = new SearchProductCollection(Product::where('user_id', $shops)->orderBy('num_of_sale', 'desc')->paginate(10));
                $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            default:
                $collection = new SearchProductCollection(Product::where('name', 'like', "%{$key}%")->orWhere('tags', 'like', "%{$key}%")->orderBy('num_of_sale', 'desc')->paginate(10));
                $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;
        }
    }
    public function searchShop(Request $request)
    {

        $key = request('key');
        $user_id = request('user_id');
        // return $key;
        $scope = request('scope');


        switch ($scope) {

            case 'price_low_to_high':
                $product_get = Product::where('user_id',$user_id)->selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'asc')->paginate(10);
                $collection = new SearchProductCollection($product_get);
                // $collection = new SearchProductCollection(Product::where('user_id',$user_id)->orderBy('unit_price', 'asc')->paginate(10));
                // $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            case 'price_high_to_low':
                $product_get = Product::where('user_id',$user_id)->selectRaw('*,case when discount_type = "amount" then (unit_price - discount) when discount_type = "percent" then (unit_price - (unit_price * (discount/100))) end as unit_price2')->orderBy('unit_price2', 'desc')->paginate(10);
                $collection = new SearchProductCollection($product_get);
                // $collection = new SearchProductCollection(Product::where('user_id',$user_id)->orderBy('unit_price', 'desc')->paginate(10));
                // $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            case 'new_arrival':
                $collection = new SearchProductCollection(Product::where('user_id',$user_id)->orderBy('created_at', 'desc')->paginate(10));
                $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            case 'popularity':
                $collection = new SearchProductCollection(Product::where('user_id',$user_id)->orderBy('num_of_sale', 'desc')->paginate(10));
                $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            case 'top_rated':
                $collection = new SearchProductCollection(Product::where('user_id',$user_id)->orderBy('rating', 'desc')->paginate(10));
                $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;

            default:
                $collection = new SearchProductCollection(Product::where('user_id',$user_id)->orderBy('num_of_sale', 'desc')->paginate(10));
                $collection->appends(['key' =>  $key, 'scope' => $scope]);
                return $collection;
        }
         
        
    }
    public function variantPrice(Request $request)
    {
        $product = Product::findOrFail($request->id);
        $str = '';
        $tax = 0;

        if ($request->has('color') && !empty($request['color'])) {
            $data['color'] = $request['color'];
            $str = Color::where('code', $request['color'])->first()->name;
        }
        if ($request->has('choice') && !empty($request['choice'])) {
            foreach (json_decode($request->choice) as $option) {
                $str .= $str != '' ?  '-'.str_replace(' ', '', $option->name) : str_replace(' ', '', $option->name);
            }            
        }

        if($str != null && $product->variant_product){
            $product_stock = $product->stocks->where('variant', $str)->count();
            if($product_stock){                
                $product_stock = $product->stocks->where('variant', $str)->first();
                $price = $product_stock->price;
                $stockQuantity = $product_stock->qty;
            }else{
                $price = $product->unit_price;
                $stockQuantity = $product->current_stock;
            }
        }
        else{
            $price = $product->unit_price;
            $stockQuantity = $product->current_stock;
        }

        //discount calculation
        $flash_deals = FlashDeal::where('status', 1)->get();
        $inFlashDeal = false;
        foreach ($flash_deals as $key => $flash_deal) {
            if ($flash_deal != null && $flash_deal->status == 1 && strtotime(date('d-m-Y')) >= $flash_deal->start_date && strtotime(date('d-m-Y')) <= $flash_deal->end_date && FlashDealProduct::where('flash_deal_id', $flash_deal->id)->where('product_id', $product->id)->first() != null) {
                $flash_deal_product = FlashDealProduct::where('flash_deal_id', $flash_deal->id)->where('product_id', $product->id)->first();
                if($flash_deal_product->discount_type == 'percent'){
                    $price -= ($price*$flash_deal_product->discount)/100;
                }
                elseif($flash_deal_product->discount_type == 'amount'){
                    $price -= $flash_deal_product->discount;
                }
                $inFlashDeal = true;
                break;
            }
        }
        if (!$inFlashDeal) {
            if($product->discount_type == 'percent'){
                $price -= ($price*$product->discount)/100;
            }
            elseif($product->discount_type == 'amount'){
                $price -= $product->discount;
            }
        }

        if ($product->tax_type == 'percent') {
            $price += ($price*$product->tax) / 100;
        }
        elseif ($product->tax_type == 'amount') {
            $price += $product->tax;
        }
        // return $stockQuantity;
        return response()->json([
            'product_id' => $product->id,
            'variant' => $str,
            'price' => (double) $price,
            'in_stock' => $stockQuantity < 1 ? false : true
        ]);
    }

    public function home()
    {
        return new ProductCollection(Product::inRandomOrder()->take(50)->get());
    }
}
