<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;
use App\Models\Review;
use App\Models\Attribute;
use App\Product;
use App\ProductStock;

class ProductDetailCollection extends ResourceCollection
{
    public function toArray($request)
    {

        return [
            'data' => $this->collection->map(function($data) {
                $photo=[];
                $placeholder_img='frontend/images/placeholder.jpg';
                if(!(isset($data->photos)) && empty($data->photos)){
                    array_push($photo,$placeholder_img);
                }else{
                    foreach(json_decode($data->photos) as $key=>$img){
                        if(file_exists($img)){
                            array_push($photo,$img);
                        }else{
                            array_push($photo,$placeholder_img);
                        }
                    }
                }
                $variant_stock = [];
                if($data->variant_product == 1){
                    $get_products = ProductStock::where('product_id',$data->id)->count();
                    if($get_products > 0){
                        $get_products = ProductStock::where('product_id',$data->id)->get()->toArray();
                        foreach($get_products as $a => $b){
                            // if(isset($variant_stock[$b['variant']])){

                            // }
                            $c = [
                                'name' => $b['variant'],
                                'sku' => $b['sku'],
                                'price' => $b['price'],
                                'qty' => $b['qty'],
                            ];
                            array_push($variant_stock,$c);
                        }
                    }
                }


                return [
                    'id' => (integer) $data->id,
                    'name' => $data->name,
                    'added_by' => $data->added_by,
                    'user' => [
                        'name' => $data->user->name,
                        'email' => $data->user->email,
                        'avatar' =>file_exists($data->user->avatar) ? $data->user->avatar : $placeholder_img,
                        'avatar_original' =>file_exists($data->user->avatar_original) ? $data->user->avatar_original : $placeholder_img,
                        
                        'shop_name' => $data->added_by == 'admin' ? '' : $data->user->shop->name,
                        'shop_logo' => $data->added_by == 'admin' ? $placeholder_img : $data->user->shop->logo,
                        'shop_id' => $data->added_by == 'admin' ? '' :  (($data->user->shop)? strval($data->user->shop->id):'')
                    ],
                    'category' => [
                        'id' => (integer) $data->category_id,
                        'name' => $data->category->name,
                        'banner' => file_exists($data->category->banner) ? $data->category->banner : $placeholder_img,
                        'icon' => file_exists($data->category->icon) ? $data->category->icon : $placeholder_img,
                        'links' => [
                            'products' => route('api.products.category', $data->category_id),
                            'sub_categories' => route('subCategories.index', $data->category_id)
                            ]
                    ],
                    // 'sub_category' => [
                    //     'name' => (isset($data->subCategory) && !$data->subCategory->isEmpty())?$data->subCategory->name:'',
                    //     'links' => [
                    //         'products' => route('products.subCategory', $data->subcategory_id)
                    //     ]
                    // ],
                    'brand' => [
                        'id' => (string) $data->brand_id ?? 'N/A',
                        'name' => $data->brand->name ?? 'N/A',
                        'logo' => $data->brand->logo ?? $placeholder_img,
                        'links' => [
                            'products' => route('api.products.brand', $data->brand_id ?? '/')
                        ]
                    ],
                    'variant_product' => (integer) $data->variant_product,
                    'variant_stock' => $variant_stock,
                    'photos' => $photo,
                    'thumbnail_image' => file_exists($data->thumbnail_img) ? $data->thumbnail_img : $placeholder_img,
                    'featured_image' => file_exists($data->featured_img) ? $data->featured_img : $placeholder_img,
                    'flash_deal_image' => file_exists($data->flash_deal_img) ? $data->flash_deal_img : $placeholder_img,
                    'tags' => explode(',', $data->tags),
                    'unit_price' => number_format(intval($data->unit_price)),
                    'home_discounted_price'=> number_format(intval(homeDiscountedBasePrice($data->id))),
                    'price_lower' => (double) explode('-', homeDiscountedPrice($data->id))[0],
                    'price_higher' => (double) explode('-', homeDiscountedPrice($data->id))[1],
                    'choice_options' => $this->convertToChoiceOptions(json_decode($data->choice_options)),
                    'colors' => json_decode($data->colors),
                    'todays_deal' => (integer) $data->todays_deal,
                    'featured' => (integer) $data->featured,
                    'current_stock' => (integer) $data->current_stock,
                    'unit' => $data->unit,
                    'discount' => (double) $data->discount,
                    'discount_type' => $data->discount_type,
                    'tax' => (double) $data->tax,
                    'tax_type' => $data->tax_type,
                    'shipping_type' => $data->shipping_type,
                    'shipping_cost' => (double) $data->shipping_cost,
                    'warranty' => (integer) $data->warranty,
                    'warranty_time' => $data->warranty_time,
                    'number_of_sales' => (integer) $data->num_of_sale,
                    'reviews' => Review::where(['product_id' => $data->id])->get(),
                    'rating_count' => (integer) Review::where(['product_id' => $data->id])->count(),
                    'description' => $data->description,
                    'specs' => $data->specs,
                    'links' => [
                        'reviews' => route('api.reviews.index', $data->id),
                        'related' => route('products.related', $data->id)
                    ]
                ];
            })
        ];
    }

    public function with($request)
    {
        return [
            'success' => true,
            'status' => 200
        ];
    }

    protected function convertToChoiceOptions($data){
        $result = array();
        if(isset($data)){
            foreach ($data as $key => $choice) {
                $item['name'] = $choice->attribute_id;
                $item['title'] = Attribute::find($choice->attribute_id)->name;
                $item['options'] = $choice->values;
                array_push($result, $item);
            }
        }
        return $result;
    }
}
