<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ExperimentController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $project_id = $request->input('project_id');
        // Log::info($project_id);

        // DB::connection()->enableQueryLog();


        // Look up project, cct, cohort
        // $user_id = Auth::user()->id;

        // Get the project data including the names for the CCT and Cohort
        $project_data = DB::table('projects', 'p')
            ->select('p.*', 'ccts.id AS cct_id', 'ccts.name AS cct_name', 'ccts.asset_path AS cct_asset_path', 
                'cohorts.id AS cohort_id', 'cohorts.name AS cohort_name')
            ->join('cct_project', 'p.id', '=', 'cct_project.project_id' )
            ->join('ccts', 'cct_project.cct_id', '=', 'ccts.id' )
            ->join('cohort_project', 'p.id', '=', 'cohort_project.project_id' )
            ->join('cohorts', 'cohort_project.cohort_id', '=', 'cohorts.id' )
            ->where('p.id', '=', $project_id )
            ->first();

        // Generate static values
        $token = bin2hex(random_bytes(16));
        $active = 1;
        $created_by = Auth::user()->id;

        // Store objects
        DB::table('experiments')->insert(
            [
            'experiment_token' => $token,
            'name' => 'exp-' . $token, 
            'project_id' => $project_data->id, 
            'project_name' => $project_data->name, 
            'project_pi_id' => $project_data->pi_id, 
            'cct_id' => $project_data->cct_id, 
            'cct_name' => $project_data->cct_name, 
            'cct_asset_path' => $project_data->cct_asset_path, 
            'cohort_id' => $project_data->cohort_id, 
            'cohort_name' => $project_data->cohort_name, 
            'active' => $active, 
            'created_by' => $created_by,
            ]
        );


        // Get the participant data
        $participant_data = DB::table('participants', 'p')
            ->select('p.*')
            ->where('p.cohort_id', '=', $project_data->cohort_id )
            ->get();

        $experiment_data = DB::table('experiments', 'e')
            ->select('e.id')
            ->where('e.experiment_token', '=', $token )
            ->first();

        $experiment_id = $experiment_data->id;

        foreach( $participant_data as $participant ){
            $token = bin2hex(random_bytes(16));
            $link = 'cct?token=' . $token;

            DB::table('links')->insert(
                [
                'experiment_id' => $experiment_id,
                'participant_id' => $participant->id, 
                'token' => $token, 
                'link' => $link, 
                'active' => $active, 
                ]
            );
        }

        // Retrieve the inserted data for rendering
        $experiment_data = DB::table('experiments', 'e')
            ->select('e.*', 'links.*')
            ->join('links', 'e.id', '=', 'links.experiment_id' )
            ->where('e.id', '=', $experiment_id )
            ->get();

        return view('experiment')->with('experiment_data', $experiment_data);
    }
}
