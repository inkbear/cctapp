@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-dashboard"></i>
        Dashboard
    </h1>
@stop

@section('content')

    <!-- Main Content -->
    <div class="page-content container-fluid">
        <div class="alerts">
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="column">
                        <div class="card">
                            <div class="container">
                                <h4><b>Project Summary</b></h4> 
                                {!! $project_grid  ?? 'No projects to display' !!} 
                            </div>
                        </div>
                    </div>
                    
                    <div class="column">
                        <div class="card">
                            <div class="container">
                                <h4><b>Experiment Progress</b></h4> 
                                {!! $experiment_grid  ?? 'No experiments to display' !!} 
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">    
                    <div class="column">
                        <div class="card">
                            <div class="container">
                                <h4><b>Cohort Summary</b></h4> 
                                {!! $cohort_grid  ?? 'No cohorts to display' !!} 
                            </div>
                        </div>
                    </div>

                    <div class="column">
                        <div class="card">
                            <div class="container">
                                <h4><b>My CCT for Project Assignment</b></h4> 
                                {!! $cct_grid  ?? 'None' !!} 
                            </div>
                        </div>
                    </div>
                
                </div>

            </div><!-- .row -->
        </div><!-- .col-md-12 -->
    </div><!-- .page-content container-fluid -->


@stop

@section('css')

<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 600px;
  border-radius: 5px;
  margin: 10px;
  float: left;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img {
  border-radius: 5px 5px 0 0;
}

.container {
  padding: 2px 16px;
}

.progress_container {
  width: 100%; /* Full width */
  height: 100%;
  background-color: #ddd; /* Grey background */
  text-align: right;
  padding-top: 0px;
  padding-bottom: 0px;
  color: dimgray; 
}

.progress_bar {
  background-color: #B1D0B1;
}

</style>
  
@stop
