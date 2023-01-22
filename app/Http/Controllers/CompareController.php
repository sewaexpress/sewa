<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\Product;
use Illuminate\Support\Facades\Session;

class CompareController extends Controller
{
    public function index(Request $request)
    {
        // dd($request->session()->get('compare'));
        $categories = Category::all();
        $products = [];

        // foreach(Session::get('compare') as $a => $item){
        //     $products[] = \App\Product::find($item);

        // }
        // dd(Session::get('compare'));
        return view('frontend.view_compare', compact('categories','products'));
    }

    //clears the session data for compare
    public function reset(Request $request)
    {
        $request->session()->forget('compare');
        $request->session()->forget('compare_category');
        $request->session()->forget('compare_subcategory');
        $request->session()->forget('compare_subsubcategory');
        return back();
    }

    //store comparing products ids in session
    public function addToCompare(Request $request)
    {
        $product = Product::find($request->id);
        if($request->session()->has('compare')){
            if($request->session()->has('compare_subsubcategory')){
                // dd('31');
                if($request->session()->get('compare_subsubcategory') == ((isset($product->subsubcategory->id))?$product->subsubcategory->id:0)){
                    $compare = $request->session()->get('compare', collect([]));
                    if(!$compare->contains($request->id)){
                        if(count($compare) == 3){
                            $compare->forget(0);
                            $compare->push($request->id);
                        }
                        else{
                            $compare->push($request->id);
                        }
                    }
                }else{
                    return 'false';
                }
            }elseif($request->session()->has('compare_subcategory')){
                if($request->session()->get('compare_subcategory') == ((isset($product->subcategory->id))?$product->subcategory->id:0)){
                    $compare = $request->session()->get('compare', collect([]));
                    if(!$compare->contains($request->id)){
                        if(count($compare) == 3){
                            $compare->forget(0);
                            $compare->push($request->id);
                        }
                        else{
                            $compare->push($request->id);
                        }
                    }
                }else{
                    return 'false';
                }
            }else{
                // dd('12');
                if($request->session()->get('compare_category') == ((isset($product->subcategory->id))?$product->subcategory->id:0)){
                    $compare = $request->session()->get('compare', collect([]));
                    if(!$compare->contains($request->id)){
                        if(count($compare) == 3){
                            $compare->forget(0);
                            $compare->push($request->id);
                        }
                        else{
                            $compare->push($request->id);
                        }
                    }
                }else{
                    return 'false';
                }

            }

            // if($request->session()->has('compare_category')){
            //     if($request->session()->get('compare_category') == $product->category){
            //         $compare = $request->session()->get('compare', collect([]));
            //         if(!$compare->contains($request->id)){
            //             if(count($compare) == 3){
            //                 $compare->forget(0);
            //                 $compare->push($request->id);
            //             }
            //             else{
            //                 $compare->push($request->id);
            //             }
            //         }
            //     }else{
            //         return 'false';
            //     }
            // }
            // else{
            //     $compare = $request->session()->get('compare', collect([]));
            //     $request->session()->put('compare_category', $product->category);
            //     if(!$compare->contains($request->id)){
            //         if(count($compare) == 3){
            //             $compare->forget(0);
            //             $compare->push($request->id);
            //         }
            //         else{
            //             $compare->push($request->id);
            //         }
            //     }
            // }
        }
        else{
            $compare = collect([$request->id]);
            $request->session()->put('compare', $compare);
            if($product->subsubcategory){
                $request->session()->put('compare_subsubcategory', $product->subsubcategory->id);
            }elseif($product->subcategory){
                $request->session()->put('compare_subcategory', $product->subcategory->id);
            }else{
                $request->session()->put('compare_category', $product->category->id);
            }
        }
        // flash(__('Passwords donot match'))->error();

        return view('frontend.partials.compare');
    }
}
