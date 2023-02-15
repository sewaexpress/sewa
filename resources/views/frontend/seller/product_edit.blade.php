@extends('frontend.layouts.app')

@section('content')

    <section class="gry-bg py-4 profile">
        <div class="container">
            <div class="row cols-xs-space cols-sm-space cols-md-space">
                <div class="col-lg-3 d-none d-lg-block">
                    @include('frontend.inc.seller_side_nav')
                </div>

                <div class="col-lg-9">
                    <div class="main-content">
                        <!-- Page title -->
                        <div class="page-title">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h2 class="heading heading-6 text-capitalize strong-600 mb-0">
                                        {{__('Update your product')}}
                                    </h2>
                                </div>
                                <div class="col-md-6">
                                    <div class="float-md-right">
                                        <ul class="breadcrumb">
                                            <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                                            <li><a href="{{ route('dashboard') }}">{{__('Dashboard')}}</a></li>
                                            <li><a href="{{ route('seller.products') }}">{{__('Products')}}</a></li>
                                            <li class="active"><a href="{{ route('seller.products.edit', $product->id) }}">{{__('Edit Product')}}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form class="" action="{{route('products.update', $product->id)}}" method="POST" enctype="multipart/form-data" id="choice_form">
                            <input name="_method" type="hidden" value="POST">
                            <input type="hidden" name="id" value="{{ $product->id }}">
                            @csrf
                    		<input type="hidden" name="added_by" value="seller">

                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('General')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Product Name')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control mb-3" name="name" placeholder="{{__('Product Name')}}" value="{{ __($product->name) }}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Product Category')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            @if ($product->subsubcategory != null)
                                                <div class="form-control mb-3 c-pointer" data-toggle="modal" data-target="#categorySelectModal" id="product_category">{{ $product->category->name.'>'.$product->subcategory->name.'>'.$product->subsubcategory->name }}</div>
                                            @else
                                                <div class="form-control mb-3 c-pointer" data-toggle="modal" data-target="#categorySelectModal" id="product_category">{{ $product->category->name.'>'.$product->subcategory->name }}</div>
                                            @endif
                                            <input type="hidden" name="category_id" id="category_id" value="{{ $product->category_id }}" required>
                                            <input type="hidden" name="subcategory_id" id="subcategory_id" value="{{ $product->subcategory_id }}" required>
                                            <input type="hidden" name="subsubcategory_id" id="subsubcategory_id" value="{{ $product->subsubcategory_id }}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Product Brand')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="mb-3">
                                                <select class="form-control mb-3 selectpicker" data-placeholder="Select a brand" id="brands" name="brand_id">
                                                    <option value="">{{ ('Select Brand') }}</option>
                                                    @foreach (\App\Brand::all() as $brand)
                                                        <option value="{{ $brand->id }}" @if($brand->id == $product->brand_id) selected @endif>{{ $brand->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Product Unit')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control mb-3" name="unit" placeholder="Product unit" value="{{ $product->unit }}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Product Tag')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control mb-3 tagsInput" name="tags[]" placeholder="Type & hit enter" data-role="tagsinput" value="{{ $product->tags }}">
                                        </div>
                                    </div>
                                    @php
                                        $pos_addon = \App\Addon::where('unique_identifier', 'pos_system')->first();
                                    @endphp
                                    @if ($pos_addon != null && $pos_addon->activated == 1)
            							<div class="row mt-2">
            								<label class="col-md-2">{{__('Barcode')}}</label>
            								<div class="col-md-10">
            									<input type="text" class="form-control mb-3" name="barcode" placeholder="{{ __('Barcode') }}" value="{{ $product->barcode }}">
            								</div>
            							</div>
                                    @endif
                                    @php
                                        $refund_request_addon = \App\Addon::where('unique_identifier', 'refund_request')->first();
                                    @endphp
                                    @if ($refund_request_addon != null && $refund_request_addon->activated == 1)
            							<div class="row mt-2">
            								<label class="col-md-2">{{__('Refundable')}}</label>
            								<div class="col-md-10">
            									<label class="switch" style="margin-top:5px;">
            										<input type="checkbox" name="refundable" @if ($product->refundable == 1) checked @endif>
            			                            <span class="slider round"></span></label>
            									</label>
            								</div>
            							</div>
                                    @endif
                                    
					<div class="row mt-2">
                        <label class="col-md-2">
                            {{ __('Made in Nepal') }}
                        </label>
                        <div class="col-md-10">
                            <label class="switch" style="margin-top:5px;">
                                <input type="checkbox" name="made_in_nepal" @if ($product->made_in_nepal == 1) checked @endif>
                                <span class="slider round"></span></label>
                            </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <label class="col-md-2">
                            {{ __('Warranty') }}
                        </label>
                        <div class="col-md-10">
                            <label class="switch" style="margin-top:5px;">
                                <input type="checkbox" name="warranty" @if ($product->warranty == 1) checked @endif>
                                <span class="slider round"></span></label>
                            </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <label class="col-md-2">
                            {{ __('Warranty Time') }}
                        </label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="warranty_time" value="{{($product->warranty_time)}}" placeholder="Warranty Time" id="warranty_time">
                        </div>
                    </div>


                                </div>
                            </div>
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Images')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div id="product-images">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <label>{{__('Main Images')}} <span class="required-star">*</span></label>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="row">
                                                    @if ($product->photos != null)
                                                        @foreach (json_decode($product->photos) as $key => $photo)
                                                            <div class="col-md-3">
                                                                <div class="img-upload-preview">
                                                                    <img loading="lazy"  src="{{ asset($photo) }}" alt="" class="img-responsive">
                                                                    <input type="hidden" name="previous_photos[]" value="{{ $photo }}">
                                                                    <button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
                                                                </div>
                                                            </div>
                                                        @endforeach
                                                    @endif
                                                </div>
                                                <input type="file" name="photos[]" id="photos-1" class="custom-input-file custom-input-file--4" data-multiple-caption="{count} files selected" accept="image/*" />
                                                <label for="photos-1" class="mw-100 mb-3">
                                                    <span></span>
                                                    <strong>
                                                        <i class="fa fa-upload"></i>
                                                        {{__('Choose image')}}
                                                    </strong>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <button type="button" class="btn btn-info mb-3" onclick="add_more_slider_image()">{{ __('Add More') }}</button>
                                    </div>
                                    {{-- <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Thumbnail Image')}} <small>(290x300)</small> <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="row">
                                                @if ($product->thumbnail_img != null)
                                                    <div class="col-md-3">
                                                        <div class="img-upload-preview">
                                                            <img loading="lazy"  src="{{ asset($product->thumbnail_img) }}" alt="" class="img-responsive">
                                                            <input type="hidden" name="previous_thumbnail_img" value="{{ $product->thumbnail_img }}">
                                                            <button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
                                                        </div>
                                                    </div>
                                                @endif
                                            </div>
                                            <input type="file" name="thumbnail_img" id="file-2" class="custom-input-file custom-input-file--4" data-multiple-caption="{count} files selected" accept="image/*" />
                                            <label for="file-2" class="mw-100 mb-3">
                                                <span></span>
                                                <strong>
                                                    <i class="fa fa-upload"></i>
                                                    {{__('Choose image')}}
                                                </strong>
                                            </label>
                                        </div>
                                    </div> --}}
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Featured')}} <small>(290x300)</small></label>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="row">
                                                @if ($product->featured_img != null)
                                                    <div class="col-md-3">
                                                        <div class="img-upload-preview">
                                                            <img loading="lazy"  src="{{ asset($product->featured_img) }}" alt="" class="img-responsive">
                                                            <input type="hidden" name="previous_featured_img" value="{{ $product->featured_img }}">
                                                            <button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
                                                        </div>
                                                    </div>
                                                @endif
                                            </div>
                                            <input type="file" name="featured_img" id="file-3" class="custom-input-file custom-input-file--4" data-multiple-caption="{count} files selected" accept="image/*" />
                                            <label for="file-3" class="mw-100 mb-3">
                                                <span></span>
                                                <strong>
                                                    <i class="fa fa-upload"></i>
                                                    {{__('Choose image')}}
                                                </strong>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Flash Deal')}} <small>(290x300)</small></label>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="row">
                                                @if ($product->flash_deal_img != null)
                                                    <div class="col-md-3">
                                                        <div class="img-upload-preview">
                                                            <img loading="lazy"  src="{{ asset($product->flash_deal_img) }}" alt="" class="img-responsive">
                                                            <input type="hidden" name="previous_flash_deal_img" value="{{ $product->flash_deal_img }}">
                                                            <button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
                                                        </div>
                                                    </div>
                                                @endif
                                            </div>
                                            <input type="file" name="flash_deal_img" id="file-4" class="custom-input-file custom-input-file--4" data-multiple-caption="{count} files selected" accept="image/*" />
                                            <label for="file-4" class="mw-100 mb-3">
                                                <span></span>
                                                <strong>
                                                    <i class="fa fa-upload"></i>
                                                    {{__('Choose image')}}
                                                </strong>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Videos')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Video From')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="mb-3">
                                                <select class="form-control selectpicker" data-minimum-results-for-search="Infinity" name="video_provider">
                                                    <option value="youtube" <?php if($product->video_provider == 'youtube') echo "selected";?> >{{__('Youtube')}}</option>
            										<option value="dailymotion" <?php if($product->video_provider == 'dailymotion') echo "selected";?> >{{__('Dailymotion')}}</option>
            										<option value="vimeo" <?php if($product->video_provider == 'vimeo') echo "selected";?> >{{__('Vimeo')}}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Video URL')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control mb-3" name="video_link" placeholder="{{__('Video link')}}" value="{{ $product->video_link }}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Meta Tags')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Meta Title')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control mb-3" name="meta_title" value="{{ $product->meta_title }}" placeholder="{{__('Meta Title')}}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Description')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <textarea name="meta_description" rows="8" class="form-control mb-3">{{ $product->meta_description }}</textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Meta Image')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="row">
                                                @if ($product->meta_img != null)
                                                    <div class="col-md-3">
                                                        <div class="img-upload-preview">
                                                            <img loading="lazy"  src="{{ asset($product->meta_img) }}" alt="" class="img-responsive">
                                                            <input type="hidden" name="previous_meta_img" value="{{ $product->meta_img }}">
                                                            <button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
                                                        </div>
                                                    </div>
                                                @endif
                                            </div>
                                            <input type="file" name="meta_img" id="file-5" class="custom-input-file custom-input-file--4" data-multiple-caption="{count} files selected" accept="image/*" />
                                            <label for="file-5" class="mw-100 mb-3">
                                                <span></span>
                                                <strong>
                                                    <i class="fa fa-upload"></i>
                                                    {{__('Choose image')}}
                                                </strong>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Customer Choice')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row mb-3">
                                        <div class="col-8 col-md-3 order-1 order-md-0">
        									<input type="text" class="form-control" value="{{__('Colors')}}" disabled>
        								</div>
        								<div class="col-12 col-md-7 col-xl-8 order-3 order-md-0 mt-2 mt-md-0 ">
        									<select class="form-control color-var-select" name="colors[]" id="colors" multiple disabled>
                                                @foreach (\App\Color::orderBy('name', 'asc')->get() as $key => $color)
        											<option value="{{ $color->code }}" <?php if(in_array($color->code, json_decode($product->colors))) echo 'selected'?> >{{ $color->name }}</option>
        										@endforeach
        									</select>
        								</div>
        								<div class="col-4 col-xl-1 col-md-2 order-2 order-md-0 text-right">
        									<label class="switch" style="margin-top:5px;">
                                                <input value="1" type="checkbox" name="colors_active" <?php if(count(json_decode($product->colors)) > 0) echo "checked";?> >
        										<span class="slider round"></span>
        									</label>
        								</div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-3">
                                            <label>{{__('Attributes')}}</label>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="">
                                                <select name="choice_attributes[]" id="choice_attributes" class="form-control selectpicker" multiple data-placeholder="Choose Attributes">
                                                    @foreach (\App\Attribute::all() as $key => $attribute)
            											<option value="{{ $attribute->id }}" @if($product->attributes != null && in_array($attribute->id, json_decode($product->attributes, true))) selected @endif>{{ $attribute->name }}</option>
            										@endforeach
            			                        </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mb-3">
        								<p>Choose the attributes of this product and then input values of each attribute</p>
        							</div>
                                    <div id="customer_choice_options">
                                        @foreach (json_decode($product->choice_options) as $key => $choice_option)
        									<div class="row mb-3">
        										<div class="col-8 col-md-3 order-1 order-md-0">
        											<input type="hidden" name="choice_no[]" value="{{ $choice_option->attribute_id }}">
        											<input type="text" class="form-control" name="choice[]" value="{{ \App\Attribute::find($choice_option->attribute_id)->name }}" placeholder="Choice Title" disabled>
        										</div>
        										<div class="col-12 col-md-7 col-xl-8 order-3 order-md-0 mt-2 mt-md-0">
        											<input type="text" class="form-control" name="choice_options_{{ $choice_option->attribute_id }}[]" placeholder="Enter choice values" value="{{ implode(',', $choice_option->values) }}" data-role="tagsinput" onchange="update_sku()">
        										</div>
        										<div class="col-4 col-xl-1 col-md-2 order-2 order-md-0 text-right">
                                                    <button type="button" onclick="delete_row(this)" class="btn btn-link btn-icon text-danger"><i class="fa fa-trash-o"></i></button>
                                                </div>
        									</div>
        								@endforeach
                                    </div>
                                    {{-- <div class="row">
                                        <div class="col-2">
        									<button type="button" class="btn btn-info" onclick="add_more_customer_choice_option()">{{ __('Add More Customer Choice Option') }}</button>
        								</div>
                                    </div> --}}
                                </div>
                            </div>
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Color Images')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row mb-3">
                                        
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
                            </div>
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Price')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Unit Price')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="number" min="0" step="0.01" class="form-control mb-3 unit_price" name="unit_price" placeholder="{{__('Unit Price')}} ({{__('Base Price')}})" value="{{$product->unit_price}}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Purchase Price')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="number" min="0" step="0.01" class="form-control mb-3 purchase_price" name="purchase_price" placeholder="{{__('Purchase Price')}}" value="{{$product->purchase_price}}" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Tax')}}</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="number" min="0" step="0.01" class="form-control mb-3" name="tax" placeholder="{{__('Tax')}}" value="{{$product->tax}}">
                                        </div>
                                        <div class="col-md-2 col-4">
                                            <div class="mb-3">
                                                <select class="form-control selectpicker" name="tax_type" data-minimum-results-for-search="Infinity">
                                                    <option value="amount" <?php if($product->tax_type == 'amount') echo "selected";?> >$</option>
                                                    <option value="percent" <?php if($product->tax_type == 'percent') echo "selected";?> >%</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Discount')}}</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="number" min="0" step="0.01" class="form-control mb-3 discount" name="discount" placeholder="{{__('Discount')}}" value="{{$product->discount}}">
                                        </div>
                                        <div class="col-md-2 col-4">
                                            <div class="mb-3">
                                                <select class="form-control selectpicker discount-type" name="discount_type" data-minimum-results-for-search="Infinity">
                                                    <option value="amount" <?php if($product->discount_type == 'amount') echo "selected";?> >$</option>
            	                                	<option value="percent" <?php if($product->discount_type == 'percent') echo "selected";?> >%</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" id="quantity">
                                        <div class="col-md-2">
                                            <label>{{__('Quantity')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="number" min="0" step="1" class="form-control mb-3" name="current_stock" placeholder="{{__('Quantity')}}" value="{{$product->current_stock}}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Product Price')}} </label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="number" value="0" readonly placeholder="{{__('Product Price')}}" class="form-control mb-3 product_price" >
                                            {{-- <input type="number" min="0" step="1" class="form-control mb-3" name="current_stock" placeholder="{{__('Quantity')}}" value="{{$product->current_stock}}"> --}}
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12" id="sku_combination">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            {{-- @if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'product_wise_shipping')
                                <div class="form-box bg-white mt-4">
                                    <div class="form-box-title px-3 py-2">
                                        {{__('Shipping')}}
                                    </div>
                                    <div class="form-box-content p-3">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <label>{{__('Flat Rate')}}</label>
                                            </div>
                                            <div class="col-md-8">
                                                <input type="number" min="0" step="0.01" class="form-control mb-3" name="flat_shipping_cost" value="{{ $product->shipping_cost }}" placeholder="{{__('Flat Rate Cost')}}">
                                            </div>
                                            <div class="col-md-2">
                                                <label class="switch" style="margin-top:5px;">
                                                    <input type="radio" name="shipping_type" value="flat_rate" @if($product->shipping_type == 'flat_rate') checked @endif>
                                                    <span class="slider round"></span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <label>{{__('Free Shipping')}}</label>
                                            </div>
                                            <div class="col-md-8">
                                                <input type="number" min="0" step="0.01" class="form-control mb-3" name="free_shipping_cost" value="0" disabled placeholder="{{__('Flat Rate Cost')}}">
                                            </div>
                                            <div class="col-md-2">
                                                <label class="switch" style="margin-top:5px;">
                                                    <input type="radio" name="shipping_type" value="free" @if($product->shipping_type == 'free') checked @endif>
                                                    <span class="slider round"></span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endif --}}
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Description')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Description')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="mb-3">
                                                <textarea class="editor" name="description">{{$product->description}}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Specification')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Specification')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="mb-3">
                                                <textarea class="editor" name="specs">{{$product->specs}}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('PDF Specification')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('PDF')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="file" name="pdf" id="file-6" class="custom-input-file custom-input-file--4" data-multiple-caption="{count} files selected" accept="pdf/*" />
                                            <label for="file-6" class="mw-100 mb-3">
                                                <span></span>
                                                <strong>
                                                    <i class="fa fa-upload"></i>
                                                    {{__('Choose PDF')}}
                                                </strong>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-box mt-4 text-right">
                                <button type="submit" class="btn btn-styled btn-base-1">{{ __('Update This Product') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Modal -->
    <div class="modal fade" id="categorySelectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel">{{__('Select Category')}}</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="target-category heading-6">
                        <span class="mr-3">{{__('Target Category')}}:</span>
                        <span>{{__('Category')}} > {{__('Subcategory')}} > {{__('Sub Subcategory')}}</span>
                    </div>
                    <div class="row no-gutters modal-categories mt-4 mb-2">
                        <div class="col-4">
                            <div class="modal-category-box c-scrollbar">
                                <div class="sort-by-box">
                                    <form role="form" class="search-widget">
                                        <input class="form-control input-lg" type="text" placeholder="Search Category" onkeyup="filterListItems(this, 'categories')">
                                        <button type="button" class="btn-inner">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </form>
                                </div>
                                <div class="modal-category-list has-right-arrow">
                                    <ul id="categories">
                                        @foreach ($categories as $key => $category)
                                            <li onclick="get_subcategories_by_category(this, {{ $category->id }})">{{ __($category->name) }} <i class="fa fa-arropw"></i> </li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="modal-category-box c-scrollbar" id="subcategory_list">
                                <div class="sort-by-box">
                                    <form role="form" class="search-widget">
                                        <input class="form-control input-lg" type="text" placeholder="Search SubCategory" onkeyup="filterListItems(this, 'subcategories')">
                                        <button type="button" class="btn-inner">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </form>
                                </div>
                                <div class="modal-category-list has-right-arrow">
                                    <ul id="subcategories">

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="modal-category-box c-scrollbar" id="subsubcategory_list">
                                <div class="sort-by-box">
                                    <form role="form" class="search-widget">
                                        <input class="form-control input-lg" type="text" placeholder="Search SubSubCategory" onkeyup="filterListItems(this, 'subsubcategories')">
                                        <button type="button" class="btn-inner">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </form>
                                </div>
                                <div class="modal-category-list">
                                    <ul id="subsubcategories">

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{__('Cancel')}}</button>
                    <button type="button" class="btn btn-primary" onclick="closeModal()">{{__('Confirm')}}</button>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script type="text/javascript">

        var category_name = "";
        var subcategory_name = "";
        var subsubcategory_name = "";

        var category_id = null;
        var subcategory_id = null;
        var subsubcategory_id = null;

        
        $('input[name="unit_price"]').on('keyup', function() {
            update_sku();
        });
        
        
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
        $(document).ready(function(){
            $('#subcategory_list').hide();
            $('#subsubcategory_list').hide();
            //get_attributes_by_subsubcategory($('#subsubcategory_id').val());
            update_sku();

            $('.remove-files').on('click', function(){
                $(this).parents(".col-md-3").remove();
            });
        });

        function list_item_highlight(el){
            $(el).parent().children().each(function(){
                $(this).removeClass('selected');
            });
            $(el).addClass('selected');
        }

        function get_subcategories_by_category(el, cat_id){
            list_item_highlight(el);
            category_id = cat_id;
            subcategory_id = null;
            subsubcategory_id = null;
            category_name = $(el).html();
            $('#subcategories').html(null);
            $('#subsubcategory_list').hide();
            $.post('{{ route('subcategories.get_subcategories_by_category') }}',{_token:'{{ csrf_token() }}', category_id:category_id}, function(data){
                for (var i = 0; i < data.length; i++) {
                    $('#subcategories').append('<li onclick="get_subsubcategories_by_subcategory(this, '+data[i].id+')">'+data[i].name+'</li>');
                }
                $('#subcategory_list').show();
            });
        }

        function get_subsubcategories_by_subcategory(el, subcat_id){
            list_item_highlight(el);
            subcategory_id = subcat_id;
            subsubcategory_id = null;
            subcategory_name = $(el).html();
            $('#subsubcategories').html(null);
            $.post('{{ route('subsubcategories.get_subsubcategories_by_subcategory') }}',{_token:'{{ csrf_token() }}', subcategory_id:subcategory_id}, function(data){
                for (var i = 0; i < data.length; i++) {
                    $('#subsubcategories').append('<li onclick="confirm_subsubcategory(this, '+data[i].id+')">'+data[i].name+'</li>');
                }
                $('#subsubcategory_list').show();
            });
        }

        function confirm_subsubcategory(el, subsubcat_id){
            list_item_highlight(el);
            subsubcategory_id = subsubcat_id;
            subsubcategory_name = $(el).html();
    	}

        // function get_brands_by_subsubcategory(subsubcat_id){
        //     $('#brands').html(null);
    	// 	$.post('{{ route('subsubcategories.get_brands_by_subsubcategory') }}',{_token:'{{ csrf_token() }}', subsubcategory_id:subsubcategory_id}, function(data){
    	// 	    for (var i = 0; i < data.length; i++) {
    	// 	        $('#brands').append($('<option>', {
    	// 	            value: data[i].id,
    	// 	            text: data[i].name
    	// 	        }));
    	// 	    }
    	// 	});
    	// }

        function get_attributes_by_subsubcategory(subsubcategory_id){
            // var subsubcategory_id = $('#subsubcategories').val();
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
    		});
    	}

        function filterListItems(el, list){
            filter = el.value.toUpperCase();
            li = $('#'+list).children();
            for (i = 0; i < li.length; i++) {
                if ($(li[i]).html().toUpperCase().indexOf(filter) > -1) {
                    $(li[i]).show();
                } else {
                    $(li[i]).hide();
                }
            }
        }

        function closeModal(){
            if(category_id > 0 && subcategory_id > 0 && subsubcategory_id > 0){
                $('#category_id').val(category_id);
                $('#subcategory_id').val(subcategory_id);
                $('#subsubcategory_id').val(subsubcategory_id);
                $('#product_category').html(category_name+'>'+subcategory_name+'>'+subsubcategory_name);
                $('#categorySelectModal').modal('hide');
                //get_brands_by_subsubcategory(subsubcategory_id);
                //get_attributes_by_subsubcategory(subsubcategory_id);
            }
            else{
                alert('Please choose categories...');
                console.log(category_id);
                console.log(subcategory_id);
                console.log(subsubcategory_id);
                //showAlert();
            }
        }

        // var i = $('input[name="choice_no[]"').last().val();
        // if(isNaN(i)){
    	// 	i =0;
    	// }

        function add_more_customer_choice_option(i, name){
            //i++;
    		$('#customer_choice_options').append('<div class="row mb-3"><div class="col-8 col-md-3 order-1 order-md-0"><input type="hidden" name="choice_no[]" value="'+i+'"><input type="text" class="form-control" name="choice[]" value="'+name+'" placeholder="Choice Title" readonly></div><div class="col-12 col-md-7 col-xl-8 order-3 order-md-0 mt-2 mt-md-0"><input type="text" class="form-control tagsInput" name="choice_options_'+i+'[]" placeholder="Enter choice values" onchange="update_sku()"></div><div class="col-4 col-xl-1 col-md-2 order-2 order-md-0 text-right"><button type="button" onclick="delete_row(this)" class="btn btn-link btn-icon text-danger"><i class="fa fa-trash-o"></i></button></div></div>');
            $('.tagsInput').tagsinput('items');
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

    	// $('input[name="unit_price"]').on('keyup', function() {
    	//     update_sku();
    	// });
        //
        // $('input[name="name"]').on('keyup', function() {
    	//     update_sku();
    	// });

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

    	function delete_row(em){
    		$(em).closest('.row').remove();
    		update_sku();
    	}

    	function update_sku(){
		// var unitPrice = $('.unit_price').val();
		// var discount = $('.discount').val();
		// var discountType = $('.discount-type').val();

        // var actualPrice = 0;

        // if(discountType == 'amount'){
        //     actualPrice = unitPrice - discount;
        // }else{
        //     if(discount != 0){
        //         discount  = ((discount * unitPrice) / 100);
        //     }else{
        //         discount = 0;
        //     }
        //     actualPrice = unitPrice - discount;
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

        var photo_id = 2;
        function add_more_slider_image(){
            var photoAdd =  '<div class="row">';
            photoAdd +=  '<div class="col-2">';
            photoAdd +=  '<button type="button" onclick="delete_this_row(this)" class="btn btn-link btn-icon text-danger"><i class="fa fa-trash-o"></i></button>';
            photoAdd +=  '</div>';
            photoAdd +=  '<div class="col-10">';
            photoAdd +=  '<input type="file" name="photos[]" id="photos-'+photo_id+'" class="custom-input-file custom-input-file--4" data-multiple-caption="{count} files selected" multiple accept="image/*" />';
            photoAdd +=  '<label for="photos-'+photo_id+'" class="mw-100 mb-3">';
            photoAdd +=  '<span></span>';
            photoAdd +=  '<strong>';
            photoAdd +=  '<i class="fa fa-upload"></i>';
            photoAdd +=  "{{__('Choose image')}}";
            photoAdd +=  '</strong>';
            photoAdd +=  '</label>';
            photoAdd +=  '</div>';
            photoAdd +=  '</div>';
            $('#product-images').append(photoAdd);

            photo_id++;
            imageInputInitialize();
        }
        function delete_this_row(em){
            $(em).closest('.row').remove();
        }


    </script>
@endsection
