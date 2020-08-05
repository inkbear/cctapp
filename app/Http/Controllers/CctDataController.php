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
        $now = DB::raw('NOW()');
        // DB::enableQueryLog();

        // if($data_array[0]['test_type'] == 'preview'){
        //     return ('{}');
        // }

        foreach($data_array as $data){
            if($data['trial_part'] == 'test'){
                DB::table('cct_collection_data')->insert([
                    'rt' => $data['rt'], // 1160,
                    'stimulus' => $data['stimulus'], // "storage/cct/english/v1/touch_horse.mp3",
                    'button_pressed' => $data['button_pressed'],  // "0",
                    'trial_part' => $data['trial_part'],  // "test",
                    'target' => $data['target'],  // "horse",
                    'distractor' => $data['distractor'],  // "cow",
                    'trial_type' => $data['trial_type'],  // "audio-button-response",
                    'trial_index' => $data['trial_index'], // 1,
                    'time_elapsed' => $data['time_elapsed'], // 4352,
                    'internal_node_id' => $data['internal_node_id'],  // "0.0-1.0-0.0",
                    'token' => $data['token'],  // "f7b938a0dd2c665e0933222007c68f91",
                    'project_id' => $data['project_id'],  // "4",
                    'project_name' => $data['project_name'],  // "Hungarian Wave 2",
                    'project_pi_id' => $data['project_pi_id'],  // "2",
                    'experiment_id' => $data['experiment_id'],  // "18",
                    'experiment_name' => $data['experiment_name'],  // "Hungarian Wave 2 : 202082-181545",
                    'note' => $data['note'],  // "",
                    'cct_id' => $data['cct_id'],  // "1",
                    'cct_version' => $data['cct_version'],  // "1",
                    'cct_language' => $data['cct_language'],  // "English",
                    'cct_name' => $data['cct_name'],  // "English V1",
                    'cohort_id' => $data['cohort_id'],  // "2",
                    'cohort_name' => $data['cohort_name'],  // "English Monolinguals",
                    'participant_id' => $data['participant_id'],  // "1",
                    'participant_identifier' => $data['participant_identifier'],  // "800",
                    'participant_alias' => $data['participant_alias'],  // "sdsu_en_w1_800",
                    'correct' => $data['correct'],  // true
                    'test_type' => $data['test_type'],  // LIVE | TEST
                    'json_raw' => $str_json,
                    'created_at' => $now,
                ]);

            }
        }

        // $log = dd(DB::getQueryLog());
        // Log::info('SQL: ' . $log);

        // store trail data based on avaialble fields for a more flexible interface - WORK IN PROGRESS
        // for($i=0; $i < count($data_array); $i++){
        //     for($j = 0; $j < count($col_names); $j++){
        //         $colname = $col_names[$j];
        //         if(!isset($data_array[$i][$colname])){
        //             $insertstmt->bindValue(' => $data[''] $colname", null, PDO::PARAM_NULL);
        //         } else {
        //             $insertstmt->bindValue(' => $data[''] $colname", $data_array[$i][$colname]);
        //         }
        //     }
        //     $insertstmt->execute();
        // }
        
        return ('{}');
    }
}
