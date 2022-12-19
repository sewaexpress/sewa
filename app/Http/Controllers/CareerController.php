<?php

namespace App\Http\Controllers;

use App\Career;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CareerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $blog = Career::all();
        return view('career.index',compact('blog'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('career.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $blog = new Career();
        $blog->title = $request->title;
        $blog->description = $request->description;
        $blog->published = 1;
        $blog->save();
        flash(__('Career has been inserted successfully'))->success();
        return redirect()->route('career.index');
    }

    public function updateStatus(Request $request)
    {
        
        $blog = Career::find($request->id);
        $blog->published = $request->status;
        if($blog->save()){
            return '1';
        }
        else {
            return '0';
        }

        return '0';
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
        $blog = Career::findOrFail($id);
        return view('career.edit',compact('blog'));
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
        $blog = Career::find($id);
        $blog->title = $request->title;
        $blog->description = $request->description;
        $blog->save();
        flash(__('Career has been updated successfully'))->success();
        return redirect()->route('career.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $blog = Career::findOrFail($id);
        if(Career::destroy($id)){
          
            flash(__('Career has been deleted successfully'))->success();
        }
        else{
            flash(__('Something went wrong'))->error();
        }
        return redirect()->route('career.index');
    }
}
