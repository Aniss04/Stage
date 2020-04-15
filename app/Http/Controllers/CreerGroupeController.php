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

 
    header ('Location: /creer-groupe');
  exit();
  }

/*
// Creation de groupe de groupe
 public function fusion()
  {


      DB::table('association_groupe')
      ->updateOrInsert([
      'fid_groupe_1' => request('grp1'),
      'fid_groupe_2' => request('grp2')]);


  }
*/
  public function formulaire()
  {
    //je recupere toutes les formations, avec leurs niveaux et leurs composantes
    $formations=DB::table('Formation')
    ->get();
    $modalites=DB::table('modalite')
    ->get();
    $niveaux =DB::table('niveau')
    ->get();

    $groupe=DB::table('groupe')
    ->get();

    $annee=DB::table('groupe_individu')
    ->get();
    

    return view('creer-groupe',compact('formations','modalites','niveaux','groupe','annee'));
  }
}
