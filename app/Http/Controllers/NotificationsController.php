<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Notification;
use App\User;

class NotificationsController extends Controller
{  
    /**
    * Display a listing of the resource.
    *
    * @return \Illuminate\Http\Response
    */
    public function index(){
        $blog = Notification::with('user')->get();
        $users = User::get();
        // $url = 'https://onesignal.com/api/v1/notifications/?app_id=44f55d66-8a77-486a-9220-27d2e3b9243f';

        return view('notifications.index',compact('blog','users'));
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('blog.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $app_id = '44f55d66-8a77-486a-9220-27d2e3b9243f';
        $user_id = $request->user_id;
        $message = $request->message;
        $header = 'Sewa Express';
        // dd($user_id);
        $blog = new Notification;
        $blog->message = $request->message;

        $url = 'https://onesignal.com/api/v1/notifications';
        $ch = curl_init();

        if($user_id == 'all'){
            curl_setopt_array($ch, array(
                CURLOPT_URL => $url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS =>'{
                    "app_id": "'.$app_id.'",
                    "data": {"foo": "bar"},    
                    "included_segments": ["Subscribed Users"],                
                    "contents": {"en": "'.$message.'"},
                    "headings":{"en":"'.$header.'"}
                }',      
                CURLOPT_HTTPHEADER => array(
                  'Authorization: Basic ZmUzZDg1OWQtY2U0Ni00Nzg5LTg5MzgtYzY1ZTc4ZTI0NDVl',
                  'Content-Type: application/json'
                ),
            ));
        }
        else{
            curl_setopt_array($ch, array(
                CURLOPT_URL => $url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS =>'{
                    "app_id": "'.$app_id.'",
                    "data": {"foo": "bar"},    
                    "include_external_user_ids": ["'.$user_id.'"],
                    "contents": {"en": "'.$message.'"},
                    "headings":{"en":"'.$header.'"}
                }',      
                CURLOPT_HTTPHEADER => array(
                  'Authorization: Basic ZmUzZDg1OWQtY2U0Ni00Nzg5LTg5MzgtYzY1ZTc4ZTI0NDVl',
                  'Content-Type: application/json'
                ),
            ));

            $blog->user_id = $user_id;
        }

        $response = curl_exec ($ch);
        $err = curl_error($ch);
        curl_close ($ch);

        $response = json_decode($response,true);
        // dd($response);
        if(isset($response['errors']) && count($response['errors']) > 0){     
            if(isset($response['errors']['invalid_external_user_ids'])){
                flash(__($response['errors']['invalid_external_user_ids']))->error();
            }else{
                flash(__($response['errors'][0]))->error();
            }
            return redirect()->back();
        }
        
        $blog->save();
        flash(__('Notification sent successfully.'))->success();
        return redirect()->route('notifications.index');
    }

    public function updateStatus(Request $request)
    {
        
        $blog = Notification::find($request->id);
        $blog->published = $request->status;
        if($blog->save()){
            return '1';
        }
        else {
            return '0';
        }

        return '0';
    }
    public function getUserNotification($id){
        $blog = Notification::where('user_id',$id)->orWhere('user_id',null)->count();

        if($blog > 0){
            $blog = Notification::where('user_id',$id)->orWhere('user_id',null)->get()->toArray();            
        }else{
            $blog = [];
        }
        return [
            'data' => json_encode($blog),
            'success' => true,
            'status' => 200
        ];
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $blog = Notification::findOrFail($id);
        return view('blog.edit',compact('blog'));
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
        $blog = Notification::find($id);
        $blog->photo = $request->previous_photo;
        if($request->hasFile('photo')){
            $blog->photo = $request->photo->store('uploads/blogs');
        }
        $blog->title = $request->title;
        $blog->description = $request->description;
        $blog->save();
        flash(__('Blog has been updated successfully'))->success();
        return redirect()->route('blog.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $blog = Notification::findOrFail($id);
        if(Notification::destroy($id)){
          
            flash(__('Blog has been deleted successfully'))->success();
        }
        else{
            flash(__('Something went wrong'))->error();
        }
        return redirect()->route('blog.index');
    }
}
