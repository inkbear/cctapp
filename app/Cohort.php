<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;
// use Auth;

class Cohort extends Model
{
    // Scope functions only seem to work with top level BREAD items - not field level.
    // public function scopeCurrentUser($query)
    // {
    //     Log::info('Scope Called');
    //     return $query->where('owner_id', Auth::user()->id);
    // }
}
