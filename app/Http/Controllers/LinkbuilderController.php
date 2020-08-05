<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\RedirectResponse;

class LinkbuilderController extends Controller
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
     * Process Experiment Creation
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $project_id = $request->input('project_id');
        // DB::enableQueryLog();

        // Get the project data including the names for the CCT and Cohort
        $project_data = DB::table('projects', 'p')
            ->select('p.*', 'ccts.id AS cct_id', 'ccts.version AS cct_version', 'ccts.language AS cct_language', 
                'ccts.name AS cct_name', 'ccts.asset_path AS cct_asset_path', 
                'cohorts.id AS cohort_id', 'cohorts.name AS cohort_name')
            ->join('ccts', 'p.cct_id', '=', 'ccts.id' )
            ->join('cohorts', 'p.cohort_id', '=', 'cohorts.id' )
            ->where('p.id', '=', $project_id )
            ->first();
        
        // Eroor checking
        $error = 0;
        $message = '';
        // Check if all the project components are in place
        if( !(isset($project_data->name) &&
            isset($project_data->pi_id) &&
            isset($project_data->cct_id) &&
            isset($project_data->cct_asset_path) &&
            isset($project_data->cohort_id) 
            )){  
            $error = 1;
            $message = "Incomplete data for making links.";    
        }

        // Get the participant data
        $p_data = DB::table('participants', 'p')
            ->select('p.*')
            ->where('p.cohort_id', '=', $project_data->cohort_id )
            ->get();
        
        // Eroor checking
        if(!(isset($p_data[0]->id))){
            $error = 1;
            $message = "Cohort must have at least one particpant.";    
        }

        if ($error == 1){
            return redirect('/admin/projects/')->with(['message' => $message, 'alert-type' => 'error']); 
        }

        // Generate static values
        $token = bin2hex(random_bytes(16));
        $active = 1;
        $created_by = Auth::user()->id;
        $dt = getdate();
        $name = $project_data->name . ' : ' . $dt['year'] . $dt['mon'] . $dt['mday'] . '-' . $dt['hours'] . $dt['minutes'] . $dt['seconds'];

        // Store experiment level values
        DB::table('experiments')->insert(
            [
            'experiment_token' => $token,
            'name' => $name, 
            'project_id' => $project_data->id, 
            'project_name' => $project_data->name, 
            'project_pi_id' => $project_data->pi_id, 
            'cct_id' => $project_data->cct_id, 
            'cct_version' => $project_data->cct_version, 
            'cct_language' => $project_data->cct_language, 
            'cct_name' => $project_data->cct_name, 
            'cct_asset_path' => $project_data->cct_asset_path, 
            'cohort_id' => $project_data->cohort_id, 
            'cohort_name' => $project_data->cohort_name, 
            'active' => $active, 
            'created_by' => $created_by,
            ]
        );

        // Get the id for the experiment just stored
        $e_data = DB::table('experiments', 'e')
            ->select('e.id')
            ->where('e.experiment_token', '=', $token )
            ->first();
        $experiment_id = $e_data->id;

        // Store the participant data
        foreach( $p_data as $p ){
            $token = bin2hex(random_bytes(16));
            $link = '/cct?token=' . $token;

            DB::table('links')->insert(
                [
                'experiment_id' => $experiment_id,
                'participant_id' => $p->id, 
                'participant_identifier' => $p->identifier, 
                'participant_alias' => $p->alias, 
                'token' => $token, 
                'link' => $link, 
                'active' => $active, 
                ]
            );
        }

        // Show the results using the regular BREAD view
        return redirect('/admin/experiments/' . $experiment_id);

    }
}
