<?php

namespace App\Http\Controllers\Api;

use App\Faq;
use App\Http\Resources\PolicyCollection;
use App\Http\Resources\FaqCollection;
use App\Models\Policy;
use Illuminate\Http\Request;

class PolicyController extends Controller
{
    public function sellerPolicy()
    {
        return new PolicyCollection(Policy::where('name', 'seller_policy')->get());
    }

    public function supportPolicy()
    {
        return new PolicyCollection(Policy::where('name', 'support_policy')->get());
    }

    public function returnPolicy()
    {
        return new PolicyCollection(Policy::where('name', 'return_policy')->get());
    }
    public function terms()
    {
        return new PolicyCollection(Policy::where('name', 'terms')->get());
    }

    public function privacy()
    {
        return new PolicyCollection(Policy::where('name', 'privacy_policy')->get());
    }

    public function faq()
    {
        return new FaqCollection(Faq::all());
    }
}
