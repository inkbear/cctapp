<?php

namespace App\Policies;

use App\User;
use App\Link;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

use Illuminate\Auth\Access\HandlesAuthorization;

class LinkPolicy
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

    public function rowAccess(User $user, Link $link){
        $allow = false;
        // Determine if the user can see this project based on role and/or assignment
        // Check the PI assignment
        $results = DB::select( DB::raw("
            SELECT * 
            FROM links AS l,
            experiments AS e
            WHERE l.experiment_id = e.id
            AND e.project_pi_id = '$user->id' 
            ") );
        if(count($results) > 0){
            $allow = true;
        }
        
        // Log::info('Project: ' . $link->project_id . ' User: ' . $user->id);
        
        // Check the user assignments
        $results = DB::select( DB::raw("
            SELECT * 
            FROM links AS l,
            experiments AS e,
            projects AS p,
            project_user AS pu
            WHERE l.experiment_id = e.id
            AND e.project_id = p.id
            AND p.id = pu.project_id
            AND pu.user_id = '$user->id' 
            AND l.experiment_id = '$link->experiment_id'
            ") );
        if(count($results) > 0){
            $allow = true;
        }

        // Check the collaborator assignments

        $results = DB::select( DB::raw("
            SELECT * 
            FROM links AS l,
            experiments AS e,
            projects AS p,
            project_collaborator AS pc
            WHERE l.experiment_id = e.id
            AND e.project_id = p.id
            AND p.id = pc.project_id
            AND pc.user_id = '$user->id' 
            AND l.experiment_id = '$link->experiment_id'
            ") );
        if(count($results) > 0){
            $allow = true;
        }
        return $allow;
    }
}