<form class="form-horizontal" action="{{ route('arrangeCategorySave') }}" method="POST" enctype="multipart/form-data">
    @csrf
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="myModalLabel">{{__('Arrange Categories')}}</h4>
    </div>

    <div class="modal-body">
        @foreach ($data as $a => $b)
            {{-- <input type="hidden" name="[{{$b->id}}]['order']" value="{{ $seller->id }}"> --}}
            <div class="form-group">
                <label class="col-sm-3 control-label" for="amount">{{$b->name}}</label>
                <div class="col-sm-9">
                    <input type="number" name="order[{{$b->id}}]" id="amount" value="{{$b->digital}}" class="form-control" required>
                </div>
            </div>
            
        @endforeach

    </div>
    <div class="modal-footer">
        <div class="panel-footer text-right">
            <button class="btn btn-purple" type="submit">{{__('Save')}}</button>
        </div>
    </div>
</form>
<script>
$(document).ready(function(){
    $('#payment_option').on('change', function() {
      if ( this.value == 'bank_payment')
      {
        $("#txn_div").show();
      }
      else
      {
        $("#txn_div").hide();
      }
    });
    $("#txn_div").hide();
});
</script>
