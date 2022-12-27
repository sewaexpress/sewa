<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\UserCollection;
use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function info($id)
    {
        return new UserCollection(User::where('id', $id)->get());
    }

    public function updateName(Request $request)
    {
        $user = User::findOrFail($request->user_id);
        if($request->hasFile('photo')){
            $file = $request->photo->store('uploads/users');
        }else{
            $file = $user->avatar_original;
        }
        $user->update([
            'name' => $request->name,
            'avatar_original' => $file,
            'country' => $request->country,
            'phone' => $request->phone,
            'address' => $request->address,
            'postal_code' => $request->postal_code,
        ]);
        return response()->json([
            'message' => 'Profile information has been updated successfully'
        ]);
    }

    public function updateShippingAddress(Request $request)
    {
        $user = User::findOrFail($request->user_id);
        $user->update([
            'address' => $request->address,
            'city' => $request->city,
            'country' => $request->country,
            'phone' => $request->phone,
            'postal_code' => $request->postal_code
        ]);
        return response()->json([
            'message' => 'Shipping information has been updated successfully'
        ]);
    }
}
