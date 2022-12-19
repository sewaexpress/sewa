@extends('layouts.app')

@section('content')
<form class="form-horizontal" action="{{ route('career.update',$blog->id) }}" method="POST" enctype="multipart/form-data">

<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">{{ __('Career Subject') }}</h3>
    </div>
    @csrf
    @method('PUT')
    <div class="panel-body">
        <div class="form-group">
            {{-- <label class="col-sm-3" for="title">{{ __('Title') }}</label> --}}
            <div class="col-sm-9">
                <input type="text" placeholder="{{ __('Title') }}" id="title" value="{{ $blog->title }}" name="title" class="form-control"
                    required>
            </div>
        </div>
    </div>
    <!--===================================================-->
    <!--End Horizontal Form-->

</div>
    <div class="panel">
        <div class="panel-heading bord-btm">
            <h3 class="panel-title">{{__('Career Description')}}</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <div class="col-lg-9">
                    <textarea class="editor" name="description">{{ $blog->description }}</textarea>
                </div>
            </div>
        </div>
    </div>
    
    {{-- <div class="panel-footer text-right"> --}}
        <button class="btn btn-purple" type="submit">{{ __('Save') }}</button>
    {{-- </div> --}}
    </form>
@endsection

@section('script')
<script type="text/javascript">
    $(document).ready(function() {

        $('.remove-files').on('click', function(){
            $(this).parents(".col-md-4").remove();
        });
        
        $('.demo-select2').select2();

        $("#photo").spartanMultiImagePicker({
            fieldName: 'photo',
            maxCount: 1,
            rowHeight: '200px',
            groupClassName: 'col-md-4 col-sm-9 col-xs-6',
            maxFileSize: '',
            dropFileLabel: "Drop Here",
            onExtensionErr: function(index, file) {
                console.log(index, file, 'extension err');
                alert('Please only input png or jpg type file')
            },
            onSizeErr: function(index, file) {
                console.log(index, file, 'file size too big');
                alert('File size too big');
            }
        });
    });
</script>
@endsection