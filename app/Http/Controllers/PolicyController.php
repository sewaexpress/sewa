<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Policy;
use Illuminate\Support\Facades\Auth;
use SimpleXMLElement;

class PolicyController extends Controller
{

    public function index($type)
    {
        // dd(Auth::check());
        // $khalti_secret=\App\BusinessSetting::where('type','khalti_secret')->first();
        // $token = '2753TnkomJnnGRw3WVsBPzSc2';
        // $amount = 1500;
        // $args = http_build_query(array('token'=>'2753TnkomJnnGRw3WVsBPzSc2','amount'=>$amount));
        
        // $url = "https://khalti.com/api/v2/payment/verify/";
        
        // # Make the call using API.
        // $ch = curl_init();
        // curl_setopt($ch, CURLOPT_URL, $url);
        // curl_setopt($ch, CURLOPT_POST, 1);
        // curl_setopt($ch, CURLOPT_POSTFIELDS, $args);
        // curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        
        // $headers = ['Authorization: Key '.$khalti_secret->value];
        // curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        
        // // Response
        // $response = curl_exec($ch);
        // $status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        
        // // Close the handle
        // curl_close($ch);
        // dd([
        //     'arugements_to_khalti' => $args,
        //     'response_from_khalti' => $response,
        //     'token_trimmed' => trim($token),
        //     'token_untrimmed' => $token,
        //     'amout' => $amount,
        //     'khalti_secret' => $khalti_secret->value
        // ]);
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
