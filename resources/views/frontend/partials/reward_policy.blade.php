<style>
    .done.icon{
        background: #63c530!important;
    }
</style>
<div class="modal-header">
    <h5 class="modal-title strong-600 heading-5">Reward Policy</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>


<div class="modal-body gry-bg px-3 pt-0">
    <div class="pt-4">
       @php
           echo $reward_policy;
       @endphp
    </div>
    <div class="card mt-4">
        <div class="card-header py-2 px-3 heading-6 strong-600 clearfix">
            <div class="float-left">{{__('Reward Ranges')}}</div>
        </div>
        <div class="card-body pb-0">
            <div class="row">
                <div class="col-lg-6">
                    <table class="details-table table">
                        <tr>
                            <td>S.N</td>
                            <td>Start Range (Rs.)</td>
                            <td>End Range (Rs.)</td>
                            <td>Amount</td>
                        </tr>
                        @foreach ($rewardRange as $key =>$item)
                            <tr>
                                <td>{{$key+1}}</td>
                                <td class="w-50 strong-600">{{$item->start_range}}</td>
                                <td class="w-50 strong-600">{{$item->end_range}}</td>
                                <td class="w-50 strong-600">{{$item->value}}</td>
                            </tr>                            
                        @endforeach
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

