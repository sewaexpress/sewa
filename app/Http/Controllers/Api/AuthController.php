<?php /** @noinspection PhpUndefinedClassInspection */

namespace App\Http\Controllers\Api;

use App\Models\BusinessSetting;
use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\User;
use Exception;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function verifyOTP(Request $request){
        // dd($_POST);
        $validator= Validator::make($request->all(), [ 
            'otp' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status'=> 422,
                'message' =>  $validator->errors()->first()
            ], 201);
        }
        $user = Auth::user();
        $otpExpiry = $user->otp_expiry;
        $otp = $request->otp;
        $currentDateTime = Carbon::now();
        $otpExpiry = Carbon::parse($otpExpiry);

        if ($currentDateTime->gt($otpExpiry)) {
            // OTP has expired
            return response()->json([
                'status'=> 422,
                'message' =>  'OTP code has expired. Please request a new code.'
            ], 201);
        } else {
            if ($otp == $user->otp) {
                // OTP matches
                $user->email_verified_at = Carbon::now();
                $user->otp = null;
                $user->otp_expiry = null;
                $user->save();
                return response()->json([
                    'status'=>200,
                    'message' => 'Congratulations, Your account has been verified'
                ], 200);
                // return redirect()->route('dashboard')->with('success', 'Congratulations, Your account has been verified');
                // dd('1');
            } else {
                // OTP does not match
                return response()->json([
                    'status'=> 422,
                    'message' =>  'Invalid OTP'
                ], 201);
                // dd('2');
            }
        // OTP has not expired
        }
    }
    
    public function resendOTP(Request $request)
    {
        $user = Auth::user();
        try{
            $now = Carbon::parse('now');
            $thirtyMinutesLater = $now->addMinutes(30);
            $otp_code = strval(rand(10000, 99999));
            $otp_expiry = $thirtyMinutesLater;
            $user->otp = $otp_code;
            $user->otp_expiry = $otp_expiry;
            $user->save();

            $user->sendCustomVerificationEmail($otp_code);
            return response()->json([
                'status'=>200,
                'message' => 'OTP code was sent to your email'
            ], 201);
        }catch(Exception $e){
            return response()->json([
                'status'=> 422,
                'message' =>  $e->getMessage()
            ], 201);
        }

    }
    public function signup2(Request $request)
    {
        $validator= Validator::make($request->all(), [ 
            'name' => 'required|string',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:6'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status'=> 422,
                'message' =>  $validator->errors()->first()
            ], 201);
        }
       
        try{
            $now = Carbon::parse('now');
            $thirtyMinutesLater = $now->addMinutes(30);
            $otp_code = strval(rand(10000, 99999));
            $otp_expiry = $thirtyMinutesLater;

            $user = new User;
            $user->name = $request->name;
            $user->email = $request->email;
            $user->phone = ($request->phone)?$request->phone:null;
            $user->password = bcrypt($request->password);
            $user->email_verified_at = Carbon::now();
            $user->otp = $otp_code;
            $user->otp_expiry = $otp_expiry;
            $user->save();
            $customer = new Customer;
            $customer->user_id = $user->id;
             $customer->save();
             
             $user->sendCustomVerificationEmail($otp_code);
         }
         catch(\Exception $e){
            return response()->json([
                'status'=> 422,
                'message' =>  $e->getMessage()
            ], 201);
         }
            return response()->json([
                'status'=>200,
                'message' => 'Registration Successful. Please log in to your account'
            ], 201);

    }
    public function signup(Request $request)
    {
        $validator= Validator::make($request->all(), [ 
            'name' => 'required|string',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:6'
        ]);
        if ($validator->fails()) {
            return response()->json([
                // 'user'=>$user,
                // 'token'=>$tokenResult,
                'status'=> 422,
                'message' =>  $validator->errors()->first()
            ], 201);
        }
       
        try{
            $now = Carbon::parse('now');
            $thirtyMinutesLater = $now->addMinutes(30);
            $otp_code = strval(rand(10000, 99999));
            $otp_expiry = $thirtyMinutesLater;

            $user = new User;
            $user->name = $request->name;
            $user->email = $request->email;
            $user->phone = ($request->phone)?$request->phone:null;
            $user->password = bcrypt($request->password);
            $user->email_verified_at = Carbon::now();
            $user->otp = $otp_code;
            $user->otp_expiry = $otp_expiry;
            $user->save();
            $customer = new Customer;
            $customer->user_id = $user->id;
             $customer->save();
             
             $user->sendEmailVerificationNotification($otp_code);
            //  asdfasdfasdf
         }
         catch(\Exception $e){
            return response()->json([
                // 'user'=>$user,
                // 'token'=>$tokenResult,
                'status'=> 422,
                'message' =>  $e->getMessage()
            ], 201);
         }
        
       
        
        // $tokenResult = $user->createToken('Personal Access Token');
        // if ($validator->fails()) {
        //     return response()->json($validator->errors(), 422);
        // }
        // else {
            return response()->json([
                // 'user'=>$user,
                // 'token'=>$tokenResult,
                'status'=>200,
                'message' => 'Registration Successful. Please log in to your account'
            ], 201);
        // }

    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
            'remember_me' => 'boolean'
        ]);
        $credentials = request(['email', 'password']);
        if (!Auth::attempt($credentials))
            return response()->json(['message' => 'Unauthorized'], 401);
        $user = $request->user();
        $tokenResult = $user->createToken('Personal Access Token');
        return $this->loginSuccess($tokenResult, $user);
    }

    public function user(Request $request)
    {
        return response()->json($request->user());
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json([
            'status'=>200,
            'message' => 'Successfully logged out'
        ]);
    }

    public function socialLogin(Request $request)
    {
        // $request->validate([
        //     'email' => 'required|string'
        // ]);
        if (User::where('email', $request->email)->first() != null) {
            $user = User::where('email', $request->email)->first();
        } else {
            $custom_email = $request->name.'@gmail.com';
            $user = new User([
                'name' => $request->name,
                'email' => ($request->email)?$request->email:$custom_email,
                'provider_id' => $request->provider,
                'email_verified_at' => Carbon::now()
            ]);
            $user->save();
            $customer = new Customer;
            $customer->user_id = $user->id;
            $customer->save();
        }
        $tokenResult = $user->createToken('Personal Access Token');
        return $this->loginSuccess($tokenResult, $user);
    }

    protected function loginSuccess($tokenResult, $user)
    {
        $token = $tokenResult->token;
        $token->expires_at = Carbon::now()->addWeeks(100);
        $token->save();
        return response()->json([
            'access_token' => $tokenResult->accessToken,
            'token_type' => 'Bearer',
            'expires_at' => Carbon::parse(
                $tokenResult->token->expires_at
            )->toDateTimeString(),
            'message'=>'Login Successful',
            'status'=>200,
            'user' => [
                'id' => $user->id,
                'type' => $user->user_type,
                'name' => $user->name,
                'email' => $user->email,
                'avatar' => $user->avatar,
                'avatar_original' => $user->avatar_original,
                'address' => $user->address,
                'country'  => $user->country,
                'city' => $user->city,
                'postal_code' => $user->postal_code,
                'phone' => $user->phone
            ]
        ]);
    }
}
