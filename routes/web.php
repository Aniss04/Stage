<?php

use Illuminate\Support\Facades\Route;

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


Route::get('/', function () {
    return view('accueil');
});



//importation des groupes (Nfn)
Route::GET('import-groupes','ImportGroupesController@afficher');
Route::POST('import-groupes','ImportGroupesController@import');

//importation des individus (Nfn)
Route::GET('import-individus','ImportIndividusController@afficher');
Route::POST('import-individus','ImportIndividusController@import');

//Exportation des individus
Route::GET('export-individus','ExportIndividusController@afficher');
Route::POST('export-individus','ExportIndividusController@export');

//Exportation des groupes (Nfn)
Route::GET('export-groupes','ExportGroupesController@afficher');
Route::POST('export-groupes','ExportGroupesController@export');

//Inscription des individus
Route::GET('inscrire-individus','InscrireIndividusController@inscrire');
Route::POST('inscrire-individus','InscrireIndividusController@ajouter');


//formulaire de creation d'un groupe (Nfn)
Route::GET('creer-groupe','CreerGroupeController@formulaire');

//Creation d'un groupe (Nfn)
Route::POST('liste-groupes','CreerGroupeController@creer');

//affichage (liste) des groupes
Route::GET('liste-groupes','ListeGroupesController@liste');

//Gerer les seances (Nfn)
Route::GET('gerer-seances','GererSeancesController@afficher');
Route::POST('gerer-seances','GererSeancesController@creer');
