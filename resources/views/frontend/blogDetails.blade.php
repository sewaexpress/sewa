@extends('frontend.layouts.app')
@section('content')
<style>
    /* Blog Detail Page Starts */
    #blog-detail {
        background-color: #f9f9f9;
    }

    #blog-detail .image-block img {
        min-height: 415px;
        max-height: 415px;
        object-fit: cover;
        object-position: center;
        width: 100%;
    }

    #blog-detail .user-comment img {
        height: 6rem;
        width: 6rem;
        border-radius: 50%;
    }

    #blog-detail .blog-comment-bg {
        background-color: #ffffff;
        -webkit-box-shadow: 0px 15px 35px rgb(0 0 0 / 10%);
        box-shadow: 0px 15px 35px rgb(0 0 0 / 10%);
        border-radius: 10px;
    }

    #blog-detail .blog-comment-section .user-title h2 {
        border-bottom: 1px solid rgb(223, 223, 223);
        color: #f78035;
        padding-bottom: 15px;
        font-weight: bold;
    }

    #blog-detail .blog-comment-section {
        background-color: #ffffff;
        -webkit-box-shadow: 0px 15px 35px rgb(0 0 0 / 10%);
        box-shadow: 0px 15px 35px rgb(0 0 0 / 10%);
        border-radius: 10px;
    }

    #blog-detail .blog-comment-bg input,
    #blog-detail .blog-comment-bg textarea {
        background-color: #fafafa;
    }

    #blog-detail .blog-comment-section .comment-box-wrapper {
        border-bottom: 1px solid rgb(223, 223, 223);
    }

    #blog-detail .section-title h2 {
        color: #f78035;
    }

    #blog-detail .section-title {
        border-bottom: 1px solid #e7e2e2;
    }

    #blog-detail .comment-date {
        font-size: 12px;
    }

    #blog-detail .sidebar {
        background-color: #ffffff;
        box-shadow: 0px 0px 5px 0px #e1e1e1;
        border-radius: 6px;
        border-left: 4px solid #f78035;
        transition: all .5s;
        -webkit-transition: all .5s;
    }

    #blog-detail .sidebar:hover {
        transition: all .5s;
        -webkit-transition: all .5s;
        transform: translateY(-5px);
    }

    #blog-detail .title {
        padding-left: 8px;
    }

    #blog-detail .title h4:before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        bottom: 0;
        width: 4px;
        background-color: #f78035;
    }

    #blog-detail .search .form-control {
        padding-left: 2.375rem;
    }

    #blog-detail .search .form-control-feedback {
        position: absolute;
        z-index: 2;
        display: block;
        width: 2.375rem;
        height: 2.375rem;
        line-height: 2.375rem;
        text-align: center;
        pointer-events: none;
        color: #aaa;
    }

    #blog-detail .popular-post .post-image img {
        max-height: 80px;
        min-height: 80px;
        object-fit: contain;
        object-position: center;
        border-radius: 5px;
    }

    #blog-detail .popular-post .post-content .post-title a {
        color: #000;
        display: inline-block;
        text-decoration: none;
    }

    #blog-detail .popular-post .post-content .post-title a:hover {
        color: #f78035;
    }

    #blog-detail .popular-post .post-content {
        height: 85px !important;
        overflow: hidden;
    }

    #blog-detail .popular-post .post-content p {
        font-size: 12px;
    }

    #blog-detail .categories ul li:hover {
        cursor: pointer;
        transform: translateX(8px);
        transition: all .5s;
        -webkit-transition: all .5s;
    }

    #blog-detail .categories ul li i {
        color: #f78035;
    }

    #blog-detail .categories ul li {
        margin: 10px 0;
        transition: all .5s;
        -webkit-transition: all .5s;
    }

    #blog-detail .categories li {
        max-height: 28px;
        min-height: 28px;
        overflow: hidden;
    }

    #blog-detail .popular-tags ul li a {
        text-decoration: none;
        color: black;
        text-transform: uppercase;
    }

    #blog-detail .popular-tags ul li:hover {
        border: 2px solid #f78035;
        transition: all .5s;
        -webkit-transition: all .5s;
    }

    #blog-detail .popular-tags ul li {
        padding: 8px 20px;
        border: 1px solid rgba(14, 13, 13, 0.34);
        border-radius: 5px;
        margin-right: 5px;
        display: inline-block;
        margin-bottom: 10px;
        transition: all .5s;
        -webkit-transition: all .5s;
    }

    /* Blog Detail Page Ends */
