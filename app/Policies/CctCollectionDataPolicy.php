<?php

namespace App\Policies;

use App\User;
use App\CctCollectionDatum;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

use Illuminate\Auth\Access\HandlesAuthorization;

class CctCollectionDataPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     * THIS POLICY OVERRIDES THE BREAD SETTINGS FOR THE TABLE
     *
     * @return void
     */
    public function __construct()
    {
    }

    public function before($user, $ability)
    {
        // These folks get to skip over the rest of the policy
        if ( $user->hasRole('admin')  || $user->hasRole('owner') ) {
            return true;
        }
    }

    public function browse(){
        // Access is controlled at the row level depending on ownership or assignment
        return true;    
    }
    
    public function add(){
        // Experiments are generated only
        return false;
    }

    public function delete(){
        // Anyone can delete as long as it is viewable in browse mode based on view filtering
        return true;
    }

    public function edit(){
        // Anyone can delete as long as it is viewable in browse mode based on view filtering
        return true;
    }

    public function read(){
        // Anyone can read based on row access
        return true;
    }

    public function rowAccess(User $user, CctCollectionDatum $data){
        $allow = false;
        // Determine if the user can see this project based on role and/or assignment
        // Check the PI assignment
        $results = DB::select( DB::raw("
            SELECT * 
            FROM cct_collection_data AS d,
            experiments AS e
            WHERE d.experiment_id = e.id
            AND e.project_pi_id = '$user->id' 
            ") );
        if(count($results) > 0){
            $allow = true;
        }
        
        // Log::info('Project: ' . $data->project_id . ' User: ' . $user->id);
        
        // Check the user assignments
        $results = DB::select( DB::raw("
            SELECT * 
            FROM cct_collection_data AS d,
            experiments AS e,
            projects AS p,
            project_user AS pu
            WHERE d.experiment_id = e.id
            AND e.project_id = p.id
            AND p.id = pu.project_id
            AND pu.user_id = '$user->id' 
            AND d.experiment_id = '$data->experiment_id'
            ") );
        if(count($results) > 0){
            $allow = true;
        }

        // Check the collaborator assignments
        // Log::info('user_id: ' . $user->id . ' experiment-id: ' .$data->experiment_id );
        $results = DB::select( DB::raw("
            SELECT * 
            FROM cct_collection_data AS d,
            experiments AS e,
            projects AS p,
            project_collaborator AS pc
            WHERE d.experiment_id = e.id
            AND e.project_id = p.id
            AND p.id = pc.project_id
            AND pc.user_id = '$user->id' 
            AND d.experiment_id = '$data->experiment_id'
            ") );
        if(count($results) > 0){
            $allow = true;
        }
        return $allow;
    }
}