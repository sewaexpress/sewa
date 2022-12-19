<form class="form-horizontal" action="{{ route('commissions.category') }}" method="POST" enctype="multipart/form-data">
    @csrf
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="myModalLabel">{{__('Category Wise Commission')}}</h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel">
                    <div class="panel-body"> 
                        <input type="hidden" name="seller_id" value="{{ $seller->id }}">
                        @foreach (\App\Category::orderBy('created_at', 'desc')->get() as $key => $category)
                            <div class="form-group">
                                <div class="col-lg-6">
                                    <input type="hidden" name="arr[{{ $key }}][id]" value="{{ $category->id }}">
                                    <input type="text" class="form-control" value="{{ $category->name }}" readonly>
                                </div>
                                @php
                                    $commission=\App\Models\Commission::where('category_id',$category->id)->where('seller_id',$seller->id)->first();
                                @endphp
                                <div class="col-lg-4">
                                    <input type="number" min="0" step="0.01" class="form-control" name="arr[{{ $key }}][commission_rate]" value="{{($commission!=null) ? $commission->commission_rate : 0}}">
                                </div>
                                <div class="col-lg-2">
                                    <input type="text" class="form-control" value="%">
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="modal-footer">
        <div class="panel-footer text-right">
            
            <button class="btn btn-purple" type="submit">{{__('Save')}}</button>
            <button class="btn btn-default" data-dismiss="modal">{{__('Cancel')}}</button>
        </div>
    </div>
</form>

