
<!--Horizontal Form-->
<!--===================================================-->
<form class="form-horizontal" action="{{ route('home_banners.update', $banner->id) }}" method="POST" enctype="multipart/form-data">
    @csrf
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">{{__('Banner Information')}}</h3>
        </div>
        <input type="hidden" name="_method" value="PATCH">
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3" for="url">{{__('URL')}}</label>
                <div class="col-sm-9">
                    <input type="text" placeholder="{{__('URL')}}" id="url" name="url" value="{{ $banner->url }}" class="form-control" required>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <label class="control-label">{{__('Banner Images')}}</label>
                    <strong>(850px*420px)</strong>
                </div>
                <div class="col-sm-9">
                    @if ($banner->photo != null)
                        <div class="col-md-4 col-sm-4 col-xs-6">
                            <div class="img-upload-preview">
                                <img loading="lazy"  src="{{ asset($banner->photo) }}" alt="" class="img-responsive">
                                <input type="hidden" name="previous_photo" value="{{ $banner->photo }}">
                                <button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                    @else
                    
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="img-upload-preview">
                            <img loading="lazy"  src="" alt="" class="img-responsive">
                            <input type="hidden" name="previous_photo" value="">
                            <button type="button" class="btn btn-danger close-btn remove-files"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    @endif
                    <div id="photo">

                    </div>
                </div>
            </div>
        </div>
        {{-- <div class="panel-footer text-right">
            <button class="btn btn-purple" type="submit">{{__('Save')}}</button>
        </div> --}}
    </div>
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">{{__('App Redirection')}}</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3" for="url">{{__('Redirect To')}}</label>
                <div class="col-sm-9">
                    <select name="app_pop_url" id="url" class="form-control app_pop_url">
                        <option {{($banner->app_pop_url == 'flash_deal')?'selected':''}} value="flash_deal">Flash Deal</option>
                        <option {{($banner->app_pop_url == 'product')?'selected':''}} value="product">Product</option>
                        <option {{($banner->app_pop_url == 'category')?'selected':''}} value="category">Category</option>
                        <option {{($banner->app_pop_url == 'subcategory')?'selected':''}} value="subcategory">SubCategory</option>
                        <option {{($banner->app_pop_url == 'subsubcategory')?'selected':''}} value="subsubcategory">SubSubCategory</option>
                    </select>
                </div>
            </div>
            <div class="form-group category-options {{($banner->app_pop_url != 'flash_deal')?'':'hidden'}}">
                <label class="col-sm-3" for="url">Select</label>
                <div class="col-sm-9">
                    <select name="custom_point" id="custom_point" class="form-control custom_point">
                        @if (isset($items) && !empty($items))
                            @foreach ($items as $item)
                                <option {{($banner->app_point_link == $item->id)?'selected':''}} value="{{$item->id}}">{{$item->name}}</option>
                            @endforeach                            
                        @endif
                        {{-- <option {{($generalsetting->app_pop_url == 'flash_deal')?'selected':''}} value="flash_deal">Flash Deal</option> --}}
                    </select>
                </div>
            </div>
        </div>
        <div class="panel-footer text-right">
            <button class="btn btn-purple" type="submit">{{__('Save')}}</button>
        </div>
    </div>
</form>

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
