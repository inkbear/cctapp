<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataDeleted;
use TCG\Voyager\Events\BreadDataRestored;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Events\BreadImagesDeleted;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;

class DataController extends \TCG\Voyager\Http\Controllers\VoyagerBaseController
{
    use BreadRelationshipParser;

    public function index(Request $request)
    {

        // Get the Experiment data
        $sql = "
            SELECT e.id, e.name, e.project_name, u.name AS 'pi_name', e.cohort_name, 
            (SELECT count(DISTINCT d.token) FROM cct_collection_data AS d WHERE d.experiment_id = e.id) AS 'complete', 
            (SELECT count(*) FROM links AS l WHERE l.experiment_id = e.id) AS 'total' 
            FROM experiments AS e JOIN users AS u ON u.id = e.project_pi_id
            ORDER BY e.project_name, e.name
        ";
        $dataContent = $results = DB::select( DB::raw($sql));

        $view = 'experiment_data_list';

        return Voyager::view( $view, compact('dataContent') );

    }

    public function show(Request $request, $id)
    {
        
        $dataContent = DB::table('cct_collection_data', 'd')
            ->select('*')
            ->where('d.experiment_id', '=', $id )
            ->get();

        $view = 'experiment_data';

        return Voyager::view($view, compact('dataContent'));
    }



}
