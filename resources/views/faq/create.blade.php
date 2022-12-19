@extends('layouts.app')

@section('content')
<form class="form-horizontal" action="{{ route('faq.store') }}" method="POST" enctype="multipart/form-data">

<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">{{ __('Faq Question') }}</h3>
    </div>
        @csrf
        <div class="panel-body">
            <div class="form-group">
                {{-- <label class="col-sm-3" for="title">{{ __('Title') }}</label> --}}
                {{-- <div class="col-sm-9"> --}}
                    <input type="text" placeholder="{{ __('Title') }}" id="title" name="title" class="form-control"
                        required>
                {{-- </div> --}}
            </div>
        </div>
        {{-- <div class="panel-footer text-right"> --}}
           
        {{-- </div> --}}

    <!--===================================================-->
    <!--End Horizontal Form-->

</div>

<div class="panel">
    <div class="panel-heading bord-btm">
        <h3 class="panel-title">{{__('Faq Answer')}}</h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <div class="col-lg-9">
                <textarea class="editor" name="description"></textarea>
            </div>
        </div>
    </div>
</div>
<button class="btn btn-purple" type="submit">{{ __('Save') }}</button>
</form>
@endsection

@section('script')
<script type="text/javascript">
    $(document).ready(function() {

        $('.demo-select2').select2();

    });
</script>
@endsection