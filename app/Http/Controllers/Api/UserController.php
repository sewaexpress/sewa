<?php

namespace App\Http\Controllers\Api;

use App\AppReferList;
use App\Http\Resources\AppReferCollection;
use App\Http\Resources\UserCollection;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function info($id)
    {
        $user = User::where('id', $id)->first();
        if($user->referral_code == ''){
            $referral_code = $this->createReferralCode($id);
        }
        return new UserCollection(User::where('id', $id)->get());
    }
    public function createReferralCode($id){
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $referral_code = substr($id.(substr(str_shuffle($characters), 0, 6)), 0, 10);
        $validator = Validator::make(['referral_code' => $referral_code], ['referral_code' => 'unique:users']);
        if ($validator->fails()) {
            $this->createReferralCode($id);
        } else {
            User::where('id', $id)->update([
                'referral_code' => $referral_code
            ]);
        }

    }
    public function getRefers($id){
        return new AppReferCollection(AppReferList::where('referrer_user_id', $id)->with('referred_by','referred_to')->get());
    }
    public function updateImage(Request $request){
        //update user image
        $user = User::findOrFail($request->user_id);
        if($request->hasFile('photo')){
            $timestamp = strtotime(date('Y-m-d H:i:s'));
            switch (exif_imagetype($request->photo)) {
                case IMAGETYPE_JPEG:
                    $image = imagecreatefromjpeg($request->photo);
                    break;
                case IMAGETYPE_PNG:
                    $image = imagecreatefrompng($request->photo);
                    break;
                default:
                    $image = $request->photo;
                    break;
            }
            $compression_level = 20;
            $image_width = imagesx($image); // Get the width of the original image
            $image_height = imagesy($image); // Get the height of the original image
            $new_image = imagecreatetruecolor($image_width, $image_height); // Create a new image with the same dimensions as the original image
            imagecopyresampled($new_image, $image, 0, 0, 0, 0, $image_width, $image_height, $image_width, $image_height); // Copy the original image to the new image, maintaining the resolution
            imagejpeg($new_image, 'uploads/users/'.$timestamp.'.jpg', $compression_level); // Save the new image with a compression level of 75 (higher numbers mean more compression, but also lower quality)
            // $product->thumbnail_img = 'uploads/products/thumbnail/'.$timestamp.'.jpg';
            
            $file = 'uploads/products/thumbnail/'.$timestamp.'.jpg';
        }else{
            $file = $user->avatar_original;
        }
        $user->update([
            'avatar_original' => $file,
        ]);
        return response()->json([
            'message' => 'Profile Image has been updated successfully'
        ]);
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
