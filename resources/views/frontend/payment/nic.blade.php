<html>
<body>
    @php
        $esewa=\App\BusinessSetting::where('type','esewa_payment')->where('value',1)->first();
        
      $shipping = json_decode($ordercode->shipping_address,true);
      $delivery_address = \App\Location::where('id',$shipping['delivery_location'])->first();
      $delivery_address_1 = $delivery_address->name;
      
      $delivery_state = \App\State::where('id',$delivery_address->district)->first();
      $delivery_state_1 = $delivery_state->name; 
      
      $params = [
        'access_key' => '087087404e8f3bb89bb32acc2ce5dddd',
        'amount' => $ordercode->grand_total,
        'bill_to_address_city' => (isset($shipping['city']))?$shipping['city']:'',
        'bill_to_address_country' => 'NP',
        'bill_to_address_line1' => (isset($shipping['address']))?$shipping['address']:'',
        'bill_to_address_line2' => (isset($shipping['address']))?$shipping['address']:'',
        'bill_to_address_postal_code' => '4600',
        'bill_to_address_state' => (isset($delivery_state_1))?$delivery_state_1:'',
        'bill_to_email' => (isset($shipping['email']))?$shipping['email']:'',
        'bill_to_forename' => (isset($shipping['name']))?$shipping['name']:'',
        'bill_to_surname' => (isset($shipping['name']))?$shipping['name']:'',
        'bill_to_phone' => (isset($shipping['phone']))?$shipping['phone']:'',
        'card_expiry_date' => '',
        'card_number' => '',
        'card_type' => '',
        'currency' => 'NPR',
        'payment_method' => 'card',
        'profile_id' => 'F375F85F-14E8-48FC-A629-71505B622052',
        'transaction_type' => 'sale',
        'reference_number' =>  date('Y-m-dh:i'),
        'transaction_uuid' => $ordercode->code,
        'signed_field_names' => 'access_key,amount,bill_to_address_city,bill_to_address_country,bill_to_address_line1,bill_to_address_line2,bill_to_address_postal_code,bill_to_address_state,bill_to_email,bill_to_forename,bill_to_surname,bill_to_phone,currency,payment_method,profile_id,transaction_type,reference_number,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,auth_trans_ref_no',
        'unsigned_field_names' => 'card_expiry_date,card_number,card_type',
        'signed_date_time' => gmdate("Y-m-d\TH:i:s\Z"),
        'locale' => 'en',
        'auth_trans_ref_no' => '22',
        // 'amount' => $ordercode->grand_total,
        // 'submit' => ''
    ];
    @endphp

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <?php

    define ('HMAC_SHA256', 'sha256');
    define ('SECRET_KEY', 'a15aa4de086349c492352e1ba9fe8e54dfbc69bfa15e40828e0ef8334f365b9adde78224151346bfb991903b23d0aa352eb3855a8eab4d64b93a1051f754d8ec8bcb50c00970430389fe8a5eac056d2595ce23c029a94638acf3bd263495fa6edf25483287c946b2a6a6042e5dafb6d075ca3eab2b6f42ab8d93caaa6c14b8de');

    // dd($params);
    
    function sign ($params) {
      // echo 'here<br>';
      return signData(buildDataToSign($params), SECRET_KEY);
    }
    
    function signData($data, $secretKey) {
        return base64_encode(hash_hmac('sha256', $data, $secretKey, true));
    }
    
    function buildDataToSign($params) {
      $signedFieldNames = explode(",",$params["signed_field_names"]);
      
      foreach ($signedFieldNames as $field) {
          $dataToSign[] = $field . "=" . $params[$field];
      }
      // echo 'lll<br>';
      return commaSeparate($dataToSign);
    }
    
    function commaSeparate ($dataToSign) {
      // echo '2222<br>';
        return implode(",",$dataToSign);
    }

    ?>
    <style>
      .submit-btn{
        background: transparent;
        border: none;
        font-size: 25px;
        margin-top: 25px;
      }
        
    </style>
    <form id="payment_confirmation" action="https://secureacceptance.cybersource.com/pay" method="post" style="text-align: center;"><br/>
      
<input class="submit-btn" type="submit" id="submit" value="Redirecting to NIC Pay..."/>
      <?php
    //   $name.' = '.$value .
      foreach($params as $name => $value) {
          echo " <input type=\"hidden\" id=\"" . $name . "\" name=\"" . $name . "\" value=\"" . $value . "\"/>\n";
      }
      echo "<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" . sign($params) . "\"/>\n";
  ?>

      
  </form>

  {{-- <script type="text/javascript" src="payment_form.js"></script> --}}
    <script>
      $(function () {
          payment_form = $('form').attr('id');
          addLinkToSetDefaults();
      });


      function setDefaultsForAll() {
          if (payment_form === "payment_confirmation"){
            setDefaultsForUnsignedDetailsSection();
          }
          else {
            setDefaultsForPaymentDetailsSection();
        } 
      }

      function addLinkToSetDefaults() {
          $(".section").prev().each(function (i) {
              legendText = $(this).text();
              $(this).text("");

              var setDefaultMethod = "setDefaultsFor" + capitalize($(this).next().attr("id")) + "()";

              newlink = $(document.createElement("a"));
              newlink.attr({
                  id:'link-' + i, name:'link' + i, href:'#'
              });
              newlink.append(document.createTextNode(legendText));
              newlink.bind('click', function () {
                  eval(setDefaultMethod);
              });

              $(this).append(newlink);
          });

          // newbutton = $(document.createElement("input"));
          // newbutton.attr({
          //     id:'defaultAll', value:'Default All', type:'button', onClick:'setDefaultsForAll()'
          // });
          // newbutton.bind('click', function() {
          //     setDefaultsForAll;
          // });
          // $("#"+payment_form).append(newbutton);
      }

      function capitalize(string) {
          return string.charAt(0).toUpperCase() + string.slice(1);
      }

      function setDefaultsForPaymentDetailsSection() {
          $("input[name='transaction_type']").val("authorization");
          $("input[name='reference_number']").val(new Date().getTime());
          $("input[name='amount']").val("100.00");
          $("input[name='currency']").val("USD");
      }

      function setDefaultsForUnsignedDetailsSection(){
          $("input[name='card_type']").val("001");
          $("input[name='card_number']").val("4242424242424242");
          $("input[name='card_expiry_date']").val("11-2020");
      }



      $('#submit').trigger('click');    
    </script>
    
  </body>
  
  </html>