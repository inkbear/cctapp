<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use TCG\Voyager\Facades\Voyager;

class DataController 
{

    public function index(Request $request)
    {
        $user_id = Auth::user()->id;

        // Get the Experiment data
        $sql = "
            SELECT DISTINCT e.id, e.name, e.project_name, u.name AS 'pi_name', e.cohort_name, 
            (SELECT count(DISTINCT d.token) FROM cct_collection_data AS d WHERE d.experiment_id = e.id AND d.test_type != 'test') AS 'complete', 
            (SELECT count(*) FROM links AS l WHERE l.experiment_id = e.id) AS 'total', 
            (SELECT count(DISTINCT d.token) FROM cct_collection_data AS d WHERE d.experiment_id = e.id AND d.test_type = 'test') AS 'test_qty' 
            FROM experiments AS e 
            JOIN users AS u ON u.id = e.project_pi_id
            JOIN projects AS p ON p.id = e.project_id
            JOIN project_user AS pu ON p.id = pu.project_id
            JOIN project_collaborator AS pc ON p.id = pc.project_id
        ";
        if(Auth::user()->role->name == 'admin'){
            // Let admin see all the data
            $sql .= '';
        }else{
            // Filter for projects where PI or assigned staff or collaborator
            $sql .= " WHERE e.project_pi_id = " .  $user_id . "
            OR pu.user_id = " . $user_id . "
            OR pc.user_id = " . $user_id ;
        }
        $sql .= " 
            ORDER BY e.project_name, e.name 
        ";
        // Log::info($sql);
        $dataContent = DB::select( DB::raw($sql));

        $view = 'experiment_data_list';
        return Voyager::view( $view, compact('dataContent') );
    }

    public function show(Request $request, $id, $test_type)
    {
        $this->experiment_access($id);

        $dataContent = DB::table('cct_collection_data', 'd')
            ->select('*')
            ->where('d.experiment_id', '=', $id );

        // Check to see if we are showing both live and test data
        if($test_type == 'test'){
            $dataContent = $dataContent->where('d.test_type', '=', 'test' ); 
        }else{
            $dataContent = $dataContent->where('d.test_type', '!=', 'test' ); 
        }
        $dataContent = $dataContent->get();
        $view = 'experiment_data';
        return Voyager::view($view, compact('dataContent'));

    }

    public function download(Request $request, $id)
    {       
        $this->experiment_access($id);
        
        $headers = array(
            "Content-type" => "text/csv",
            "Content-Disposition" => "attachment; filename=datafile.csv",
            "Pragma" => "no-cache",
            "Cache-Control" => "must-revalidate, post-check=0, pre-check=0",
            "Expires" => "0"
        );
        $data = DB::table('cct_collection_data', 'd')
            ->select('*')
            ->where('d.experiment_id', '=', $id )
            ->get();
           
        $callback = function() use ($data)
        {           
            $labels = array();
            foreach($data[0] as $key => $value){
                if(!($key == 'json_raw' || $key == 'updated_at' || $key == 'deleted_at')){
                    array_push($labels, $key);
                }
            }    
            
            $file = fopen('php://output', 'w');
            fputcsv($file, $labels);

            foreach($data as $row){
                $d_array = array();
                foreach($row as $key => $value){
                    if(!($key == 'json_raw' || $key == 'updated_at' || $key == 'deleted_at')){
                        array_push($d_array, $value);
                    }
                }
                fputcsv($file, $d_array);
            }

            fclose($file);
        };
        return response()->stream($callback, 200, $headers);
    }

    private function experiment_access($id)
    {
        // Check if user has access to this experiment
        // This could be done via Gate and policy but it seems easier to do this function here.
        $access = false;
        $user_id = Auth::user()->id;
        if(Auth::user()->role->name == 'admin'){
            return true;
        }else{
            $sql = "
                SELECT count(e.id) AS 'cnt'
                FROM experiments AS e 
                JOIN users AS u ON u.id = e.project_pi_id
                JOIN projects AS p ON p.id = e.project_id
                JOIN project_user AS pu ON p.id = pu.project_id
                JOIN project_collaborator AS pc ON p.id = pc.project_id
                WHERE e.id = " . $id . "
                AND (e.project_pi_id = " .  $user_id . "
                OR pu.user_id = " . $user_id . "
                OR pc.user_id = " . $user_id . ")
            ";
            
            Log::info($sql);
            $result = DB::select( DB::raw($sql));
            if($result[0]->cnt > 0){
                return true;
            }else{
                abort(403);
            }
        }
    }
}