</style>
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col">
                <ul class="breadcrumb">
                    <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                    <li>{{$blog->title}}</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<section class="gry-bg py-4" id="blog-detail">
    <div class="container sm-px-0">
        <div class="row">
            <div class="col-xl-8 col-lg-7 p-0">
                <div class="col-lg-12 col-12 mb-5 mb-lg-0 order-2 order-lg-1">
                    <div class="image-block">
                        @if($blog->photo != '')
                            @if(file_exists($blog->photo))
                                <img src="{{ asset($blog->photo) }}" class="img-fluid" alt=""> <span class="name">
                            @else
                                <img src="{{ asset('frontend/images/placeholder.jpg') }}" class="img-fluid" alt=""> <span class="name">
                            @endif
                        @else
                            <img src="{{ asset('frontend/images/placeholder.jpg') }}" class="img-fluid" alt=""> <span class="name">
                        @endif
                    </div>
                </div>
                <div class="col-lg-12 col-12 mb-5 mb-lg-0 order-3 order-lg-3">
                    <div class="section-title h-100 d-flex flex-column justify-content-center">
                        <h2 class="pt-4 font-weight-bold">
                            {{$blog->title}}
                        </h2>
                        <span>{{date('d M,Y',strtotime($blog->created_at))}}</span>
                        <p class="text_gray_ptext">
                            {{$blog->description}}
                        </p>
                    </div>
                    {{-- <div class="section-title h-100 d-flex flex-column justify-content-center">
                        <h2 class="pt-4 font-weight-bold">Blog Title 1</h2>
                        <p class="text_gray_ptext"> Morbi iaculis dolor purus, auctor porta dolor gravida ac.
                            Mauris ac tristique nulla. In hac habitasse platea dictumst. In ultrices pulvinar
                            imperdiet. Vivamus ut dui urna. Aenean lacinia ut nisi vel dapibus. Donec id elit
                            vehicula velit vulputate dignissim.</p>
                    </div> --}}
                    {{-- <div class="section-title h-100 d-flex flex-column justify-content-center">
                        <h2 class="pt-4 font-weight-bold">Blog Title 2</h2>
                        <p class="text_gray_ptext">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                            Nullam faucibus imperdiet metus at congue. Praesent cursus a ante ut facilisis..</p>
                        <p class="text_gray_ptext"> Morbi iaculis dolor purus, auctor porta dolor gravida ac.
                            Mauris ac tristique nulla. In hac habitasse platea dictumst. In ultrices pulvinar
                            imperdiet. Vivamus ut dui urna. Aenean lacinia ut nisi vel dapibus. Donec id elit
                            vehicula velit vulputate dignissim.</p>
                        <p class="text_gray_ptext"> Morbi iaculis dolor purus, auctor porta dolor gravida ac.
                            Mauris ac tristique nulla. In hac habitasse platea dictumst. In ultrices pulvinar
                            imperdiet. Vivamus ut dui urna. Aenean lacinia ut nisi vel dapibus. Donec id elit
                            vehicula velit vulputate dignissim.</p>
                    </div> --}}
                </div>
            </div>
            <div class="col-xl-4 col-lg-5">
                <div class="sidebar mb-5 p-4">
                    <div class="popular-post">
                        <div class="title position-relative">
                            <h4 class="title font-weight-bold mb-4"> Popular Post </h4>
                        </div>
                        @if (isset($blogs) && !($blogs->isEmpty()))
                            @foreach ($blogs as $a => $item)
                            <div class="d-flex align-items-center mb-4">
                                <div class="post-image mr-4 w-xl-25 w-md-0">
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
                                <div class="post-content w-75">
                                    <div class="date">
                                        <p class="text-uppercase mb-1"> {{date('d M,Y',strtotime($item->created_at))}}</p>
                                    </div>
                                    <div class="post-title">
                                        <a href="blog-detail.html">
                                            <h5 class="font-weight-bold">  {{$item->title}}</h5>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        @else
                            <p>Nothing to show!</p>
                        @endif
                        
                    </div>
                </div>
            </div>
            <!--  <div class="col-xl-9 ">
                !! $page->content !!
                </div>  -->
            {{-- <div class="row">
                <div class="col-xl-8">
                    <div class="blog-comment-section pt-3 pb-3 pl-5 pr-5 mb-5">
                        <div class="col-lg-12 my-4">
                            <div class="col-lg-12 mb-xl-4 mb-md-2 pl-0">
                                <div class="user-title">
                                    <h2>User Comment</h2>
                                </div>
                            </div>
                            <div class="d-md-flex comment-box-wrapper comment-box mb-xl-4 mb-md-2 mb-2 pb-3">
                                <div class="user-comment">
                                    <a href="#">
                                        <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                    </a>
                                </div>
                                <div class="media-body ml-md-5 mt-md-0 mt-3">
                                    <h4>Azar Hank</h4>
                                    <div class="comment-date mb-2">
                                        <p class="m-0 text-uppercase"> 12 March, 2021 AT 10:50 </p>
                                    </div>
                                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed consequuntur
                                        repudiandae, ducimus error animi neque recusandae optio tempora non sequi
                                        cupiditate ipsum perspiciatis porro maxime praesentium doloribus amet
                                        delectus velit.</p>
                                    <div class="comment-reply">
                                        <div class="d-md-flex comment-box mb-xl-4 mb-md-2">
                                            <div class="user-comment">
                                                <a href="#">
                                                    <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                                </a>
                                            </div>
                                            <div class="media-body ml-md-5 mt-md-0 mt-3">
                                                <h4>Azar Hank</h4>
                                                <div class="comment-date mb-2">
                                                    <p class="m-0 text-uppercase"> 12 March, 2021 AT 10:50 </p>
                                                </div>
                                                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed
                                                    consequuntur repudiandae, ducimus error animi neque recusandae
                                                    optio tempora non sequi cupiditate ipsum perspiciatis porro
                                                    maxime praesentium doloribus amet delectus velit.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="button">
                                        <a href="
                                        #"> Reply</a>
                                    </div>
                                </div>
                            </div>
                            <div class="d-md-flex comment-box-wrapper comment-box mb-xl-4 mb-md-2 mb-2 pb-3">
                                <div class="user-comment">
                                    <a href="#">
                                        <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                    </a>
                                </div>
                                <div class="media-body ml-md-5 mt-md-0 mt-3">
                                    <h4>Azar Hank</h4>
                                    <div class="comment-date mb-2">
                                        <p class="m-0 text-uppercase"> 12 March, 2021 AT 10:50 </p>
                                    </div>
                                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed consequuntur
                                        repudiandae, ducimus error animi neque recusandae optio tempora non sequi
                                        cupiditate ipsum perspiciatis porro maxime praesentium doloribus amet
                                        delectus velit.</p>
                                    <div class="comment-reply">
                                        <div class="d-md-flex comment-box mb-xl-4 mb-md-2">
                                            <div class="user-comment">
                                                <a href="#">
                                                    <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                                </a>
                                            </div>
                                            <div class="media-body ml-md-5 mt-md-0 mt-3">
                                                <h4>Azar Hank</h4>
                                                <div class="comment-date mb-2">
                                                    <p class="m-0 text-uppercase"> 12 March, 2021 AT 10:50 </p>
                                                </div>
                                                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed
                                                    consequuntur repudiandae, ducimus error animi neque recusandae
                                                    optio tempora non sequi cupiditate ipsum perspiciatis porro
                                                    maxime praesentium doloribus amet delectus velit.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="button">
                                        <a href="
                                        #"> Reply</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-12">
                    <div class="row p-3 justify-content-center">
                        <div class="blog-comment-bg p-xl-5 p-2">
                            <div class="col-lg-12 mb-4 text-center">
                                <h2 class="font-weight-bold mb-4">Add a comment</h2>
                            </div>
                            <div class="col-xl-12">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12 mb-md-0 mb-4">
                                            <input type="text" class="form-control border-0 rounded-0" placeholder="Name">
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <input type="email" class="form-control border-0 rounded-0" placeholder="Email address">
                                        </div>
                                        <div class="col-12 my-md-5 my-4">
                                            <div class="col-text-are d-flex justify-content-center">
                                                <textarea class="w-100 p-3 border-0 rounded-0" placeholder="Add Comment"></textarea>
                                            </div>
                                        </div>

                                        <button href="#" class="btn-custom m-auto px-5">Send</button>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div> --}}
        </div>
    </div>
</section>
@endsection