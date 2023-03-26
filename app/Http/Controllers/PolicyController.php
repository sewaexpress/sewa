<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Policy;

class PolicyController extends Controller
{

    public function index($type)
    {
        $data =[
            'amt'=> 100,
            'rid'=> '000AE01',
            'pid'=>'ee2c3ca1-696b-4cc5-a6be-2c40d929d453',
            'scd'=> 'NP-ES-SEWADIGITALEXPRESS'
        ];
        
        $url = "https://uat.esewa.com.np/epay/transrec";
        
        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($curl);

        $status_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        
        // Close the handle
        curl_close($curl);
        
        // Process the response
        if ($status_code == 200) {
            // The request was successful
            echo '1';
            echo $response;
        } else {
            $response = json_decode($response,true);
            if(isset($response['error_key'])){

                // There was an error
                echo json_encode($response);
                echo '2';
            }else{

            // There was an error
            echo json_encode($status_code);
            // There was an error
            echo json_encode($status_code);
            echo '3';
            }
        }
        
        dd($curl);
        $policy = Policy::where('name', $type)->first();
        // dd($policy);
        return view('policies.index', compact('policy'));
    }

    //updates the policy pages
    public function store(Request $request){
        $policy = Policy::where('name', $request->name)->first();
        $policy->name = $request->name;
        $policy->content = $request->content;
        $policy->save();

        flash($request->name.' updated successfully');
        return back();
    }
}
