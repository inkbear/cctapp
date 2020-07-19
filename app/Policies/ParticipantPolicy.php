<?php

namespace App\Policies;

use App\User;
use App\Participant;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

use Illuminate\Auth\Access\HandlesAuthorization;

class ParticipantPolicy
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
        // General browsing is controlled by BREAD roles
        return true;    
    }
    
    public function add(User $user){
        // PI, Collab, Staff add participants 
        if(  $user->hasRole('pi') ||  $user->hasRole('collab') || $user->hasRole('staff') ){
            return true;
        }
        return false;
    }

    public function delete(User $user, Participant $participant){
        // Controls visiblity of the row in BROWSE mode based on multiple additive criteria
        return $this->visiblityAll($user, $participant);
    }

    public function edit(User $user, Participant $participant){        
        // Controls visiblity of the row in BROWSE mode based on multiple additive criteria
        return $this->visiblityAll($user, $participant);
    }

    public function read(User $user, Participant $participant){
        // Controls visiblity of the row in BROWSE mode based on multiple additive criteria
        return $this->visiblityAll($user, $participant);
    }

    public function rowAccessParticipant(User $user, Participant $participant){
        // Controls visiblity of the row in BROWSE mode based on multiple additive criteria
        return $this->visiblityAll($user, $participant);
    }

    private function visiblityAll(User $user, Participant $participant){
                // Controls visiblity of the row in BROWSE mode based on multiple additive criteria
                $allow = false;

                // The original submitter has access to make corrections
                if( $participant->added_by == $user->id ){
                    $allow = true;
                }
        
                // The owner of the assigned cohort also has access
                $sql = "SELECT s.id, c.id
                FROM participants AS s,
                cohorts AS c
                WHERE c.id = s.cohort_id
                AND c.owner_id = '$user->id' 
                AND s.id = '$participant->id'
                ";
                $results = DB::select( DB::raw("$sql") );
                if(count($results) > 0){
                    $allow = true;
                }
        
                // The PI of a project the participant/cohort is assigned to has access
                $sql = "SELECT s.id, p.pi_id
                FROM participants AS s
                INNER JOIN cohorts AS c ON s.cohort_id = c.id  
                INNER JOIN cohort_project AS cp ON c.id = cp.cohort_id  
                INNER JOIN projects AS p ON cp.project_id = p.id 
                WHERE p.pi_id = '$user->id' 
                AND s.id = '$participant->id'
                ";
                $results = DB::select( DB::raw("$sql") );
                if(count($results) > 0){
                    $allow = true;
                }
        
                // The Collaborator of a project the participant/cohort is assigned to has access
                $sql = "SELECT s.id, pc.user_id
                FROM participants AS s
                INNER JOIN cohorts AS c ON s.cohort_id = c.id  
                INNER JOIN cohort_project AS cp ON c.id = cp.cohort_id  
                INNER JOIN projects AS p ON cp.project_id = p.id 
                INNER JOIN project_collaborator AS pc ON p.id = pc.project_id
                WHERE pc.user_id = '$user->id' 
                AND s.id = '$participant->id'
                ";
                $results = DB::select( DB::raw("$sql") );
                if(count($results) > 0){
                    $allow = true;
                }
        
                // The Staff of a project the participant/cohort is assigned to has access
                $sql = "SELECT s.id, pu.user_id
                FROM participants AS s
                INNER JOIN cohorts AS c ON s.cohort_id = c.id  
                INNER JOIN cohort_project AS cp ON c.id = cp.cohort_id  
                INNER JOIN projects AS p ON cp.project_id = p.id 
                INNER JOIN project_user AS pu ON p.id = pu.project_id
                WHERE pu.user_id = '$user->id' 
                AND s.id = '$participant->id'
                ";
                $results = DB::select( DB::raw("$sql") );
                if(count($results) > 0){
                    $allow = true;
                }
        
                return $allow;
    }

}