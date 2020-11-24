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

        // Request must have a token parameter
        if( $request->input('token') != '') {
            $token = $request->input('token');
        }else{
            abort(404);
        }

        // Set the environment for preview, test, and live which determines how data is displayed and stored
        if( app('request')->exists('env') &&  ( $request->input('env') == 'preview' || $request->input('env') == 'test') ){
            $experiment_data = $this->getExperimentData($token);
            $this->linkCheck($experiment_data); 
            $experiment_data->test_type = $request->input('env');
        }elseif( app('request')->exists('env') &&  ( $request->input('env') == 'ownerpreview' ) ){ 
            $experiment_data = $this->getCctData($token);
            $experiment_data->test_type = $request->input('env');
        }else{
            $experiment_data = $this->getExperimentData($token);
            $this->linkCheck($experiment_data);
            $experiment_data->test_type = 'live';
        }

        $this->jsCheck($experiment_data);
        return view('cct')->with('experiment_data', $experiment_data);
    }

    private function getExperimentData($token)
    {       
        $experiment_data = DB::table('experiments', 'e')
            ->select('e.*', 'links.*', 'e.name AS experiment_name', 'links.active AS l_active', 'e.active AS e_active')
            ->join('links', 'e.id', '=', 'links.experiment_id' )
            ->where('links.token', '=', $token )
            ->first();
        return $experiment_data;
    }

    private function getCctData($id){
        $experiment_data = DB::table('ccts', 'c')
            ->select('c.id AS cct_id', 'c.asset_path AS cct_asset_path', 
            'c.version AS cct_version', 'c.language AS cct_language',
            'c.name AS cct_name')
            ->where('c.id', '=', $id )
            ->first();
        return $experiment_data;
    }

    private function linkCheck($experiment_data)
    {    
        // Send an error message if the link is not active at the link or experiment level
        if($experiment_data->l_active != 1 || $experiment_data->e_active != 1){
            $experiment_data->error = 'Sorry, the link you are using is not active.';
            $experiment_data->error_detail = '
                <ul>
                    <li>Experiment activation: ' . $experiment_data->e_active . '</li>
                    <li>Link activation: ' .  $experiment_data->l_active . '</li>
                </ul>';
            return view('load_error')->with('experiment_data', $experiment_data);
        }
    }

    private function jsCheck($experiment_data)
    {    
        // Send an error if the js file is not found
        if (!(file_exists('storage/' . $experiment_data->cct_asset_path . '/trial_info.js'))) {
            $experiment_data->error = 'Sorry, the trial_info.js file was not found';
            $experiment_data->error_detail = '
                <ul>
                    <li>File: storage/' . $experiment_data->cct_asset_path . '/trial_info.js</li>
                </ul>';
            return view('load_error')->with('experiment_data', $experiment_data);
        }
    }

}
