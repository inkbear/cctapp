@extends('voyager::master')

@section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                    <ul>
                    <!-- <li><strong>experiment_id:</strong> {{ $experiment_data[0]->experiment_id }}</li> -->
                    <!-- <li><strong>experiment_token:</strong> {{ $experiment_data[0]->experiment_token }}</li> -->
                    <li><strong>name</strong>: {{ $experiment_data[0]->name }}</li>
                    <!-- <li><strong>project_id</strong>: {{ $experiment_data[0]->project_id }}</li> -->
                    <li><strong>project_name</strong>: {{ $experiment_data[0]->project_name }}</li>
                    <!-- <li><strong>project_pi_id</strong>: {{ $experiment_data[0]->project_pi_id }}</li> -->
                    <!-- <li><strong>cct_id</strong>: {{ $experiment_data[0]->cct_id }}</li> -->
                    <li><strong>cct_name</strong>: {{ $experiment_data[0]->cct_name }}</li>
                    <!-- <li><strong>cct_asset_path</strong>: {{ $experiment_data[0]->cct_asset_path }}</li> -->
                    <!-- <li><strong>cohort_id</strong>: {{ $experiment_data[0]->cohort_id }}</li> -->
                    <li><strong>cohort_name</strong>: {{ $experiment_data[0]->cohort_name }}</li>
                    <li><strong>active</strong>: {{ $experiment_data[0]->active }}</li>
                    <!-- <li><strong>created_by</strong>: {{ $experiment_data[0]->created_by }}</li> -->
                    </ul>        
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table id="dataTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            ID
                                        </th><th>
                                            Token
                                        </th><th> 
                                            Link 
                                        </th><th> 
                                            Active
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($experiment_data as $data)
                                    <tr>
                                        <td>
                                        {{ $data->participant_id }}  
                                        </td><td>
                                        {{ $data->token }}
                                        </td><td>
                                        {{ $data->link }}
                                        </td><td>
                                        {{ $data->active }} 
                                        </td>
                                    </tr>

                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>


@stop

@section('javascript')



@stop
