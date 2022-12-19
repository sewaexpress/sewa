<?php

namespace App\Http\Middleware;

use App\Models\Seller;
use App\User;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string
     */
    protected function redirectTo($request)
    {
        if ($request->input('signature')) {
            $uri_path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
            $uri_segments = explode('/', $uri_path);
            if(isset($uri_segments[3]) & $uri_segments[3] > 0){
                $user_id = $uri_segments[3];
                $user = User::where('id',$user_id)->count();
                if($user > 0){
                    
                    $user = User::where('id',$user_id)->update([
                        'email_verified_at' => date('Y-m-d')
                    ]);

                    $user = User::where('id',$user_id)->first();
                    $user_type = $user->user_type;

                    if($user_type == 'customer'){
                        return route('user.login');
                    }elseif($user_type == 'seller'){
                        $seller = Seller::where('user_id',$user_id)->count();
                        $user = User::where('id',$user_id)->count();
                        if($user > 0){
                            $seller = Seller::where('user_id',$user_id)->update([
                                'verification_status' => 1
                            ]);
                            return route('user.login');
                        }
                    }
                }
            }
        // return redirect('home');
        }
        return route('login');
    }
}
