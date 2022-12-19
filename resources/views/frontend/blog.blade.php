@extends('frontend.layouts.app')
@section('content')
<style>
    /* Blog */
/* #blog-wrapper {
    background-image: url('/frontend/assets/images/bg-blog.jpg');
    background-position: center;
    background-size: cover;
} */
#blog-detail-wrapper .blog-content {
    transition: 0.5s;
    overflow: hidden;
    text-align: center;
}

#blog-detail-wrapper .content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

#blog-detail-wrapper .blog-content:hover {
    transition: 0.5s;
}

#blog-detail-wrapper .blog-content .title {
    max-height: 46px;
    min-height: 46px;
    overflow: hidden;
    font-size: 18px;
    font-weight: 400;
    letter-spacing: 0px;
}

#blog-detail-wrapper .blog-content .date-comment {
    max-height: 25px;
    min-height: 25px;
    overflow: hidden;
    color: var(--sub-head);
    font-size: 15px;
}

#blog-detail-wrapper .blog-content .date-comment .fa {
    font-size: 5px;
}

#blog-detail-wrapper .blog-content:hover .image img {
    filter: brightness(1);
    transition: .5s;
}

#blog-detail-wrapper .blog-content:hover .image {
    filter: blur(1px);
}

#blog-detail-wrapper .blog-content .image img {
    max-height: 280px;
    min-height: 280px;
    object-fit: cover;
    object-position: center;
    width: 100%;
    filter: brightness(0.5);
    transition: .5s;
}

/* Blog Page Starts */

#blog-detail-wrapper .card .card-head img {
    border-radius: 6px;
    max-height: 250px;
    min-height: 250px;
    object-fit: cover;
    object-position: center;
    width: 100%;
}



#blog-detail-wrapper .card .card-head {
    padding: 12px;
}

#blog-detail-wrapper .card .card-title {
    color: var(--main-color);
    max-height: 54px;
    min-height: 54px;
    overflow: hidden;
    font-weight:600;
}

#blog-detail-wrapper .card {
    border: none;
    background-color: white;
    transition: .5s;
    -webkit-transition: .5s;
    border-radius: 10px;
    overflow: hidden;
}

#blog-detail-wrapper .card:hover {
    border: none;
    cursor: pointer;
    background-color: aliceblue;
    transform: translateY(-7px);
    transition: .5s;
    -webkit-transition: .5s;
}

#blog-detail-wrapper .card .blog-content-img img {
    max-height: 40px;
    min-height: 40px;
    object-fit: cover;
    object-position: center;
    width: 40px;
}

#blog-detail-wrapper .card .blog-content-img {

    margin-right: 13px;
}

#blog-detail-wrapper .card .blog-content-discription .name {
    color: var(--main-color);
}

#blog-detail-wrapper .card .blog-content-discription .date {
    color: black;
    font-size: 0.7rem;
}




/* Blog Page Ends */

/* Blog Ends */
</style>
    <div class="breadcrumb-area">   
        <div class="container">
            <div class="row">
                <div class="col">
                    <ul class="breadcrumb">
                        <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                        <li>Blog</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <section class="gry-bg">
        <div class="container sm-px-0">
            <div id="blog-detail-wrapper" class="py-5">
                <div class="row justify-content-center">
                    @if (isset($blogs) && !($blogs->isEmpty()))
                        @foreach ($blogs as $a => $item)
                        <div class="col-md-4 col-12 mb-3">
                            <a href="{{route('blogDetails',['id' => $item->id])}}">
                                <div class="card">
                                    <div class="card-head">
                                        @if($item->photo != '')
                                            @if(file_exists($item->photo))
                                                <img src="{{ asset($item->photo) }}" class="img-fluid" alt=""> <span class="name">
                                            @else
                                                <img src="{{ asset('frontend/images/placeholder.jpg') }}" class="img-fluid" alt=""> <span class="name">
                                            @endif
                                        @else
                                            <img src="{{ asset('frontend/images/placeholder.jpg') }}" class="img-fluid" alt=""> <span class="name">
                                        @endif
                                    </div>
                                    <div class="card-body pt-2">
                                        <h5 class="card-title">
                                            {{$item->title}}
                                        </h5>
                                                <div class="date">
                                                    <span>{{date('d M,Y',strtotime($item->created_at))}}</span>
                                                </div>
                                        {{-- <div class="d-flex align-items-center mt-2"> --}}
                                            {{-- <div class="blog-content-img">
                                                <img src="https://www.onlinekhabar.com/wp-content/uploads/2022/02/Nepal-police-at-Lalitpur-1024x683.jpg"
                                                    class="img-fluid" alt="">
                                            </div> --}}
                                            {{-- <div class="blog-content-discription d-flex flex-column justify-content-start"> --}}
                                                {{-- <div class="name">
                                                    <h6 class="m-0">James Dej</h6>
                                                </div> --}}
                                            {{-- </div> --}}
                                        {{-- </div> --}}
                                    </div>
                                </div>
                            </a>
                        </div>
                        @endforeach

                    @else
                        <p>Nothing to show!</p>
                    @endif
                    </div>
                </div>
            </div>
        <!-- Blog detail Ends -->
                <!-- <form action="">
                    <div class="form-group">
                        <label class="col-sm-3" for="title">{{ __('Name') }}</label>
                        <input type="text" placeholder="{{ __('Title') }}" id="title" name="title" class="form-control"
                                required>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3" for="title">{{ __('Subject') }}</label>
                        <input type="text" placeholder="{{ __('Title') }}" id="title" name="title" class="form-control"
                                required>
                    </div>
                </form>
                <div class="col-xl-9 "> 
                   $page->content !!
                </div>  -->
            </div>

        </div>
    </section>
@endsection