<?php

namespace App\Policies;

use App\User;
use App\Cohort;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

use Illuminate\Auth\Access\HandlesAuthorization;

class CohortPolicy
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
    
    public function add(User $user){
        // PI adds cohorts
        if(  $user->hasRole('pi')  ){
            return true;
        }
        return false;
    }

    public function delete(User $user, Cohort $cohort){
        // PI can delete their own cohorts
        if( $cohort->owner_id == $user->id ){
            return true;
        }
        return false;
    }

    public function edit(User $user, Cohort $cohort){
        $allow = false;
        // PI and collab can edit their own cohorts
        if( $cohort->owner_id == $user->id ){
            $allow = true;
        }

        // Check the collaborator assignments
        // $sql = "SELECT p.*, u.*
        // FROM cohorts AS c,
        // cohort_project AS cp,
        // projects AS p,
        // project_collaborator AS pc,
        // users AS u
        // WHERE c.id = cp.cohort_id
        // AND cp.project_id = p.id
        // AND p.id = pc.project_id
        // AND pc.user_id = u.id
        // AND u.id = '$user->id' 
        // AND cohort_id = '$cohort->id'
        // ";

        // $results = DB::select( DB::raw("$sql") );
        // if(count($results) > 0){
        //     $allow = true;
        // }

        return $allow;
    }

    public function read(User $user, Cohort $cohort){
        // Access is controlled at the row level depending on ownership or assignment

        $allow = false;
        // PI and collab can edit their own cohorts
        if( $cohort->owner_id == $user->id ){
            $allow = true;
        }

        // Check the collaborator assignments
        $sql = "SELECT p.*, u.*
        FROM cohorts AS c,
        cohort_project AS cp,
        projects AS p,
        project_collaborator AS pc,
        users AS u
        WHERE c.id = cp.cohort_id
        AND cp.project_id = p.id
        AND p.id = pc.project_id
        AND pc.user_id = u.id
        AND u.id = '$user->id' 
        AND cohort_id = '$cohort->id'
        ";

        $results = DB::select( DB::raw("$sql") );
        if(count($results) > 0){
            $allow = true;
        }

        return $allow;
    }

    public function ownsCohort(User $user, Cohort $cohort){
        $allow = false;
        // Determine if the user cowns this cohort
        if( $cohort->owner_id == $user->id ){
            $allow = true;
        }
    }

    public function rowAccessCohort(User $user, Cohort $cohort){
        $allow = false;
        // Determine if the user can see this cohort based on role and/or assignment
        if( $cohort->owner_id == $user->id ){
            $allow = true;
        }
        // Log::info($cohort->owner_id  . ' == ' .  $user->id);

        // Check the user assignments
        // $sql = "SELECT p.id, c.id, u.id
        // FROM cohorts AS c,
        // cohort_project AS cp,
        // projects AS p,
        // project_user AS pu,
        // users AS u
        // WHERE c.id = cp.cohort_id
        // AND cp.project_id = p.id
        // AND p.id = pu.project_id
        // AND pu.user_id = u.id
        // AND u.id = '$user->id' 
        // AND cohort_id = '$cohort->id'
        // ";

        // $results = DB::select( DB::raw("$sql") );
        // if(count($results) > 0){
        //     $allow = true;
        // }

        // Check the collaborator assignments
        $sql = "SELECT p.id, c.id, u.id
        FROM cohorts AS c,
        cohort_project AS cp,
        projects AS p,
        project_collaborator AS pc,
        users AS u
        WHERE c.id = cp.cohort_id
        AND cp.project_id = p.id
        AND p.id = pc.project_id
        AND pc.user_id = u.id
        AND u.id = '$user->id' 
        AND cohort_id = '$cohort->id'
        ";

        $results = DB::select( DB::raw("$sql") );
        if(count($results) > 0){
            $allow = true;
        }

        return $allow;
    }

    public function piOnlyFieldAccess(User $user, Cohort $cohort){
        return true;
        // Edit access is already filtered - see above
        $allow = false;
        // Determine if the user has read only or read/write for the cohort fields.
        if( $cohort->owner_id == $user->id ){
            $allow = true;
        }
        return $allow;
    }

}