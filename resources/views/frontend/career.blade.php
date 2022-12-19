@extends('frontend.layouts.app')
@section('content')
<style>
    /* #acc .card-header {
        background:#258aff;
    } */
    #acc .card-header button {
        color: #fff;
        text-decoration:none;   
        background:#258aff;
    }

    form.cv-form {
        
    }
</style>

    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col">
                    <ul class="breadcrumb">
                        <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                        <li>Career</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <section class="gry-bg py-4">
        <div class="container sm-px-0">
            <div class="row">
                <div class="col-12">
                    <div class="accordion w-100" id="acc">
                        @if (isset($career) && !($career->isEmpty()))
                            @foreach ($career as $a => $item)
                            
                                <div class="card mb-3">
                                    <div class="card-header p-0" id="">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link w-100 text-left p-3" type="button" data-toggle="collapse" data-target="#collapse" aria-expanded="true" aria-controls="collapse">
                                                {{$item->title}}
                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapse" class="collapse" aria-labelledby="heading" data-parent="#acc">
                                        <div class="card-body">
                                            {{$item->description}}
                                        </div>
                                    </div>
                                </div>
                            @endforeach

                        @else
                            <p>No Vacancies Available</p>
                        @endif
                      
                    </div>
                </div>
                {{-- <div class="col-4">
                    <form class="cv-form p-4 bg-white">
                                <div class="form-group">
                                    <label for="Name">Name</label>
                                    <input type="email" class="form-control" id="" aria-describedby="" placeholder="Full Name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Subject</label>
                                    <input type="text" class="form-control" id="" placeholder="Topic for Discussion">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Message</label><br>
                                    <textarea name="" id="" rows="10" class="w-100"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Upload CV</label>
                                    <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                </div>
                                <div class="form-group mx-auto text-center">
                                    <button type="submit" class="btn-custom">Submit</button>
                                </div>
                    </form>
                </div> --}}
            </div>
        </div>
    </section>
  
@endsection