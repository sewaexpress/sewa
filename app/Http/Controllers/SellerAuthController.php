<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;

class SellerAuthController extends Controller
{
    use AuthenticatesUsers;

    protected $redirectTo = '/dashboard';

    protected function redirectTo()
    {
        if (auth()->user()->role == 'seller') {
            return '/dashboard';
        }
        return '/shops/create';
    }
    public function __construct()
    {
        // $email = $_POST['email'];
        // $password = $_POST['password'];
        // if (Auth::attempt(['email' => $email, 'password' => $password])) {
        //     $user = Auth::user();
        //     if ($user->user_type == 'seller') {
        //         return redirect()->route('dashboard');
        //     } else {
        //         Auth::logout();
        //         session()->flush();
        //         return redirect()->route('shops.create')->with('error', 'You must be a seller to access this page.');
        //     }
        // }else{
        //     dd('asdf');
        // }
        // dd($this->middleware('seller')->except('logout'));
        $this->middleware('seller')->except('logout');
    }
}
