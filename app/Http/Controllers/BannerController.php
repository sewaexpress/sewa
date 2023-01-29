<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Banner;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\SubSubCategory;

class BannerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $banners = Banner::all();
        return view('banners.index', compact('banners'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($position)
    {
        return view('banners.create', compact('position'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if($request->hasFile('photo')){
            $banner = new Banner;
            $banner->photo = $request->photo->store('uploads/banners');
            $banner->url = $request->url;
            $banner->position = $request->position;
            $banner->save();
            flash(__('Banner has been inserted successfully'))->success();
        }
        return redirect()->route('home_settings.index');
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
        $banner = Banner::findOrFail($id);
        return view('banners.edit', compact('banner'));
    }
    public function popEdit()
    {
        $generalsetting = \App\GeneralSetting::first();
        return view('banners.popedit', compact($generalsetting));
    }
    public function appPopEdit(){
        $generalsetting = \App\GeneralSetting::first();
        $items = [];
        if($generalsetting->app_pop_url != 'flash_deal'){
            $items = [];
            if($generalsetting->app_pop_url == 'category'){
                $items = Category::get();
            }elseif($generalsetting->app_pop_url == 'subcategory'){
                $items = SubCategory::get();
            }elseif($generalsetting->app_pop_url == 'subsubcategory'){
                $items = SubSubCategory::get();
            }
        }
        return view('banners.appPopedit', compact('generalsetting','items'));
    }
    
    public function appPopUpdate(Request $request)
    {
        $generalsetting = \App\GeneralSetting::first();

        // $banner = Banner::find($id);pop_status
        $generalsetting->app_pop_image = $request->previous_photo;
        $generalsetting->app_pop_url = $request->app_pop_url;
        $generalsetting->app_pop_status = $request->app_pop_status;
        if($request->app_pop_url == 'flash_deal'){
            $custom_point = null;
        }else{
            $custom_point = $request->custom_point;
        }
        $generalsetting->app_point_link = $custom_point;

        // dd($request->hasFile('photo'));
        if($request->hasFile('photo')){
            $generalsetting->app_pop_image = $request->photo->store('uploads/banners');
        }
        $generalsetting->save();
        flash(__('Pop up has been updated successfully'))->success();
        return redirect()->route('app.pop');
    }
    public function popupdate(Request $request)
    {
        $generalsetting = \App\GeneralSetting::first();

        // $banner = Banner::find($id);pop_status
        $generalsetting->pop_img = $request->previous_photo;
        $generalsetting->pop_url = $request->pop_url;

        // dd($generalsetting);
        if($request->hasFile('photo')){
            $generalsetting->pop_img = $request->photo->store('uploads/banners');
        }
        $generalsetting->save();
        flash(__('Pop up has been updated successfully'))->success();
        return redirect()->route('home_settings.index');
    }
    public function pop_update_status(Request $request)
    {
        $generalsetting = \App\GeneralSetting::first();
        // $banner = Banner::find($request->id);
        $generalsetting->pop_status = $request->status;
        if($generalsetting->save()){
            return '1';
        }
        else {
            return '0';
        }
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
        $banner = Banner::find($id);
        $banner->photo = $request->previous_photo;
        if($request->hasFile('photo')){
            $banner->photo = $request->photo->store('uploads/banners');
        }
        $banner->url = $request->url;
        $banner->save();
        flash(__('Banner has been updated successfully'))->success();
        return redirect()->route('home_settings.index');
    }


    public function update_status(Request $request)
    {
        $banner = Banner::find($request->id);
        $banner->published = $request->status;
        if($request->status == 1){
            if(count(Banner::where('published', 1)->where('position', $banner->position)->get()) < 4)
            {
                if($banner->save()){
                    return '1';
                }
                else {
                    return '0';
                }
            }
        }
        else{
            if($banner->save()){
                return '1';
            }
            else {
                return '0';
            }
        }

        return '0';
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $banner = Banner::findOrFail($id);
        if(Banner::destroy($id)){
            //unlink($banner->photo);
            flash(__('Banner has been deleted successfully'))->success();
        }
        else{
            flash(__('Something went wrong'))->error();
        }
        return redirect()->route('home_settings.index');
    }
}
