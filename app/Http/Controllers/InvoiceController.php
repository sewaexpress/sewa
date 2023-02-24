<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use PDF;
use Auth;

class InvoiceController extends Controller
{
    public function invoice($id){
        $order = Order::findOrFail($id);
        $content = view('invoices.customer_invoice', compact('order'))->render();
        // Render the "invoices.order" view with the provided data, and get its contents
    
        $headers = [
            'Content-Type' => 'text/html',
        ];
    
        return response($content, 200, $headers);

    }
    //downloads customer invoice
    public function customer_invoice_download($id)
    {
        $order = Order::findOrFail($id);
        // dd($order->orderDetails);
        $pdf = PDF::setOptions([
                        'isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true,
                        'logOutputFile' => storage_path('logs/log.htm'),
                        'tempDir' => storage_path('logs/')
                    ])->loadView('invoices.customer_invoice', compact('order'));
        return $pdf->download('order-'.$order->code.'.pdf');
    }

    //downloads seller invoice
    public function seller_invoice_download($id)
    {
        $order = Order::findOrFail($id);
        // dd($order->orderDetails);
        $pdf = PDF::setOptions([
                        'isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true,
                        'logOutputFile' => storage_path('logs/log.htm'),
                        'tempDir' => storage_path('logs/')
                    ])->loadView('invoices.seller_invoice', compact('order'));
        return $pdf->download('order-'.$order->code.'.pdf');
    }

    //downloads admin invoice
    public function admin_invoice_download($id)
    {
        $order = Order::findOrFail($id);
        $pdf = PDF::setOptions([
                        'isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true,
                        'logOutputFile' => storage_path('logs/log.htm'),
                        'tempDir' => storage_path('logs/')
                    ])->loadView('invoices.admin_invoice', compact('order'));
        return $pdf->download('order-'.$order->code.'.pdf');
    }
}
