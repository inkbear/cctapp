<?php

namespace App\Policies;

use App\User;
use App\Project;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

use Illuminate\Auth\Access\HandlesAuthorization;

class ProjectPolicy
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
        // These folks get to skip over the rest of the poicy
        if ( $user->hasRole('admin')  || $user->hasRole('owner') ) {
            return true;
        }
    }

    public function browse(){
        // Access is controlled at the row level depending on ownership or assignment
        return true;    
    }
    
    public function add(User $user){
        // PI adds projects
        if(  $user->hasRole('pi')  ){
            return true;
        }
        return false;
    }

    public function delete(User $user, Project $project){
        // PI can delete their own projects
        if( $project->pi_id == $user->id ){
            return true;
        }
        return false;
    }

    public function edit(User $user, Project $project){
        $allow = false;
        // PI and collab can edit their own projects
        if( $project->pi_id == $user->id ){
            $allow = true;
        }
        // Check the collaborator assignments
        $results = DB::select( DB::raw("SELECT * FROM project_collaborator WHERE user_id = '$user->id' AND project_id = '$project->id'") );
        if(count($results) > 0){
            $allow = true;
        }
        return $allow;
    }

    public function read(User $user, Project $project){
        // Access is controlled at the row level depending on ownership or assignment
        // Certain roles can view their own projects
        if( $project->pi_id == $user->id ){
            return true;
        }
        return false;
    }

    public function rowAccess(User $user, Project $project){
        $allow = false;
        // Determine if the user can see this project based on role and/or assignment
        if( $project->pi_id == $user->id ){
            $allow = true;
        }
        // Check the user assignments
        $results = DB::select( DB::raw("SELECT * FROM project_user WHERE user_id = '$user->id' AND project_id = '$project->id'") );
        if(count($results) > 0){
            $allow = true;
        }
        // Check the collaborator assignments
        $results = DB::select( DB::raw("SELECT * FROM project_collaborator WHERE user_id = '$user->id' AND project_id = '$project->id'") );
        if(count($results) > 0){
            $allow = true;
        }
        return $allow;
    }

    public function piOnlyFieldAccess(User $user, Project $project){
        // Edit access is already filtered - see above
        $allow = false;
        // Determine if the user has read only or read/write for the project fields.
        if( $project->pi_id == $user->id ){
            $allow = true;
        }
        return $allow;
    }

}