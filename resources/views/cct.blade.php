@include('voyager-frontend::partials.meta')
@include('voyager-frontend::partials.header')

<main class="main-content">
    <p>Inkbear Rules</p>
    @yield('content')


    @php 
        echo $_GET['foo'];

        echo $currentUser->ID;

        /*
        $sql = "SELECT s.id, c.id
        FROM participants AS s,
        cohorts AS c
        WHERE c.id = s.cohort_id
        AND c.owner_id = '$user->id' 
        AND s.id = '$participant->id'
        ";
        $results = DB::select( DB::raw("$sql") );
        if(count($results) > 0){
            $allow = true;
        }
        */

    @endphp
</main>

