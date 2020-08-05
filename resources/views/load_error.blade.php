@extends('voyager-frontend::layouts.default')
@section('meta_title', 'Inactive Link')
@section('meta_description', 'Inactive Link')
@section('page_title', 'Inactive Link')

@section('content')
    <div class="vspace-5"></div>

    <div class="grid-container">
        <div class="grid-x">
            <div class="cell small-12">
                <h2 class="text-center">{{ $experiment_data->error }}</h2>
                {!! $experiment_data->error_detail !!}
            </div>
        </div>
    </div>

    <div class="vspace-5"></div>
@endsection
