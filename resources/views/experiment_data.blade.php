@extends('voyager::master')

@section('page_title', 'Experiment Data List')

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-data"></i>Data &nbsp;
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered" style="padding-bottom:5px;">
                    <div class="panel-heading" style="border-bottom:0;">
                        <h3 class="panel-title">{{ $dataContent[0]->experiment_name }}</h3>
                    </div>
                    <div class="panel-body" style="padding-top:0;">
                        <div class="table-responsive">
                            <table id="dataTable" class="table table-hover">
                                <tr>
                                @foreach($dataContent[0] as $key => $value)
                                    @if(!($key == 'json_raw' || $key == 'updated_at' || $key == 'deleted_at'))
                                        <th>{{ $key }}</th>
                                    @endif
                                @endforeach
                                @foreach($dataContent as $row)
                                <tr>
                                    @foreach($row as $key => $value)
                                        @if(!($key == 'json_raw' || $key == 'updated_at' || $key == 'deleted_at'))
                                            <td>{{ $value }}</td>
                                        @endif
                                    @endforeach
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

@stop

@section('javascript')
    <script>

    </script>
@stop
