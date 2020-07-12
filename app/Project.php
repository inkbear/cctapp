<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;
// Log::info('Fruit Bat');

class Project extends Model
{   
    // public function isProjectTeam($user_id)
    // {
    //     // Deliver user details for users added to this project as team members
    //     return $this->belongsToMany('App\User', 'project_user', 'project_id', 'user_id')->where('user_id', $user_id);
    // }
    
    // public function isProjectCollaborator($user_id)
    // {
    //     // Deliver user details for users added to this project as collaborators
    //     return $this->belongsToMany('App\User', 'project_collaborator', 'project_id', 'user_id')->where('user_id', $user_id);
    // }

    // public function scopeCurrentUser()
    // {
    //     Log::info('Peaches');
    //     // return 'Apricot';
    //     // return $query->where('id', '=', '1');
    //     // return $query->where('pi_id', Auth::user()->id);
    // }

}
