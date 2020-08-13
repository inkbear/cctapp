<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use TCG\Voyager\Facades\Voyager;

class DashboardController 
{

    public function index(Request $request)
    {
        $user_id = Auth::user()->id;

        // Get the Project summary data
        $project_grid = $this->project_grid($user_id);

        // Get the Experiment summary data
        $experiment_grid = $this->experiment_grid($user_id);

        // Get the avaialable CCT
        $cct_grid = $this->cct_grid($user_id);

        // Get the Cohort summary data
        $cohort_grid = $this->cohort_grid($user_id);

        return Voyager::view( 'voyager::index', compact('project_grid', 'experiment_grid', 'cct_grid', 'cohort_grid') );
    }

    private function project_grid($user_id)
    {
        $sql = "
            SELECT DISTINCT p.name AS 'Project Name', ccts.name AS 'CCT Name', ch.name AS 'Cohort Name', e.name AS 'Experiment Name'  
            FROM projects AS p
            LEFT JOIN cct_user AS cu ON p.pi_id = cu.user_id
            LEFT JOIN ccts ON cu.cct_id = ccts.id
            LEFT JOIN cohort_project as chp ON p.id = chp.project_id
            LEFT JOIN cohorts AS ch ON ch.id = chp.cohort_id
            LEFT JOIN experiments AS e ON p.id = e.project_id
            LEFT JOIN users AS u ON u.id = p.pi_id
            LEFT JOIN project_user AS pu ON p.id = pu.project_id
            LEFT JOIN project_collaborator AS pc ON p.id = pc.project_id
            WHERE p.pi_id = " .  $user_id . "
            OR pu.user_id = " . $user_id . "
            OR pc.user_id = " . $user_id . "
            ORDER BY p.name 
        ";
        // Log::info($sql);
        $data = DB::select( DB::raw($sql));
        
        if(count($data)>0){
            return $this->makeGrid($data);
        }else{
            return;
        }
    }

    private function experiment_grid($user_id)
    {
        $sql = "
            SELECT DISTINCT e.name AS 'Experiment Name',  
            concat(round(( 
            (SELECT count(DISTINCT d.token) FROM cct_collection_data AS d WHERE d.experiment_id = e.id AND d.test_type != 'test') / 
            (SELECT count(*) FROM links AS l WHERE l.experiment_id = e.id) 
            * 100 ),1),'%') AS '% Complete'
            FROM experiments AS e 
            JOIN users AS u ON u.id = e.project_pi_id
            JOIN projects AS p ON p.id = e.project_id
            JOIN project_user AS pu ON p.id = pu.project_id
            JOIN project_collaborator AS pc ON p.id = pc.project_id
            WHERE e.project_pi_id = " .  $user_id . "
            OR pu.user_id = " . $user_id . "
            OR pc.user_id = " . $user_id . "
            ORDER BY e.name 
        ";
        // Log::info($sql);
        $data = DB::select( DB::raw($sql));
        
        if(count($data)>0){
            return $this->makeGrid($data);
        }else{
            return;
        }
    }

    private function cohort_grid($user_id)
    {
        $sql = "
            SELECT c.name AS 'Cohort Name', count(pt.id) AS 'Participants', p.name AS 'Project Assignment'

            FROM cohorts AS c
            LEFT JOIN participants AS pt ON c.id = pt.cohort_id
            LEFT JOIN cohort_project AS cp ON c.id = cp.cohort_id
            JOIN projects AS p ON p.id = cp.project_id
            JOIN project_user AS pu ON p.id = pu.project_id
            JOIN project_collaborator AS pc ON p.id = pc.project_id
            WHERE p.pi_id = " .  $user_id . "
            OR pu.user_id = " . $user_id . "
            OR pc.user_id = " . $user_id . "
            GROUP BY c.name, p.name
            ORDER BY c.name ASC, p.name ASC
        ";
        // Log::info($sql);
        $data = DB::select( DB::raw($sql));
        
        if(count($data)>0){
            return $this->makeGrid($data);
        }else{
            return;
        }
   }

    private function cct_grid($user_id)
    {
        $sql = "
            SELECT DISTINCT c.name AS 'CCT Name'
            FROM ccts AS c 
            JOIN cct_user AS cu ON cu.cct_id = c.id
            WHERE cu.user_id = " .  $user_id . "
            ORDER BY c.name 
        ";
        // Log::info($sql);
        $data = DB::select( DB::raw($sql));
        
        if(count($data)>0){
            return $this->makeGrid($data);
        }else{
            return;
        }
    }
    
    private function makeGrid($data)
    {
        $grid = '<table id="dataTable" class="table table-hover"><thead><tr>';
        foreach($data[0] as $key => $value){
            $grid .= '<th>' . $key . '</th>';
        }    
        $grid .= '</tr></thead><tbody>'; 

        foreach($data as $row){
            $grid .= '<tr>';
            foreach($row as $key => $value){
                if($key == '% Complete'){
                    $grid .= '<th><div class="progress_container"><div class="progress_bar" style="width: ' . $value . '; ">' . $value . '</div></div></th>';
                }else{
                    $grid .= '<th>' . $value . '</th>';
                }
            }
            $grid .= '</tr>';
        }
        $grid .= '</tbody></table>';
        
        return $grid;
    }

}