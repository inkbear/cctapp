<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
// use Illuminate\Support\Facades\Log;

class Project extends Model
{
    public function isProjectTeam($user_id)
    {
        return $this->belongsToMany('App\User', 'project_users', 'project_id', 'user_id')->where('user_id', $user_id);
    }
}
