<body>
    @php
        $esewa=json_decode(\App\BusinessSetting::where('type','esewa_payment')->first()->value);
    @endphp

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    {{-- merchant.esewa.com.np
    NP-ES-SEWADIGITALEXPRESS --}}
      <form action="https://esewa.com.np/epay/main" method="POST">
      <input value="{{$ordercode->grand_total}}" name="tAmt" type="hidden">
      <input value="{{$ordercode->grand_total}}" name="amt" type="hidden">
      <input value="0" name="txAmt" type="hidden">
      <input value="0" name="psc" type="hidden">
      <input value="0" name="pdc" type="hidden">
      <input value="{{$esewa->esewa_key}}" name="scd" type="hidden">
      <input value="{{$ordercode->code}}" name="pid" type="hidden">
      <input value="https://www.sewaexpress.com/page/esewa_payment_success?q=su" type="hidden" name="su">
      <input value="https://www.sewaexpress.com/page/esewa_payment_failed?q=fu" type="hidden" name="fu">
      <input value="Submit" class ='submitesewa' type="submit" style= "display:none">
      </form>
    <script> 
    $('.submitesewa').trigger('click');
    
    </script>
    
  </body>