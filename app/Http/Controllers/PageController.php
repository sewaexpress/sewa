<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Page;
use App\Testimonial;
use Illuminate\Support\Facades\DB;
use Response;

class PageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pages = Page::all();
        return view('pages.index', compact('pages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        return view('pages.create',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $page = new Page;
        $page->title = $request->title;
        if (Page::where('slug', preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug)))->first() == null) {
            $page->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
            $page->content = $request->content;
            $page->category_id = $request->category_id;
            if($request['product_id'] == null){
            }
            else{
                $page->product_id=implode('!!', $request['product_id']);
            }
            $page->brand_id = $request->brand_id;
            $page->seller_id = $request->seller_id;
            $page->meta_title = $request->meta_title;
            $page->meta_description = $request->meta_description;
            $page->keywords = $request->keywords;
            if ($request->hasFile('meta_image')) {
                $page->meta_image = $request->meta_image->store('uploads/custom-pages');;
            }
            $page->save();

            flash('New page has been created successfully')->success();
            return redirect()->route('pages.index');
        }

        flash('Slug has been used already')->warning();
        return back();
    }

    public function testimonialupdate_status(Request $request)
    {
    //    dd($request->id);
            try {
                DB::table('testimonial')
                    ->where('id', $request->cid)
                    ->update([
                        'status' => $request->status,
                    ]);
                    return Response::json('Status Changed');
            } catch (\Exception $e) {
                        $bug = $e->getMessage();
                        return Response::json(['error' => $bug],404);
                    }
    }

    public function testimonialstore(Request $request)
    {
        if ($files = $request->file('image')) {
            $destinationPath = public_path('/img/');
            $image = date('YmdHis') . "." . $files->getClientOriginalExtension();
            $files->move($destinationPath, $image);
            $insert['image'] = "$image";
        }
         DB::table('testimonial')->insert([
             'name' => $request->name,
             'title' => $request->title,
             'about' => $request->about,
             'image' => $image,
             'status' => $request->status,
         ]);
         flash('Testional has been Added successfully')->success();
         return redirect()->route('pages.testimonialindex');
     }
     public function testimonialedit($id)
     {
         $flash_deal = DB::table('testimonial')->where('id', $id)->first();
         return view ('testimonial.edit',compact('flash_deal'));
     }
     public function testimonialupdate(Request $request, $id)
     {
        if ($files = $request->file('image')) {
            // Define upload path
                $destinationPath = public_path('/img/');
            // Upload Orginal Image
                $image = date('YmdHis') . "." . $files->getClientOriginalExtension();
                $fullpath = 'img/'.$image;
                $files->move($destinationPath, $image);
                $insert['image'] = "$image";

                DB::table('testimonial')
                ->where('id', $id)
                ->update([
                    'name' => $request->name,
                    'title' =>$request->title,
                    'about' =>$request->about,
                    'image' => $fullpath,
                    // 'image' => $image,
                    'status' => $request->status,
                ]);
            }else{
                DB::table('testimonial')
                ->where('id', $id)
                ->update([
                    'name' => $request->name,
                    'title' =>$request->title,
                    'about' =>$request->about,
                    'status' => $request->status,
                ]);
            }
        


                flash('Testional has been Updated successfully')->success();
                return redirect()->route('pages.testimonialindex');
     }


     public function testimonial_delete($id)
     {
            DB::table('testimonial')
                ->where('id', $id)
                ->delete();
                flash('Testimonial deleted successfully')->success();
                return redirect()->back();
     }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $categories = Category::all();
        $page = Page::where('slug', $id)->first();
        if($page != null){
            return view('pages.edit', compact('page','categories'));
        }
        abort(404);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        
        $page = Page::findOrFail($id);
        $page->title = $request->title;
        if (Page::where('slug', preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug)))->first() != null) {
            $page->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
            $page->content = $request->content;
            $page->category_id = $request->category_id;
            // $page->product_id = $request->product_id;
            $page->product_id = isset($request['product_id'])?implode('!!', $request['product_id']):'';

            $page->brand_id = $request->brand_id;
            $page->seller_id = $request->seller_id;
            $page->meta_title = $request->meta_title;
            $page->meta_description = $request->meta_description;
            $page->keywords = $request->keywords;
            if ($request->hasFile('meta_image')) {
                $page->meta_image = $request->meta_image->store('uploads/custom-pages');;
            }
            $page->save();

            flash('New page has been created successfully')->success();
            return redirect()->route('pages.index');
        }

        flash('Slug has been used already')->warning();
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(Page::destroy($id)){
            flash('Page has been deleted successfully')->success();
            return redirect()->route('pages.index');
        }
        flash('Something went wrong')->error();
        return redirect()->route('pages.index');
    }

    public function show_custom_page($slug){
        $pages = Page::where('slug', $slug)->get();
        if($pages != null){
            return view('frontend.custom_page', compact('pages'));
        }
        abort(404);
    }
}
