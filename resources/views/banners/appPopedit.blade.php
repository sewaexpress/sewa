@extends('layouts.app')

@section('content')
<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">{{__('Pop Up Image')}}</h3>
    </div>
    @php
        $generalsetting = \App\GeneralSetting::first();
    @endphp
    <form class="form-horizontal" action="{{ route('app-pop-update') }}" method="POST" enctype="multipart/form-data">
        @csrf
        {{-- <input type="hidden" name="_method" value="PATCH"> --}}
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3" for="url">{{__('Status')}}</label>
                <div class="col-sm-9">
                    <select name="app_pop_status" id="url" class="form-control">
                        <option {{($generalsetting->app_pop_status == 1)?'selected':''}} value="1">Active</option>
                        <option {{($generalsetting->app_pop_status == 0)?'selected':''}} value="0">Inactive</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3" for="url">{{__('Redirect To')}}</label>
                <div class="col-sm-9">
                    <select name="app_pop_url" id="url" class="form-control app_pop_url">
                        <option {{($generalsetting->app_pop_url == 'flash_deal')?'selected':''}} value="flash_deal">Flash Deal</option>
                        <option {{($generalsetting->app_pop_url == 'product')?'selected':''}} value="product">Product</option>
                        <option {{($generalsetting->app_pop_url == 'category')?'selected':''}} value="category">Category</option>
                        <option {{($generalsetting->app_pop_url == 'subcategory')?'selected':''}} value="subcategory">SubCategory</option>
                        <option {{($generalsetting->app_pop_url == 'subsubcategory')?'selected':''}} value="subsubcategory">SubSubCategory</option>
                    </select>
                </div>
            </div>
            <div class="form-group category-options {{($generalsetting->app_pop_url != 'flash_deal')?'':'hidden'}}">
                <label class="col-sm-3" for="url">Select</label>
                <div class="col-sm-9">
                    <select name="custom_point" id="custom_point" class="form-control custom_point">
                        @if (isset($items) && !empty($items))
                            @foreach ($items as $item)
                                <option {{($generalsetting->app_point_link == $item->id)?'selected':''}} value="{{$item->id}}">{{$item->name}}</option>
                            @endforeach                            
                        @endif
                        {{-- <option {{($generalsetting->app_pop_url == 'flash_deal')?'selected':''}} value="flash_deal">Flash Deal</option> --}}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <label class="control-label">{{__('Pop Up Image')}}</label>
                    <strong>(600px*600px)</strong>
                </div>
                <div class="col-sm-9">
                    @if ($generalsetting->app_pop_image != null)
                        <div class="col-md-4 col-sm-4 col-xs-6">
                            <div class="img-upload-preview">
                                <img loading="lazy"  src="{{ asset($generalsetting->app_pop_image) }}" alt="" class="img-responsive">
                                <input type="hidden" name="previous_photo" value="{{ $generalsetting->app_pop_image  }}">
                                <button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                    @endif
                    <div id="photo">

                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer text-right">
            <button class="btn btn-purple" type="submit">{{__('Save')}}</button>
        </div>
    </form>

</div>
@endsection
@section('script')
<script type="text/javascript">

    $(document).ready(function(){
        
        $(".app_pop_url").change(function() {
            // console.log($(this).val());
            
            if ($(this).val() != "flash_deal") {        
                $(".category-options").removeClass('hidden');
                $.ajax({
                type:"POST",
                url:'{{ route('getSelectedItems') }}',
                data:{
                    'item' : $(this).val()
                },
                success: function(data){
                    $('#custom_point').html(data);
                }
                });
            } 
            else {
                $(".category-options").addClass('hidden');
            }
        });
        $('.remove-files').on('click', function(){
            $(this).parents(".col-md-4").remove();
        });

        $("#photo").spartanMultiImagePicker({
            fieldName:        'photo',
            maxCount:         1,
            rowHeight:        '200px',
            groupClassName:   'col-md-4 col-sm-9 col-xs-6',
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

</script>
@endsection
