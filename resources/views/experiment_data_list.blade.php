@extends('voyager::master')

@section('page_title', 'Experiment Data List')

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-data"></i> Experiment Data &nbsp;
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered" style="padding-bottom:5px;">
                    <div class="panel-heading" style="border-bottom:0;">
                        <h3 class="panel-title">Test Configurations</h3>
                    </div>
                    <div class="panel-body" style="padding-top:0;">
                        <div class="table-responsive">
                            <table id="dataTable" class="table table-hover">
                            <tr>
                                <th>Project</th>
                                <th>PI</th>
                                <th>Experiment</th>
                                <th>Cohort</th>
                                <th>Complete/Total</th>
                                <th>Actions</th>
                            </tr>
                            @foreach($dataContent as $row)
                                <tr>
                                    <td>{{ $row->project_name }}</td>
                                    <td>{{ $row->pi_name }}</td>
                                    <td>{{ $row->name }}</td>
                                    <td>{{ $row->cohort_name }}</td>
                                    <td>{{ $row->complete }}/{{ $row->total }}</td>
                                    <td>
                                        @if($row->complete > 0)
                                        <a href="/admin/data/{{ $row->id }}/view" title="Edit" class="btn btn-sm btn-primary pull-left edit">
                                            <i class="voyager-data"></i> <span class="hidden-xs hidden-sm">View</span>
                                        </a>
                                        <a href="/admin/download/{{ $row->id }}" title="Export" class="btn btn-sm btn-primary pull-left edit">
                                            <i class="voyager-download"></i> <span class="hidden-xs hidden-sm">Download</span>
                                        </a>
                                        @endif
                                    </td>                                  
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
