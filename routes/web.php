<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Log;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Example of the most basic route calling a view without going through a controller
// Route::get('/', function () {
//     return view('welcome');
// });
// This does the same thing but uses the view command instead of the server verb
// Route::view('/', 'welcome');

// This is the unprotected front end for access to the CCT
// Users are authenticated with a simple token in the URL
Route::get('cct', 'CctController@index', function () {
    return view('cct'); 
});

// Data collections for the AJAX call
Route::any('data_catcher', 'CctDataController@index', function () {
    return; 
});

// Make the root page route to the login for now. No public pages yet.
Route::get('/', function () {
    return redirect()->intended('admin');
})->middleware('auth');

// May not need this if all the protected routes are going through admin
Auth::routes();

// This fixes an issue in Laravel with doing a get rather than post when logging out.
Route::get('logout', 'Auth\LoginController@logout', function () {
    //return abort(404);
    return view('login'); // Seems mo betta
});

// Adding in all the Voyager routes which are applied for anything under /admin
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
