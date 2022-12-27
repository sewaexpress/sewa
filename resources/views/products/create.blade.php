@extends('layouts.app')

@section('content')
<div>
    <h1 class="page-header text-overflow">Add New Product</h1>
</div>
<div class="row">
	<div class="col-lg-8 col-lg-offset-2">
		<form class="form form-horizontal mar-top" action="{{route('products.store')}}" method="POST" enctype="multipart/form-data" id="choice_form">
			@csrf
			<input type="hidden" name="added_by" value="admin">
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('Product Information')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Product Name')}}</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" name="name" placeholder="{{__('Product Name')}}" onchange="update_sku()" required>
						</div>
					</div>
					<div class="form-group" id="category">
						<label class="col-lg-2 control-label">{{__('Category')}}</label>
						<div class="col-lg-7">
							<select class="form-control demo-select2-placeholder" name="category_id" id="category_id" required>
								@foreach($categories as $category)
									<option value="{{$category->id}}">{{__($category->name)}}</option>
								@endforeach
							</select>
						</div>
					</div>
					<div class="form-group" id="subcategory">
						<label class="col-lg-2 control-label">{{__('Subcategory')}}</label>
						<div class="col-lg-7">
							<select class="form-control demo-select2-placeholder" name="subcategory_id" id="subcategory_id" required>

							</select>
						</div>
					</div>
					<div class="form-group" id="subsubcategory">
						<label class="col-lg-2 control-label">{{__('Sub Subcategory')}}</label>
						<div class="col-lg-7">
							<select class="form-control demo-select2-placeholder" name="subsubcategory_id" id="subsubcategory_id">

							</select>
						</div>
					</div>
					<div class="form-group" id="brand">
						<label class="col-lg-2 control-label">{{__('Brand')}}</label>
						<div class="col-lg-7">
							<select class="form-control demo-select2-placeholder" name="brand_id" id="brand_id">
								<option value="">{{ ('Select Brand') }}</option>
								@foreach (\App\Brand::all() as $brand)
									<option value="{{ $brand->id }}">{{ $brand->name }}</option>
								@endforeach
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Unit')}}</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" name="unit" placeholder="Unit (e.g. KG, Pc etc)" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Tags')}}</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" name="tags[]" placeholder="Type to add a tag" data-role="tagsinput">
						</div>
					</div>
					@php
					    $pos_addon = \App\Addon::where('unique_identifier', 'pos_system')->first();
					@endphp
					@if ($pos_addon != null && $pos_addon->activated == 1)
						<div class="form-group">
							<label class="col-lg-2 control-label">{{__('Barcode')}}</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" name="barcode" placeholder="{{ ('Barcode') }}">
							</div>
						</div>
					@endif

					@php
					    $refund_request_addon = \App\Addon::where('unique_identifier', 'refund_request')->first();
					@endphp
					@if ($refund_request_addon != null && $refund_request_addon->activated == 1)
						<div class="form-group">
							<label class="col-lg-2 control-label">{{__('Refundable')}}</label>
							<div class="col-lg-7">
								<label class="switch" style="margin-top:5px;">
									<input type="checkbox" name="refundable" checked>
		                            <span class="slider round"></span></label>
								</label>
							</div>
						</div>
					@endif

					<div class="form-group">
						<label for="made_in_nepal" class="col-lg-2 control-label">{{ __('Made in Nepal') }}</label>
						<div class="col-lg-7">
							<label class="switch" style="margin-top: 5px;">
								<input type="checkbox" name="made_in_nepal">
								<span class="slider round"></span>
							</label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="warranty" class="col-lg-2 control-label">{{ __('Warranty') }}</label>
						<div class="col-lg-7">
							<label class="switch" style="margin-top: 5px;">
								<input type="checkbox" name="warranty" id="warranty">
								<span class="slider round"></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="warranty_time" class="col-lg-2 control-label">{{ __('Warranty Time') }}</label>
						<div class="col-lg-7">
								<input type="text" class="form-control" name="warranty_time" placeholder="Warranty Time" id="warranty_time">
						</div>
					</div>

					<div class="form-group" id="brand">
						<label class="col-lg-2 control-label">Vendor</label>
						<div class="col-lg-7">
							<select class="form-control demo-select2-placeholder" name="vendor_id" id="vendor_id">
								<option value="in-house" selected>InHouse Product</option>
								@foreach (\App\Seller::with('user')->whereHas('user')->get() as $seller)
									<option value="{{ $seller->user_id }}">{{ $seller->user->name }}</option>
								@endforeach
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('Product Images')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Gallery Images')}} </label>
						<div class="col-lg-7">
							<div id="photos">

							</div>
						</div>
					</div>
					{{-- <div class="form-group">
						<label class="col-lg-2 control-label">{{__('Thumbnail Image')}} <small>(290x300)</small></label>
						<div class="col-lg-7">
							<div id="thumbnail_img">

							</div>
						</div>
					</div> --}}
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Featured')}} <small>(290x300)</small></label>
						<div class="col-lg-7">
							<div id="featured_img">

							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Flash Deal')}} <small>(290x300)</small></label>
						<div class="col-lg-7">
							<div id="flash_deal_img">

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('Product Videos')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Video Provider')}}</label>
						<div class="col-lg-7">
							<select class="form-control demo-select2-placeholder" name="video_provider" id="video_provider">
								<option value="youtube">{{__('Youtube')}}</option>
								<option value="dailymotion">{{__('Dailymotion')}}</option>
								<option value="vimeo">{{__('Vimeo')}}</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Video Link')}}</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" name="video_link" placeholder="{{__('Video Link')}}">
						</div>
					</div>
				</div>
			</div>
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('Product Variation')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-lg-2">
							<input type="text" class="form-control" value="{{__('Colors')}}" disabled>
						</div>
						<div class="col-lg-7">
							<select class="form-control color-var-select" name="colors[]" id="colors" multiple disabled>
								@foreach (\App\Color::orderBy('name', 'asc')->get() as $key => $color)
									<option value="{{ $color->code }}">{{ $color->name }}</option>
								@endforeach
							</select>
						</div>
						<div class="col-lg-2">
							<label class="switch" style="margin-top:5px;">
								<input value="1" type="checkbox" name="colors_active">
								<span class="slider round"></span>
							</label>
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-2">
							<input type="text" class="form-control" value="{{__('Attributes')}}" disabled>
						</div>
	                    <div class="col-lg-7">
	                        <select name="choice_attributes[]" id="choice_attributes" class="form-control demo-select2" multiple data-placeholder="Choose Attributes">
								@foreach (\App\Attribute::all() as $key => $attribute)
									<option value="{{ $attribute->id }}">{{ $attribute->name }}</option>
								@endforeach
	                        </select>
	                    </div>
	                </div>

					<div>
						<p>Choose the attributes of this product and then input values of each attribute</p>
						<br>
					</div>

					<div class="customer_choice_options" id="customer_choice_options">

					</div>

					{{-- <div class="customer_choice_options" id="customer_choice_options">

					</div>
					<div class="form-group">
						<div class="col-lg-2">
							<button type="button" class="btn btn-info" onclick="add_more_customer_choice_option()">{{ __('Add more customer choice option') }}</button>
						</div>
					</div> --}}
				</div>
			</div>
			<div class="panel color-images-panel hidden">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('Color Images')}}</h3>
				</div>
				<div class="panel-body">
					<table class="table table-bordered color-images-table">
						<thead>
							<tr>
								<td class="text-center">
									<label for="" class="control-label">{{__('Color')}}</label>
								</td>
								<td class="text-center" style="width:40%;">
									<label for="" class="control-label">{{__('Image')}}</label>
								</td>
								<td class="text-center">
									<label for="" class="control-label">{{__('Action')}}</label>
								</td>
							</tr>
						</thead>
						<tbody>
							<style>
								.color-image-label{
									cursor: pointer;
									background: #64bd63;
									padding: 5px 5px 5px 5px;
									color: white;
									border-radius: 5px;
								}
								.upload-photo {
									opacity: 0;
									position: absolute;
									z-index: -1;
								}
							</style>
						</tbody>
					</table>
				</div>
			</div>
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('Product price + stock')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Unit price')}}</label>
						<div class="col-lg-7">
							<input type="number" min="0" value="0" step="0.01" placeholder="{{__('Unit price')}}" name="unit_price" class="form-control unit_price" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Purchase price')}}</label>
						<div class="col-lg-7">
							<input type="number" min="0" value="0" step="0.01" placeholder="{{__('Purchase price')}}" name="purchase_price" class="form-control" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Tax')}}</label>
						<div class="col-lg-7">
							<input type="number" min="0" value="0" step="0.01" placeholder="{{__('Tax')}}" name="tax" class="form-control" required>
						</div>
						<div class="col-lg-3">
							<select class="demo-select2" name="tax_type">
								<option value="amount">{{__('Flat')}}</option>
								<option value="percent">{{__('Percent')}}</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Discount')}}</label>
						<div class="col-lg-7">
							<input type="number" min="0" value="0" step="0.01" placeholder="{{__('Discount')}}" name="discount" class="form-control discount" required>
						</div>
						<div class="col-lg-3">
							<select class="demo-select2 discount-type" name="discount_type">
								<option value="amount">{{__('Flat')}}</option>
								<option value="percent">{{__('Percent')}}</option>
							</select>
						</div>
					</div>
					<div class="form-group" id="quantity">
						<label class="col-lg-2 control-label">{{__('Quantity')}}</label>
						<div class="col-lg-7">
							<input type="number" min="0" value="0" step="1" placeholder="{{__('Quantity')}}" name="current_stock" class="form-control" required>
						</div>
					</div>
					<div class="form-group">						
						<label class="col-lg-2 control-label">{{__('Product Price')}}</label>
						<div class="col-lg-7">
							<input type="number" value="0" readonly placeholder="{{__('Product Price')}}" class="form-control product_price" >
						</div>
					</div>
					<br>
					<div class="sku_combination" id="sku_combination">

					</div>
				</div>
			</div>
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('Product Description')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Description')}}</label>
						<div class="col-lg-9">
							<textarea class="editor" name="description"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('Product Specification')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Specification')}}</label>
						<div class="col-lg-9">
							<textarea class="editor" name="specs"></textarea>
						</div>
					</div>
				</div>
			</div>
            @if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'product_wise_shipping')
                <div class="panel">
    				<div class="panel-heading bord-btm">
    					<h3 class="panel-title">{{__('Product Shipping Cost')}}</h3>
    				</div>
    				<div class="panel-body">
    					<div class="row bord-btm">
    						<div class="col-md-2">
    							<div class="panel-heading">
    								<h3 class="panel-title">{{__('Free Shipping')}}</h3>
    							</div>
    						</div>
    						<div class="col-md-10">
    							<div class="form-group">
    								<label class="col-lg-2 control-label">{{__('Status')}}</label>
    								<div class="col-lg-7">
    									<label class="switch" style="margin-top:5px;">
    										<input type="radio" name="shipping_type" value="free" checked>
    										<span class="slider round"></span>
    									</label>
    								</div>
    							</div>
    						</div>
    					</div>
    					<div class="row">
    						<div class="col-md-2">
    							<div class="panel-heading">
    								<h3 class="panel-title">{{__('Flat Rate')}}</h3>
    							</div>
    						</div>
    						<div class="col-md-10">
    							<div class="form-group">
    								<label class="col-lg-2 control-label">{{__('Status')}}</label>
    								<div class="col-lg-7">
    									<label class="switch" style="margin-top:5px;">
    										<input type="radio" name="shipping_type" value="flat_rate" checked>
    										<span class="slider round"></span>
    									</label>
    								</div>
    							</div>
    							<div class="form-group">
    								<label class="col-lg-2 control-label">{{__('Shipping cost')}}</label>
    								<div class="col-lg-7">
    									<input type="number" min="0" value="0" step="0.01" placeholder="{{__('Shipping cost')}}" name="flat_shipping_cost" class="form-control" required>
    								</div>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
            @endif
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('PDF Specification')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('PDF Specification')}}</label>
						<div class="col-lg-7">
							<input type="file" class="form-control" placeholder="{{__('PDF')}}" name="pdf" accept="application/pdf">
						</div>
					</div>
				</div>
			</div>
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('SEO Meta Tags')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Meta Title')}}</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" name="meta_title" placeholder="{{__('Meta Title')}}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Description')}}</label>
						<div class="col-lg-7">
							<textarea name="meta_description" rows="8" class="form-control"></textarea>
						</div>
					</div>

					{{-- <div class="form-group">
						<label class="col-lg-2 control-label">{{ __('Meta Image') }}</label>
						<div class="col-lg-7">
							<div id="meta_photo">

							</div>
						</div>
					</div> --}}
				</div>
			</div>
			<div class="mar-all text-right">
				<button type="submit" name="button" class="btn btn-info">{{ __('Add New Product') }}</button>
			</div>
		</form>
	</div>
