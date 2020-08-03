<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class CctController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // 
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {       

        $token = $request->input('token');

        // Retrieve the data for rendering
        $experiment_data = DB::table('experiments', 'e')
            ->select('e.*', 'links.*', 'e.name AS experiment_name')
            ->join('links', 'e.id', '=', 'links.experiment_id' )
            ->where('links.token', '=', $token )
            ->first();
        
        // if($experiment_data == ''){
        //     Log::info('empty');
        // }else{
        //     Log::info(var_dump($experiment_data) );
        // }

        /* 
        ADD SOME ERROR HANDLING FOR:
        - Token not found (no results)
        - Experiment is not active
        - Link is not active
        - Valid path to js include file
        NEED TO ADD Expriment Meta Data to Experiment?
        */
                
        // Pull in the js file and populate
        return view('cct')->with('experiment_data', $experiment_data);
    }
}
