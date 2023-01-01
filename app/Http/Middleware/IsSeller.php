<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class IsSeller
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $email = $_POST['email'];
        $password = $_POST['password'];
        if (Auth::attempt(['email' => $email, 'password' => $password])) {
            $user = Auth::user();
            if ($user->user_type == 'seller') {
                return redirect()->route('dashboard');
            } else {
                Auth::logout();
                flash("You must be a seller.")->error();
                return redirect()->route('shops.create')->with('error', 'You must be a seller.');
            }
        }else{
            return redirect()->route('shops.create')->with('error', 'Invalid Credentials');
        }
    }
}
