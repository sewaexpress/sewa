@extends('layouts.app')

@section('content')

<div class="col-sm-12">
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">{{__('Flash Deal Information')}}</h3>
        </div>

        <!--Horizontal Form-->
        <!--===================================================-->
        <form class="form-horizontal" action="{{ route('pages.testimonialupdate', $flash_deal->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
             {{-- <input type="hidden" name="_method" value="PATCH"> --}}
             <div class="panel-body">
                 <div class="form-group">
                     <label class="col-sm-3 control-label" for="name">{{__('Name')}}</label>
                     <div class="col-sm-9">
                         <input type="text" placeholder="{{__('Title')}}" id="name" name="name" value="{{ $flash_deal->name }}" class="form-control" required>
                     </div>
                 </div>
                 <div class="form-group">
                     <label class="col-sm-3 control-label" for="title">{{__('title')}}</label>
                     <div class="col-sm-9">
                         <input type="text" placeholder="" id="title" name="title" value="{{ $flash_deal->title }}" class="form-control" required>
                     </div>
                 </div>
                 <div class="form-group">
                    <label class="col-sm-3 control-label" for="about">{{__('About')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="" id="about" name="about" value="{{ $flash_deal->about }}" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label" for="name">{{__('Status')}}</label>
                    <div class="col-lg-9">
                        <select name="status" id="text_color" class="form-control demo-select2" required>
                            <option value=1  @if ($flash_deal->status == '1') selected @endif>{{__('Active')}}</option>
                            <option value=0 @if ($flash_deal->status == '0') selected @endif>{{__('Inactive')}}</option>
                        </select>
                    </div>
                </div>
                 {{-- <div class="form-group">
                     <label class="col-lg-3 control-label" for="name">{{__('Status')}}</label>
                     <div class="col-lg-9">
                         <select name="text_color" id="text_color" class="form-control demo-select2" required>
                             <option value="">Select One</option>
                             <option value="white" @if ($flash_deal->status == '1') selected @endif>{{__('Active')}}</option>
                             <option value="dark" @if ($flash_deal->status == '0') selected @endif>{{__('Inactive')}}</option>
                         </select>
                     </div>
                 </div> --}}
                 <div class="form-group">
                     <label class="col-sm-3 control-label" for="banner">{{__('Image')}} <small>(1920x500)</small></label>
                     <div class="col-sm-9">
                         <input type="file" id="image" name="image" class="form-control">
                     </div>
                 </div>

             </div>
             <div class="panel-footer text-right">
                 <button class="btn btn-purple" type="submit">{{__('Save')}}</button>
             </div>
         </form>
        <!--===================================================-->
        <!--End Horizontal Form-->

    </div>
</div>

@endsection

@section('script')

@endsection
