@extends('voyager::master')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @else
                    <div class="alert alert-warning" role="alert">
                            No session
                        </div>
                    @endif   
                    @if(Auth::user()->hasRole('admin'))
                        All your data are belong to us nerd.
                    @endif 
                    @if(Auth::user()->hasRole('owner'))
                        It's good to be the king.
                    @endif 
                    @if(Auth::user()->hasRole('pi'))
                        I'm busy now.
                    @endif 
                    @if(Auth::user()->hasRole('collab'))
                        It's good to see you again.
                    @endif 
                    @if(Auth::user()->hasRole('staff'))
                        Get back to work!
                    @endif 
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
