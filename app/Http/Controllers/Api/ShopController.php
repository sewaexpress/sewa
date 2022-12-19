<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\ProductCollection;
use App\Http\Resources\ShopCollection;
use App\Models\Product;
use App\Models\Shop;
use App\Recommend;
use Illuminate\Support\Facades\Auth;


class ShopController extends Controller
{
    public function index()
    {
        return new ShopCollection(Shop::all());
    }
    public function recommendations(){
        $recommended = [];
        if(Auth::check()){
            $recommended = Recommend::where('user_id',Auth::user()->id)->orderBy('id','desc')->paginate(10);
            
        // return $recommended;
            $b = [];
            foreach($recommended as $a => $product){
                $data = Product::where('id',$product->product_id)->first();

                $photo=[];
                $placeholder_img='frontend/images/placeholder.jpg';
                
                if(!(isset($data->photos)) && empty($data->photos)){
                    array_push($photo,$placeholder_img);
                }else{
                    // array_push($photo,$img);
                    $items = json_decode($data->photos);
                    if(count(array($items)) > 0){
                        foreach($items as $key=>$img){
                            if(file_exists($img)){
                                array_push($photo,$img);
                            }else{
                                array_push($photo,$placeholder_img);
                            }
                        }
                    }
                }
                $prod = [
                    'id' => (integer) $data->id,
                    'name' => $data->name,
                    'photos' => $photo,
                    'thumbnail_image' => file_exists($data->thumbnail_img) ? $data->thumbnail_img : $placeholder_img,
                    'featured_image' => file_exists($data->featured_img) ? $data->featured_img : $placeholder_img,
                    'flash_deal_image' => file_exists($data->flash_deal_img) ? $data->flash_deal_img : $placeholder_img,
                    'unit_price' => $data->unit_price,
                    'base_price' => (double) homeBasePrice($data->id),
                    'base_discounted_price' => (double) homeDiscountedBasePrice($data->id),
                    'todays_deal' => (integer) $data->todays_deal,
                    'featured' =>(integer) $data->featured,
                    'unit' => $data->unit,
                    'discount' => (double) $data->discount,
                    'discount_type' => $data->discount_type,
                    'rating' => (double) $data->rating,
                    'sales' => (integer) $data->num_of_sale,
                    'links' => [
                        'details' => route('products.show', $data->id),
                        'reviews' => route('api.reviews.index', $data->id),
                        'related' => route('products.related', $data->id),
                        'top_from_seller' => route('products.topFromSeller', $data->id)
                    ]
                ];
                array_push($b,$prod);
            }
            
        return $b;
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Login Error',
                'data'=> [],
            ]); 
        }
    }
    public function info($id)
    {
        return new ShopCollection(Shop::where('id', $id)->get());
    }

    public function shopOfUser($id)
    {
        return new ShopCollection(Shop::where('user_id', $id)->get());
    }

    public function allProducts($id)
    {
        $shop = Shop::findOrFail($id);
        return new ProductCollection(Product::where('user_id', $shop->user_id)->latest()->paginate(10));
    }

    public function topSellingProducts($id)
    {
        $shop = Shop::findOrFail($id);
        return new ProductCollection(Product::where('user_id', $shop->user_id)->orderBy('num_of_sale', 'desc')->limit(4)->get());
    }

    public function featuredProducts($id)
    {
        $shop = Shop::findOrFail($id);
        return new ProductCollection(Product::where(['user_id' => $shop->user_id, 'featured'  => 1])->latest()->get());
    }

    public function newProducts($id)
    {
        $shop = Shop::findOrFail($id);
        return new ProductCollection(Product::where('user_id', $shop->user_id)->orderBy('created_at', 'desc')->limit(10)->get());
    }

    public function brands($id)
    {

    }
}
