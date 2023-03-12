<?php

namespace App\Http\Controllers\Api;

use App\AppReferList;
use App\Http\Resources\AppReferCollection;
use App\Http\Resources\RewardRangeCollection;
use App\Http\Resources\UserCollection;
use App\Models\BusinessSetting;
use App\Models\Policy;
use App\RewardAmount;
use App\RewardRange;
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
    public function getReferInfo(){
        $id = Auth::user()->id;
        $refer_count = AppReferList::where('referrer_user_id', $id)->where('status', null)->count();
        $reward_amount = RewardAmount::where('user_id', $id)->first();
        return response()->json([
            'refer_count' => $refer_count,
            'reward_amount' => ($reward_amount)?$reward_amount->amount:0,
        ]);
    }
    public function redeemReward(){
        $user_id = Auth::user()->id;
        $refer_count = AppReferList::where('referrer_user_id', $user_id)->where('status', null)->count();
        if($refer_count > 0){    
            $reward_amount = RewardAmount::where('user_id', $user_id)->count();
            $business_settings = BusinessSetting::where('type', 'app_refer_point')->first();
            $final_amount = 0;
            if($reward_amount > 0){
                $reward_amount = RewardAmount::where('user_id', $user_id)->first();
                $reward_amount->amount +=  $refer_count * $business_settings->value;
                $final_amount = $reward_amount->amount;
                $reward_amount->save();
            }else{                
                $reward_amount = new RewardAmount;
                $reward_amount->user_id = strval(Auth::user()->id);
                $reward_amount->amount =  $refer_count * $business_settings->value;
                $final_amount = $reward_amount->amount;
                $reward_amount->save();
            }
                
            $refer_count = AppReferList::where('referrer_user_id', $user_id)->update(['status' => 'redeemed']);

            return response()->json([
                'success' => true,
                'message' => 'Successfully Redeemed',
                'data'=> $final_amount,
            ]); 

        }else{       
            $reward_amount = RewardAmount::where('user_id', $user_id)->count();
            $final_amount = 0;
            if($reward_amount > 0){
                $reward_amount = RewardAmount::where('user_id', $user_id)->first();
                $final_amount =  $reward_amount->amount;
            }
            return response()->json([
                'success' => false,
                'message' => 'You have no refers left.',
                'data'=> $final_amount,
            ]); 
        }
    }
    public function getRewardRange(){
        // return new RewardRangeCollection(RewardRange::get());
        $aaa = RewardRange::get();
        $policy = Policy::where('name','reward_policy')->get();
        $data = [];
        foreach($aaa as $range){
            $data[] = [
                'id' => (integer) $range->id,
                'start_range' => (integer) $range->start_range,
                'end_range' => (string) $range->end_range,
                'value' => (integer) $range->value
            ];
        }
        $policy = (isset($policy->content))?$policy->content:null;
        
        return response()->json([
            'success' => true,
            'message' => 'Success',
            'data' => $data,
            'policy' => $policy
        ]);
        dd($data);
    }
    public function validateReward(Request $request){
        $id = Auth::user()->id;
        $sub_total_amount = $request->sub_total;
        $reward_amount_discount = 0;
        
        $reward_amount = RewardAmount::where('user_id', $id)->first();                
        $sub_total_of_order = $sub_total_amount;
        $reward_ranges = RewardRange::get();
        $selected_range = [];
        $customer_reward_amount = 0;
        $minimum_reward_amount = 0;
        $selected_range_key = 0;
        //if user has reward amount which is greater than 0
        if(!empty($reward_amount) && $reward_amount->amount > 0){
            foreach($reward_ranges as $key => $ranges){
                if($key == 0){
                    $minimum_reward_amount = $ranges->value;
                }
                if($ranges->end_range != 'Above'){
                    if($sub_total_of_order >= $ranges->start_range && $sub_total_of_order <= ($ranges->end_range)){
                        $selected_range = $ranges;
                        $selected_range_key = $key;
                    }
                }else{
                    if($sub_total_of_order >= $ranges->start_range){
                        $selected_range = $ranges;
                        $selected_range_key = $key;
                    }
                }
            }
            if(!empty($selected_range)){
                $max_reward_discount = $selected_range->value;
                $customer_reward_amount = $reward_amount->amount;
                if($customer_reward_amount >= $max_reward_discount){
                    return response()->json([
                        'success' => true,
                        'max_reward_discount' => $max_reward_discount,
                        'customer_reward_amount' => $customer_reward_amount,
                        'reward_range' => $selected_range,
                        'message' => 'You can use your reward amount',
                    ]);
                }else{
                    return response()->json([
                        'success' => false,
                        'message' => 'You donot have enough reward balance.',
                    ]);
                    // if($selected_range_key != 0){
                    //     for($i = $selected_range_key; $i < 0; $i--){
                    //         $reward_ranges
                    //     }
                    // }else{
                    //     return response()->json([
                    //         'success' => false,
                    //         'message' => 'You have no reward point balance.',
                    //     ]);
                    // }
                }
            }
        }else{
            return response()->json([
                'success' => false,
                'message' => 'You have no reward point balance.',
            ]);
        }
    }
    public function getRewardAmount($id){
        $reward_amount = RewardAmount::where('user_id', $id)->first();
        return response()->json([
            'amount' => ($reward_amount)?$reward_amount->amount:0,
            'message' => 'Reward Amount retreived successfully'
        ]);
    }
    public function getRefers($id){
        return new AppReferCollection(AppReferList::where('referrer_user_id', $id)->where('status', null)->with('referred_by','referred_to')->get());
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
            
            $file = 'uploads/users/'.$timestamp.'.jpg';
        }else{
            $file = $user->avatar_original;
        }
        
        $user = User::findOrFail($request->user_id);
        $user->update([
            'avatar_original' => $file,
        ]);
        return response()->json([
            // 'file' => $file,
            // 'user' => $user,
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