</div>


@endsection

@section('script')

<script type="text/javascript">
	function add_more_customer_choice_option(i, name){
		$('#customer_choice_options').append('<div class="form-group"><div class="col-lg-2"><input type="hidden" name="choice_no[]" value="'+i+'"><input type="text" class="form-control" name="choice[]" value="'+name+'" placeholder="Choice Title" readonly></div><div class="col-lg-7"><input type="text" class="form-control" name="choice_options_'+i+'[]" placeholder="Enter choice values" data-role="tagsinput" onchange="update_sku()"></div></div>');

		$("input[data-role=tagsinput], select[multiple][data-role=tagsinput]").tagsinput();
	}

	$('input[name="colors_active"]').on('change', function() {
	    if(!$('input[name="colors_active"]').is(':checked')){
			$('#colors').prop('disabled', true);
		}
		else{
			$('#colors').prop('disabled', false);
		}
		update_sku();
	});
	$(document).on('change', '.upload-photo', function () {
	// $('.upload-photo').change(function() {
		var imageTag = $(this).data('image');
		// Get the selected image file
		var imageFile = $(this)[0].files[0];

		// Create an object URL for the selected image file
		var objectUrl = URL.createObjectURL(imageFile);

		// Set the src attribute of the image tag to the object URL
		$('.'+imageTag).attr('src', objectUrl);
	});

	$('#colors').on('change', function() {
		if($('.color-images-panel').hasClass('hidden')){
			$('.color-images-panel').removeClass('hidden');
		}
		// Get an array of the values of the classes of all tr elements in the tbody
		var trClassValues = $('.color-images-table tbody tr').map(function() {
			return $(this).attr('class');
		}).get();

		// Get the selected values from the select box
		var selectedValues = $(this).val();
		var diff = $(selectedValues).not(trClassValues).get();
		if(diff != ''){
			// Create an empty object to store the selected option values and texts
			var selectedOptionValuesAndTexts = {};

			// Get an array of the selected options in the select box
			var selectedOptions = $('#colors option:selected');

			// Loop through the selected options
			selectedOptions.map(function() {
				// Get the value and text of the selected option
				var value = $(this).val();
				var text = $(this).text();

				// Add the value and text of the selected option to the object
				selectedOptionValuesAndTexts[value] = text;
			});
			// console.log(selectedOptionValuesAndTexts);
			// Loop through the selected values
			for (var i = 0; i < diff.length; i++) {
				var name = '';
				// selectedOptionValuesAndTexts.each(function(index,value) {
				// 	if(index == diff[i]){
				// 		name = value;
				// 	}
				// });
				// Check if a given key exists in the object
				if (diff[i] in selectedOptionValuesAndTexts) {
					// If the key exists, log a message
					name = selectedOptionValuesAndTexts[diff[i]];
					console.log('The key exists in the object.');
				}
				var selectedValue = diff[i];
				var string = '<tr class="'+selectedValue+'">'+
							'<td class="text-center">'+
							'<label for="" class="control-label">'+name+'</label>'+
							'</td>'+
							'<td class="text-center">'+
							'<img class="image-'+name+'" style="width:100%;" src="" alt="">'+
							'</td>'+
							'<td class="text-center">'+
							'<label for="upload-photo-'+selectedValue+'" class="color-image-label">Upload</label>'+
							'<input type="hidden" name="color_image['+selectedValue+'][name]" value="'+name+'">'+
							'<input type="hidden" name="color_image['+selectedValue+'][code]" value="'+selectedValue+'">'+
							'<input type="hidden" name="color_image['+selectedValue+'][image]" value="'+selectedValue+'">'+
							'<input data-image="image-'+name+'" class="upload-photo" type="file" name="color_image['+selectedValue+'][new-image]" id="upload-photo-'+selectedValue+'"/>'+
							'</td>'+
							'</tr>';
				$('.color-images-table').append(string);
			}
		}else{
			diff = $(trClassValues).not(selectedValues).get();
			$('.color-images-table tbody tr').each(function() {
				var rowValue = $(this).attr('class')

				// Check if the row value is not in the selected values
				if ($.inArray(rowValue, selectedValues) === -1) {
					// If not, remove the row from the table
					$(this).remove();
				}
			});

		}
	    update_sku();
	});

	$('input[name="unit_price"]').on('keyup', function() {
	    update_sku();
	});

	$('input[name="name"]').on('keyup', function() {
	    update_sku();
	});

	function delete_row(em){
		$(em).closest('.form-group').remove();
		update_sku();
	}
	
	$('.discount-type ').on('change',function(){
		// console.log('ASDF');
		var unitPrice = $('.unit_price').val();
		var discount = $('.discount').val();
		var discountType = $('.discount-type').val();

		var actualPrice = 0;

		if(discountType == 'amount'){
			actualPrice = unitPrice - discount;
		}else{
			if(discount != 0){
				discount  = ((discount * unitPrice) / 100);
			}else{
				discount = 0;
			}
			actualPrice = unitPrice - discount;
		}
		$('.product_price').val(actualPrice);
	});
	$('.discount').on('keyup',function(){
		// console.log('ASDF');
		var unitPrice = $('.unit_price').val();
		var discount = $('.discount').val();
		var discountType = $('.discount-type').val();

		var actualPrice = 0;

		if(discountType == 'amount'){
			actualPrice = unitPrice - discount;
		}else{
			if(discount != 0){
				discount  = ((discount * unitPrice) / 100);
			}else{
				discount = 0;
			}
			actualPrice = unitPrice - discount;
		}
		$('.product_price').val(actualPrice);
	});
	function update_sku(){
		var unitPrice = $('.unit_price').val();
		var discount = $('.discount').val();
		var discountType = $('.discount-type').val();

		var actualPrice = 0;

		if(discountType == 'amount'){
			actualPrice = unitPrice - discount;
		}else{
			if(discount != 0){
				discount  = ((discount * unitPrice) / 100);
			}else{
				discount = 0;
			}
			actualPrice = unitPrice - discount;
		}
		$('.product_price').val(actualPrice);
		// console.log(unitPrice);
		// console.log(discount);
		// console.log(discountType);
		$.ajax({
		   type:"POST",
		   url:'{{ route('products.sku_combination') }}',
		   data:$('#choice_form').serialize(),
		   success: function(data){
			// console.log(data);
			   $('#sku_combination').html(data);
			   if (data.length > 1) {
				   $('#quantity').hide();
			   }
			   else {
					$('#quantity').show();
			   }
		   }
	   });
	}

	function get_subcategories_by_category(){
		var category_id = $('#category_id').val();
		$.post('{{ route('subcategories.get_subcategories_by_category') }}',{_token:'{{ csrf_token() }}', category_id:category_id}, function(data){
		    $('#subcategory_id').html(null);
		    for (var i = 0; i < data.length; i++) {
		        $('#subcategory_id').append($('<option>', {
		            value: data[i].id,
		            text: data[i].name
		        }));
		        $('.demo-select2').select2();
		    }
		    get_subsubcategories_by_subcategory();
		});
	}

	function get_subsubcategories_by_subcategory(){
		var subcategory_id = $('#subcategory_id').val();
		$.post('{{ route('subsubcategories.get_subsubcategories_by_subcategory') }}',{_token:'{{ csrf_token() }}', subcategory_id:subcategory_id}, function(data){
		    $('#subsubcategory_id').html(null);
			$('#subsubcategory_id').append($('<option>', {
				value: null,
				text: null
			}));
		    for (var i = 0; i < data.length; i++) {
		        $('#subsubcategory_id').append($('<option>', {
		            value: data[i].id,
		            text: data[i].name
		        }));
		        $('.demo-select2').select2();
		    }
		    //get_brands_by_subsubcategory();
			//get_attributes_by_subsubcategory();
		});
	}

	function get_brands_by_subsubcategory(){
		var subsubcategory_id = $('#subsubcategory_id').val();
		$.post('{{ route('subsubcategories.get_brands_by_subsubcategory') }}',{_token:'{{ csrf_token() }}', subsubcategory_id:subsubcategory_id}, function(data){
		    $('#brand_id').html(null);
		    for (var i = 0; i < data.length; i++) {
		        $('#brand_id').append($('<option>', {
		            value: data[i].id,
		            text: data[i].name
		        }));
		        $('.demo-select2').select2();
		    }
		});
	}

	function get_attributes_by_subsubcategory(){
		var subsubcategory_id = $('#subsubcategory_id').val();
		$.post('{{ route('subsubcategories.get_attributes_by_subsubcategory') }}',{_token:'{{ csrf_token() }}', subsubcategory_id:subsubcategory_id}, function(data){
		    $('#choice_attributes').html(null);
		    for (var i = 0; i < data.length; i++) {
		        $('#choice_attributes').append($('<option>', {
		            value: data[i].id,
		            text: data[i].name
		        }));
		    }
			$('.demo-select2').select2();
		});
	}

	$(document).ready(function(){
	    get_subcategories_by_category();
		$("#photos").spartanMultiImagePicker({
			fieldName:        'photos[]',
			maxCount:         10,
			rowHeight:        '200px',
			groupClassName:   'col-md-4 col-sm-4 col-xs-6',
			maxFileSize:      '',
			dropFileLabel : "Drop Here",
			onExtensionErr : function(index, file){
				console.log(index, file,  'extension err');
				alert('Please only input png or jpg type file')
			},
			onSizeErr : function(index, file){
				console.log(index, file,  'file size too big');
				alert('File size too big');
			}
		});
		$("#thumbnail_img").spartanMultiImagePicker({
			fieldName:        'thumbnail_img',
			maxCount:         1,
			rowHeight:        '200px',
			groupClassName:   'col-md-4 col-sm-4 col-xs-6',
			maxFileSize:      '',
			dropFileLabel : "Drop Here",
			onExtensionErr : function(index, file){
				console.log(index, file,  'extension err');
				alert('Please only input png or jpg type file')
			},
			onSizeErr : function(index, file){
				console.log(index, file,  'file size too big');
				alert('File size too big');
			}
		});
		$("#featured_img").spartanMultiImagePicker({
			fieldName:        'featured_img',
			maxCount:         1,
			rowHeight:        '200px',
			groupClassName:   'col-md-4 col-sm-4 col-xs-6',
			maxFileSize:      '',
			dropFileLabel : "Drop Here",
			onExtensionErr : function(index, file){
				console.log(index, file,  'extension err');
				alert('Please only input png or jpg type file')
			},
			onSizeErr : function(index, file){
				console.log(index, file,  'file size too big');
				alert('File size too big');
			}
		});
		$("#flash_deal_img").spartanMultiImagePicker({
			fieldName:        'flash_deal_img',
			maxCount:         1,
			rowHeight:        '200px',
			groupClassName:   'col-md-4 col-sm-4 col-xs-6',
			maxFileSize:      '',
			dropFileLabel : "Drop Here",
			onExtensionErr : function(index, file){
				console.log(index, file,  'extension err');
				alert('Please only input png or jpg type file')
			},
			onSizeErr : function(index, file){
				console.log(index, file,  'file size too big');
				alert('File size too big');
			}
		});
		$("#meta_photo").spartanMultiImagePicker({
			fieldName:        'meta_img',
			maxCount:         1,
			rowHeight:        '200px',
			groupClassName:   'col-md-4 col-sm-4 col-xs-6',
			maxFileSize:      '',
			dropFileLabel : "Drop Here",
			onExtensionErr : function(index, file){
				console.log(index, file,  'extension err');
				alert('Please only input png or jpg type file')
			},
			onSizeErr : function(index, file){
				console.log(index, file,  'file size too big');
				alert('File size too big');
			}
		});
	});

	$('#category_id').on('change', function() {
	    get_subcategories_by_category();
	});

	$('#subcategory_id').on('change', function() {
	    get_subsubcategories_by_subcategory();
	});

	$('#subsubcategory_id').on('change', function() {
	    // get_brands_by_subsubcategory();
		//get_attributes_by_subsubcategory();
	});

	$('#choice_attributes').on('change', function() {
		$('#customer_choice_options').html(null);
		$.each($("#choice_attributes option:selected"), function(){
			//console.log($(this).val());
            add_more_customer_choice_option($(this).val(), $(this).text());
        });
		update_sku();
	});


</script>

@endsection
