<form class="form-horizontal" action="{{ route('sliders.store') }}" method="POST" enctype="multipart/form-data">
    @csrf
<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">{{__('Slider Information')}}</h3>
    </div>

    <!--Horizontal Form-->
    <!--===================================================-->
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3" for="url">{{__('URL')}}</label>
                <div class="col-sm-9">
                    <input type="text" id="url" name="url" placeholder="http://example.com/" class="form-control" required>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-3">
                    <label class="control-label">{{__('Slider Images')}}</label>
                    <strong>(850px*315px)</strong>
                </div>
                <div class="col-sm-9">
                    <div id="photos">

                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer text-right">
            <button class="btn btn-purple" type="submit">{{__('Save')}}</button>
        </div>
    <!--===================================================-->
    <!--End Horizontal Form-->

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
                    <option value="flash_deal">Flash Deal</option>
                    <option value="product">Product</option>
                    <option value="category">Category</option>
                    <option value="subcategory">SubCategory</option>
                    <option value="subsubcategory">SubSubCategory</option>
                </select>
            </div>
        </div>
        <div class="form-group category-options">
            <label class="col-sm-3" for="url">Select</label>
            <div class="col-sm-9">
                <select name="custom_point" id="custom_point" class="form-control custom_point">
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
        $("#photos").spartanMultiImagePicker({
            fieldName:        'photos[]',
            maxCount:         10,
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
