<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\Product;

class CompareController extends Controller
{
    public function index(Request $request)
    {
        // dd($request->session()->get('compare'));
        $categories = Category::all();
        return view('frontend.view_compare', compact('categories'));
    }

    //clears the session data for compare
    public function reset(Request $request)
    {
        $request->session()->forget('compare');
        $request->session()->forget('compare_category');
        return back();
    }

    //store comparing products ids in session
    public function addToCompare(Request $request)
    {
        $product = Product::find($request->id);
        if($request->session()->has('compare')){
            if($request->session()->has('compare_category')){
                if($request->session()->get('compare_category') == $product->category){
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
                    // $request->session()->get('compare_category');
                }else{
                    return 'false';
                }
            }
            else{
                $compare = $request->session()->get('compare', collect([]));
                $request->session()->put('compare_category', $product->category);
                if(!$compare->contains($request->id)){
                    if(count($compare) == 3){
                        $compare->forget(0);
                        $compare->push($request->id);
                    }
                    else{
                        $compare->push($request->id);
                    }
                }
            }
        }
        else{
            $compare = collect([$request->id]);
            $request->session()->put('compare', $compare);
            $request->session()->put('compare_category', $product->category);
        }
        // flash(__('Passwords donot match'))->error();

        return view('frontend.partials.compare');
    }
}
