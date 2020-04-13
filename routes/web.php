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
return view('welcome');
}
);


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

//Désinscrire des individus

Route::GET('desinscrire-individus','DesinscrireIndividusController@lister');
Route::POST('desinscrire-individus','DesinscrireIndividusController@retirer');

//formulaire de creation d'un groupe (Nfn)
Route::GET('creer-groupe','CreerGroupeController@formulaire');

//Creation d'un groupe (Nfn)
Route::POST('liste-groupes','CreerGroupeController@creer');

//affichage (liste) des groupes
Route::GET('liste-groupes','ListeGroupesController@liste');



/*partie chelson */
Route::GET('creer-groupe-seance','CreerSeanceGroupeController@afficher');
Route::POST('creer-groupe-seance','CreerSeanceGroupeController@creer');

Route::GET('liste-seance-groupe','CreerSeanceGroupeController@liste');
Route::POST('liste-seance-groupe','CreerSeanceGroupeController@modifierOuSuprimmer');

Route::GET('modifier-seance-groupe','CreerSeanceGroupeController@afficher');
Route::POST('modifier-seance-groupe','CreerSeanceGroupeController@modifierInsertion');
