
<table class="table table-striped table-bordered demo-dt-basic" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>#</th>
            <th>{{__('Referred To')}}</th>
            <th>{{__('Date')}}</th>
        </tr>
    </thead>
    <tbody>
        @isset($list)
            @foreach($list as $key => $attribute)
                <tr>
                    <td>{{$key+1}}</td>
                    <td>{{$attribute['referred_to']['name']}}</td>
                    <td>{{date('Y-m-d',strtotime($attribute['created_at']))}}</td>
                </tr>
            @endforeach
            
        @endisset
    </tbody>
</table>