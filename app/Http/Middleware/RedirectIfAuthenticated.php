<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if(isset($_POST['email']) && isset($_POST['password'])){
            $email = $_POST['email'];
            $password = $_POST['password'];
            if (Auth::attempt(['email' => $email, 'password' => $password])) {
                $user = Auth::user();
                if ($user->user_type == 'customer') {
                    return redirect()->route('dashboard');
                }elseif(Auth::user()->user_type == 'admin' || Auth::user()->user_type == 'staff'){
                    return redirect()->route('admin.dashboard');
                } else {
                    Auth::logout();
                    flash("You must be a customer.")->error();
                    return redirect()->route('user.login')->with('error', 'You must be a customer.');
                }
    
            }

        }
        // if (Auth::check()) {
            // if (Auth::user()->user_type == 'admin' || Auth::user()->user_type == 'staff') {
            //     return redirect()->route('admin.dashboard');
            // } elseif (session('link') != null) {
            //     return redirect(session('link'));
            // } else {
            //     return redirect()->route('dashboard');
            // }

        // }

        return $next($request);

        
    }
}
