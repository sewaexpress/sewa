@extends('layouts.app')
@section('content')
<div class="col-sm-12">
   <div class="panel">
      <div class="panel-heading">
         <h3 class="panel-title">{{__('Add New Information')}}</h3>
      </div>
      <!--Horizontal Form-->
      <!--===================================================-->
      <form class="form-horizontal" action="{{ route('pages.testimonialstore') }}" method="POST" enctype="multipart/form-data">
         @csrf
         <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3 control-label" for="name">{{__('Name')}}</label>
                <div class="col-sm-9">
                   <input type="text" placeholder="{{__('Name')}}" id="name" name="name" class="form-control" required>
                </div>
             </div>
            <div class="form-group">
               <label class="col-sm-3 control-label" for="name">{{__('Title')}}</label>
               <div class="col-sm-9">
                  <input type="text" placeholder="{{__('Title')}}" id="title" name="title" class="form-control" required>
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-3 control-label" for="background_color">{{__('about')}} </label>
               <div class="col-sm-9">
                  <input type="text" placeholder="{{__('about')}}" id="about" name="about" class="form-control" required>
               </div>
            </div>

            <div class="form-group">
               <label class="col-sm-3 control-label" for="banner">{{__('Image')}} </label>
               <div class="col-sm-9">
                  <input type="file" id="image" name="image" class="form-control">
               </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label" for="name">{{__('Status')}}</label>
                <div class="col-lg-9">
                   <select name="status" id="status" class="form-control demo-select2" required>
                      <option value="">Select One</option>
                      <option value="0">{{__('InActive')}}</option>
                      <option value="1">{{__('Active')}}</option>
                   </select>
                </div>
             </div>
            <br>
            <div class="form-group" id="discount_table">
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

