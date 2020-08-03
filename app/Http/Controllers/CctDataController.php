<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class CctDataController extends Controller
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
     * Capture CCT Data
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {

        $str_json = file_get_contents('php://input'); //($_POST doesn't work here)
        $data_array = json_decode($str_json, true); // decoding received JSON to array
        
        // Log::info('str_json: ' . $str_json );

        Log::info('data_array: ' . $data_array[0]['trial_part'] );

        // store meta data
        $now = DB::raw('NOW()');
        DB::table('cct_collection_meta')->insert([
            'data_raw' => $str_json,
            'created_at' => $now,
        ]);
        // DB::table('cct_collection_meta')->insert([
        //     'token' => $data_array[0]['token'],
        //     'project_id' => $data_array[0]['project_id'],
        //     'project_name' => $data_array[0]['project_name'],
        //     'project_pi_id' => $data_array[0]['project_pi_id'],
        //     'experiment_id' => $data_array[0]['experiment_id'],
        //     'experiment_name' => $data_array[0]['experiment_name'],
        //     'note' => $data_array[0]['note'],
        //     'cct_id' => $data_array[0]['cct_id'],
        //     'cct_version' => $data_array[0]['cct_version'],
        //     'cct_language' => $data_array[0]['cct_language'],
        //     'cct_name' => $data_array[0]['cct_name'],
        //     'cohort_id' => $data_array[0]['cohort_id'],
        //     'cohort_name' => $data_array[0]['cohort_name'],
        //     'participant_id' => $data_array[0]['participant_id'],
        //     'test_type' => $data_array[0]['test_type'],
        //     'data_raw' => $str_json,
        //     'created_at' => $now,
        // ]);
        
        // store trail data - WORK IN PROGRESS
        // for($i=0; $i < count($data_array); $i++){
        //     for($j = 0; $j < count($col_names); $j++){
        //         $colname = $col_names[$j];
        //         if(!isset($data_array[$i][$colname])){
        //             $insertstmt->bindValue(":$colname", null, PDO::PARAM_NULL);
        //         } else {
        //             $insertstmt->bindValue(":$colname", $data_array[$i][$colname]);
        //         }
        //     }
        //     $insertstmt->execute();
        // }
        
        return ('{}');
    }
}
