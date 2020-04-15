<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;

class CreerGroupeController extends Controller
{
  public function creer(Request $request)
  {

    //insertion dans la table Groupes
    DB::table('Groupe')
      ->updateOrInsert([
      'fid_formation' => request('formation'),
      'fid_modalite' => request('modalite'),
      'libelle_groupe' => request('libelle'),
      'fid_niveau' => request('niveau')]);

 
    return view('accueil');
  }

  public function formulaire()
  {
    //je recupere toutes les formations, avec leurs niveaux et leurs composantes
    $formations=DB::table('Formation')
    ->get();
    $modalites=DB::table('modalite')
    ->get();
    $niveaux =DB::table('niveau')
    ->get();

    

    return view('creer-groupe',compact('formations','modalites','niveaux'));
  }
}
