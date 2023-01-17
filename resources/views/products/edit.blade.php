@extends('layouts.app')

@section('content')
<div>
    <h1 class="page-header text-overflow">Edit Product</h1>
</div>
<div class="row">
	<div class="col-lg-8 col-lg-offset-2">
		<form class="form form-horizontal mar-top" action="{{route('products.update', $product->id)}}" method="POST" enctype="multipart/form-data" id="choice_form">
			<input name="_method" type="hidden" value="POST">
			<input type="hidden" name="id" value="{{ $product->id }}">
			@csrf
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('Product Information')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
                        <label class="col-lg-2 control-label">{{__('Product Name')}}</label>
                        <div class="col-lg-7">
                            <input type="text" class="form-control" name="name" placeholder="{{__('Product Name')}}" value="{{$product->name}}" required>
                        </div>
                    </div>
                    <div class="form-group" id="category">
                        <label class="col-lg-2 control-label">{{__('Category')}}</label>
                        <div class="col-lg-7">
                            <select class="form-control demo-select2-placeholder" name="category_id" id="category_id" required>
                            	<option>Select an option</option>
                            	@foreach($categories as $category)
                            	    <option value="{{$category->id}}" <?php if($product->category_id == $category->id) echo "selected"; ?> >{{__($category->name)}}</option>
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
									<option value="{{ $brand->id }}" @if($product->brand_id == $brand->id) selected @endif>{{ $brand->name }}</option>
								@endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">{{__('Unit')}}</label>
                        <div class="col-lg-7">
                            <input type="text" class="form-control" name="unit" placeholder="Unit (e.g. KG, Pc etc)" value="{{$product->unit}}" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">{{__('Tags')}}</label>
                        <div class="col-lg-7">
                            <input type="text" class="form-control" name="tags[]" id="tags" value="{{ $product->tags }}" placeholder="Type to add a tag" data-role="tagsinput">
                        </div>
                    </div>
					@php
					    $pos_addon = \App\Addon::where('unique_identifier', 'pos_system')->first();
					@endphp
					@if ($pos_addon != null && $pos_addon->activated == 1)
						<div class="form-group">
							<label class="col-lg-2 control-label">{{__('Barcode')}}</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" name="barcode" placeholder="{{ ('Barcode') }}" value="{{ $product->barcode }}">
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
									<input type="checkbox" name="refundable" @if ($product->refundable == 1) checked @endif>
		                            <span class="slider round"></span></label>
								</label>
							</div>
						</div>
					@endif

					<div class="form-group">
						<label for="made_in_nepal" class="col-lg-2 control-label">{{ __('Made in Nepal') }}</label>
						<div class="col-lg-7">
							<label class="switch" style="margin-top: 5px;">
								<input type="checkbox" name="made_in_nepal" {{ $product->made_in_nepal == 1 ? 'checked': '' }}>
								<span class="slider round"></span>
							</label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="warranty" class="col-lg-2 control-label">{{ __('Warranty') }}</label>
						<div class="col-lg-7">
							<label class="switch" style="margin-top: 5px;">
								<input type="checkbox" name="warranty" id="warranty" {{ $product->warranty == 1 ? 'checked': '' }}>
								<span class="slider round"></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="warranty_time" class="col-lg-2 control-label">{{ __('Warranty Time') }}</label>
						<div class="col-lg-7">
								<input type="text" class="form-control" name="warranty_time" value="{{ $product->warranty_time }}" placeholder="Warranty Time" id="warranty_time">
						</div>
					</div>
					
					<div class="form-group" id="brand">
						<label class="col-lg-2 control-label">Vendor</label>
						<div class="col-lg-7">
							<select class="form-control demo-select2-placeholder" name="vendor_id" id="brand_id">
								<option value="in-house" selected>InHouse Product</option>
								@foreach (\App\Seller::with('user')->whereHas('user')->get() as $seller)
									<option value="{{ $seller->user_id }}" <?php if($product->user_id == $seller->user_id) echo "selected"; ?>>{{ $seller->user->name }}</option>
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
						<label class="col-lg-2 control-label">{{__('Gallery Images')}}</label>
						<div class="col-lg-7">
							<div id="photos">
								@if(is_array(json_decode($product->photos)))
									@foreach (json_decode($product->photos) as $key => $photo)
										<div class="col-md-4 col-sm-4 col-xs-6">
											<div class="img-upload-preview">
												<img loading="lazy"  src="{{ asset($photo) }}" alt="" class="img-responsive">
												<input type="hidden" name="previous_photos[]" value="{{ $photo }}">
												<button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
											</div>
										</div>
									@endforeach
								@endif
							</div>
						</div>
					</div>
					{{-- <div class="form-group">
						<label class="col-lg-2 control-label">{{__('Thumbnail Image')}} <small>(290x300)</small></label>
						<div class="col-lg-7">
							<div id="thumbnail_img">
								@if ($product->thumbnail_img != null)
									<div class="col-md-4 col-sm-4 col-xs-6">
										<div class="img-upload-preview">
											<img loading="lazy"  src="{{ asset($product->thumbnail_img) }}" alt="" class="img-responsive">
											<input type="hidden" name="previous_thumbnail_img" value="{{ $product->thumbnail_img }}">
											<button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
										</div>
									</div>
								@endif
							</div>
						</div>
					</div> --}}
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Featured')}} <small>(290x300)</small></label>
						<div class="col-lg-7">
							<div id="featured_img">
								@if ($product->featured_img != null)
									<div class="col-md-4 col-sm-4 col-xs-6">
										<div class="img-upload-preview">
											<img loading="lazy"  src="{{ asset($product->featured_img) }}" alt="" class="img-responsive">
											<input type="hidden" name="previous_featured_img" value="{{ $product->featured_img }}">
											<button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
										</div>
									</div>
								@endif
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Flash Deal')}} <small>(290x300)</small></label>
						<div class="col-lg-7">
							<div id="flash_deal_img">
								@if ($product->flash_deal_img != null)
									<div class="col-md-4 col-sm-4 col-xs-6">
										<div class="img-upload-preview">
											<img loading="lazy"  src="{{ asset($product->flash_deal_img) }}" alt="" class="img-responsive">
											<input type="hidden" name="previous_flash_deal_img" value="{{ $product->flash_deal_img }}">
											<button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
										</div>
									</div>
								@endif
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
								<option value="youtube" <?php if($product->video_provider == 'youtube') echo "selected";?> >{{__('Youtube')}}</option>
								<option value="dailymotion" <?php if($product->video_provider == 'dailymotion') echo "selected";?> >{{__('Dailymotion')}}</option>
								<option value="vimeo" <?php if($product->video_provider == 'vimeo') echo "selected";?> >{{__('Vimeo')}}</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Video Link')}}</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" name="video_link" value="{{ $product->video_link }}" placeholder="Video Link">
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
							<select class="form-control color-var-select" name="colors[]" id="colors" multiple>
								@foreach (\App\Color::orderBy('name', 'asc')->get() as $key => $color)
									<option value="{{ $color->code }}" <?php if(in_array($color->code, json_decode($product->colors))) echo 'selected'?> >{{ $color->name }}</option>
								@endforeach
							</select>
						</div>
						<div class="col-lg-2">
							<label class="switch" style="margin-top:5px;">
								<input value="1" type="checkbox" name="colors_active" <?php if(count(json_decode($product->colors)) > 0) echo "checked";?> >
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
									<option value="{{ $attribute->id }}" @if($product->attributes != null && in_array($attribute->id, json_decode($product->attributes, true))) selected @endif>{{ $attribute->name }}</option>
								@endforeach
	                        </select>
	                    </div>
	                </div>

					<div class="">
						<p>Choose the attributes of this product and then input values of each attribute</p>
						<br>
					</div>

					<div class="customer_choice_options" id="customer_choice_options">
						@foreach (json_decode($product->choice_options) as $key => $choice_option)
							<div class="form-group">
								<div class="col-lg-2">
									<input type="hidden" name="choice_no[]" value="{{ $choice_option->attribute_id }}">
									<input type="text" class="form-control" name="choice[]" value="{{ \App\Attribute::find($choice_option->attribute_id)->name }}" placeholder="Choice Title" disabled>
								</div>
								<div class="col-lg-7">
									<input type="text" class="form-control" name="choice_options_{{ $choice_option->attribute_id }}[]" placeholder="Enter choice values" value="{{ implode(',', $choice_option->values) }}" data-role="tagsinput" onchange="update_sku()">
								</div>
								<div class="col-lg-2">
									<button onclick="delete_row(this)" class="btn btn-danger btn-icon"><i class="demo-psi-recycling icon-lg"></i></button>
								</div>
							</div>
						@endforeach
					</div>
					{{-- <div class="form-group">
						<div class="col-lg-2">
							<button type="button" class="btn btn-info" onclick="add_more_customer_choice_option()">{{ __('Add more customer choice option') }}</button>
						</div>
					</div> --}}
				</div>
			</div>
			<div class="panel">
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
							@foreach(json_decode($product->color_images,true) as $key => $color_image)
								<tr class="{{$color_image['code']}}">
									<td class="text-center">
										<label for="" class="control-label">{{$color_image['name']}}</label>
									</td>
									<td class="text-center">
										@if ($color_image['image'] == '')
											<img class="image-{{$color_image['name']}}" style="width:100%;" src="" alt="">											

										@else
											<img class="image-{{$color_image['name']}}" style="width:100%;" src="{{asset($color_image['image'])}}" alt="">											
										@endif
									</td>
									<td class="text-center">
										<label for="upload-photo-{{$key}}" class="color-image-label">Upload</label>
										<input type="hidden" name="color_image[{{$color_image['name']}}][name]" value="{{$color_image['name']}}">
										<input type="hidden" name="color_image[{{$color_image['name']}}][code]" value="{{$color_image['code']}}">
										<input type="hidden" name="color_image[{{$color_image['name']}}][image]" value="{{$color_image['image']}}">
										<input data-image="image-{{$color_image['name']}}" class="upload-photo" type="file" name="color_image[{{$color_image['name']}}][new-image]" id="upload-photo-{{$key}}"/>
									</td>
								</tr>
							@endforeach
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
                            <input type="text" placeholder="{{__('Unit price')}}" name="unit_price" class="form-control unit_price" value="{{$product->unit_price}}" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">{{__('Purchase price')}}</label>
                        <div class="col-lg-7">
                            <input type="number" min="0" step="0.01" placeholder="{{__('Purchase price')}}" name="purchase_price" class="form-control purchase_price" value="{{$product->purchase_price}}" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">{{__('Tax')}}</label>
                        <div class="col-lg-7">
                            <input type="number" min="0" step="0.01" placeholder="{{__('tax')}}" name="tax" class="form-control" value="{{$product->tax}}" required>
                        </div>
                        <div class="col-lg-3">
                            <select class="demo-select2" name="tax_type" required>
                            	<option value="amount" <?php if($product->tax_type == 'amount') echo "selected";?> >{{__('Flat')}}</option>
                            	<option value="percent" <?php if($product->tax_type == 'percent') echo "selected";?> >{{__('Percent')}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">{{__('Discount')}}</label>
                        <div class="col-lg-7">
                            <input type="number" min="0" step="0.01" placeholder="{{__('Discount')}}" name="discount" class="form-control discount" value="{{ $product->discount }}" required>
                        </div>
                        <div class="col-lg-3">
                            <select class="demo-select2 discount-type" name="discount_type" required>
                            	<option value="amount" <?php if($product->discount_type == 'amount') echo "selected";?> >{{__('Flat')}}</option>
                            	<option value="percent" <?php if($product->discount_type == 'percent') echo "selected";?> >{{__('Percent')}}</option>
                            </select>
                        </div>
                    </div>
					<div class="form-group" id="quantity">
						<label class="col-lg-2 control-label">{{__('Quantity')}}</label>
						<div class="col-lg-7">
							<input type="text" value="{{ $product->current_stock }}" placeholder="{{__('Quantity')}}" name="current_stock" class="form-control" id="current_stock" onkeypress="return isNumber(event)" required>

						</div>
					</div>
					<div class="form-group hidden">						
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
                            <textarea class="editor" name="description">{{$product->description}}</textarea>
                        </div>
                    </div>
				</div>
			</div>
			<div class="panel">
				<div class="panel-heading bord-btm">
					<h3 class="panel-title">{{__('Product Specs')}}</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
                        <label class="col-lg-2 control-label">{{__('Description')}}</label>
                        <div class="col-lg-9">
                            <textarea class="editor" name="specs">{{$product->specs}}</textarea>
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
    						<div class="col-md-4">
    							<div class="panel-heading">
    								<h3 class="panel-title">{{__('Free Shipping')}}</h3>
    							</div>
    						</div>
    						<div class="col-md-8">
    							<div class="form-group">
    								<label class="col-lg-2 control-label">{{__('Status')}}</label>
    								<div class="col-lg-7">
    									<label class="switch" style="margin-top:5px;">
    										<input type="radio" name="shipping_type" value="free" @if($product->shipping_type == 'free') checked @endif>
    										<span class="slider round"></span>
    									</label>
    								</div>
    							</div>
    						</div>
    					</div>

    					<div class="row bord-btm">
    						<div class="col-md-4">
    							<div class="panel-heading">
    								<h3 class="panel-title">{{__('Flat Rate')}}</h3>
    							</div>
    						</div>
    						<div class="col-md-8">
    							<div class="form-group">
    								<label class="col-lg-2 control-label">{{__('Status')}}</label>
    								<div class="col-lg-7">
    									<label class="switch" style="margin-top:5px;">
    										<input type="radio" name="shipping_type" value="flat_rate" @if($product->shipping_type == 'flat_rate') checked @endif>
    										<span class="slider round"></span>
    									</label>
    								</div>
    							</div>
    							<div class="form-group">
    								<label class="col-lg-2 control-label">{{__('Shipping cost')}}</label>
    								<div class="col-lg-7">
    									<input type="number" min="0" step="0.01" placeholder="{{__('Shipping cost')}}" name="flat_shipping_cost" class="form-control" value="{{ $product->shipping_cost }}" required>
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
							<input type="text" class="form-control" name="meta_title" value="{{ $product->meta_title }}" placeholder="{{__('Meta Title')}}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">{{__('Description')}}</label>
						<div class="col-lg-7">
							<textarea name="meta_description" rows="8" class="form-control">{{ $product->meta_description }}</textarea>
						</div>
					</div>
					{{-- <div class="form-group">
						<label class="col-lg-2 control-label">{{ __('Meta Image') }}</label>
						<div class="col-lg-7">
							<div id="meta_photo">
								@if ($product->meta_img != null)
									<div class="col-md-4 col-sm-4 col-xs-6">
										<div class="img-upload-preview">
											<img loading="lazy"  src="{{ asset($product->meta_img) }}" alt="" class="img-responsive">
											<input type="hidden" name="previous_meta_img" value="{{ $product->meta_img }}">
											<button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
										</div>
									</div>
								@endif
							</div>
						</div>
					</div> --}}
				</div>
			</div>
			<div class="mar-all text-right">
				<button type="submit" name="button" class="btn btn-info">{{ __('Update Product') }}</button>
			</div>
		</form>
	</div>
</div>

@endsection

@section('script')

<script type="text/javascript">

	// var i = $('input[name="choice_no[]"').last().val();
	// if(isNaN(i)){
	// 	i =0;
	// }

	function add_more_customer_choice_option(i, name){
		$('#customer_choice_options').append('<div class="form-group"><div class="col-lg-2"><input type="hidden" name="choice_no[]" value="'+i+'"><input type="text" class="form-control" name="choice[]" value="'+name+'" readonly></div><div class="col-lg-7"><input type="text" class="form-control" name="choice_options_'+i+'[]" placeholder="Enter choice values" data-role="tagsinput" onchange="update_sku()"></div><div class="col-lg-2"><button onclick="delete_row(this)" class="btn btn-danger btn-icon"><i class="demo-psi-recycling icon-lg"></i></button></div></div>');
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
								// 'No Image Uploaded'+
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
		$('.purchase_price').val(actualPrice);
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
		$('.purchase_price').val(actualPrice);
	});
	$(document).on("keyup", ".purchase_price", function() {
		var unitPrice = $('.unit_price').val();
		var purchasePrice = $('.purchase_price').val();
		var discountType = $('.discount-type').val();
		var discount = 100 - ((purchasePrice * 100) / unitPrice );
		// console.log(discount);
		// console.log(unitPrice * 100);
		// console.log((purchasePrice / (unitPrice * 100)));
		// console.log(100 - (purchasePrice / (unitPrice * 100)));

		if(discountType == 'amount'){
			discount = (discount * unitPrice) / 100;
			// console.log(discount);
		}
		$('.discount').val(discount.toFixed(1));
	});
	
	function update_sku(){
		// var unitPrice = $('.unit_price').val();
		// var discount = $('.discount').val();
		// var discountType = $('.discount-type').val();

		// var actualPrice = 0;

		// if(discountType == 'amount'){
		// 	actualPrice = unitPrice - discount;
		// }else{
		// 	if(discount != 0){
		// 		discount  = ((discount * unitPrice) / 100);
		// 	}else{
		// 		discount = 0;
		// 	}
		// 	actualPrice = unitPrice - discount;
		// }
		// $('.product_price').val(actualPrice);
		
		
		$.ajax({
		   type:"POST",
		   url:'{{ route('products.sku_combination_edit') }}',
		   data:$('#choice_form').serialize(),
		   success: function(data){
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
		    }
		    $("#subcategory_id > option").each(function() {
		        if(this.value == '{{$product->subcategory_id}}'){
		            $("#subcategory_id").val(this.value).change();
		        }
		    });

		    $('.demo-select2').select2();

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
		    }
		    $("#subsubcategory_id > option").each(function() {
		        if(this.value == '{{$product->subsubcategory_id}}'){
		            $("#subsubcategory_id").val(this.value).change();
		        }
		    });

		    $('.demo-select2').select2();

		    //get_brands_by_subsubcategory();
			//get_attributes_by_subsubcategory();
		});
	}

	// function get_brands_by_subsubcategory(){
	// 	var subsubcategory_id = $('#subsubcategory_id').val();
	// 	$.post('{{ route('subsubcategories.get_brands_by_subsubcategory') }}',{_token:'{{ csrf_token() }}', subsubcategory_id:subsubcategory_id}, function(data){
	// 	    $('#brand_id').html(null);
	// 	    for (var i = 0; i < data.length; i++) {
	// 	        $('#brand_id').append($('<option>', {
	// 	            value: data[i].id,
	// 	            text: data[i].name
	// 	        }));
	// 	    }
	// 	    $("#brand_id > option").each(function() {
	// 	        if(this.value == '{{$product->brand_id}}'){
	// 	            $("#brand_id").val(this.value).change();
	// 	        }
	// 	    });
	//
	// 	    $('.demo-select2').select2();
	//
	// 	});
	// }

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
			$("#choice_attributes > option").each(function() {
				var str = @php echo $product->attributes @endphp;
		        $("#choice_attributes").val(str).change();
		    });

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

		update_sku();

		$('.remove-files').on('click', function(){
            $(this).parents(".col-md-4").remove();
        });
	});

	$('#category_id').on('change', function() {
	    get_subcategories_by_category();
	});

	$('#subcategory_id').on('change', function() {
	    get_subsubcategories_by_subcategory();
	});

	$('#subsubcategory_id').on('change', function() {
	    //get_brands_by_subsubcategory();
		//get_attributes_by_subsubcategory();
	});

	$('#choice_attributes').on('change', function() {
		//$('#customer_choice_options').html(null);
		$.each($("#choice_attributes option:selected"), function(j, attribute){
			flag = false;
			$('input[name="choice_no[]"]').each(function(i, choice_no) {
				if($(attribute).val() == $(choice_no).val()){
					flag = true;
				}
			});
            if(!flag){
				add_more_customer_choice_option($(attribute).val(), $(attribute).text());
			}
        });

		var str = @php echo $product->attributes @endphp;

		$.each(str, function(index, value){
			flag = false;
			$.each($("#choice_attributes option:selected"), function(j, attribute){
				if(value == $(attribute).val()){
					flag = true;
				}
			});
            if(!flag){
				//console.log();
				$('input[name="choice_no[]"][value="'+value+'"]').parent().parent().remove();
			}
		});

		update_sku();
	});

</script>
<script>
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
</script>
@endsection
