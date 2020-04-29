<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;

class CreerGroupeController extends Controller
{

  
  public function creer(Request $request)
  {

    if(request('btn')=="creer")
{
    //insertion dans la table Groupes
    DB::table('groupe')
      ->updateOrInsert([
      'fid_formation' => request('formation'),
      'fid_modalite' => request('modalite'),
      'libelle_groupe' => request('libelle'),
      'fid_niveau' => request('niveau'),
      'commentaire' => request('commentaire') ]);

 }
 // Creation de groupe de groupe
elseif (request('btn')=="fusion") {
  
$liste= DB::table('groupe_individu')
        ->where([['fid_groupe',request('grp1')],['annee',request('annee')]])
        ->orWhere([['fid_groupe',request('grp2')],['annee',request('annee')]])

        ->select('fid_individu')
        ->get();

$niveau= DB::table('groupe')
        ->where('id_groupe',request('grp1'))
        ->get();



foreach ($niveau as $nv) {
                $niveaux = $nv->fid_niveau;
            }


    DB::table('groupe')
      ->updateOrInsert([
      'libelle_groupe' => request('libelle2'),
      'fid_niveau' => $niveaux,
      'commentaire' => request('commentaire2') ]);

$id=  DB::table('groupe')
      ->where('libelle_groupe',request('libelle2'))
      ->select('id_groupe')
      ->get();

foreach ($id as $ids) {
                $id1 = $ids->id_groupe;
            }


for($i=0;$i<count($liste);$i++)
{
foreach ($liste as $ls) {
                $listes[] = $ls->fid_individu;
            }
}

    for($i=0;$i<count($listes);$i++)
{
  DB::table('groupe_individu')
      
      ->updateOrInsert([
      'fid_groupe' => $id1,
      'fid_individu' => $listes[$i],
      'annee' => request('annee')
    ]);
}
}

  header ('Location: /creer-groupe');
  exit();
  }





  public function formulaire()
  {
    //je recupere toutes les formations, avec leurs niveaux et leurs composantes
    $formations=DB::table('formation')
    ->get();
    $modalites=DB::table('modalite')
    ->get();
    $niveaux =DB::table('niveau')
    ->get();

    $groupe=DB::table('groupe')
    ->get();

    $annee=DB::table('groupe_individu')
           ->select('annee')
           ->distinct()
           ->get();
    

    return view('creer-groupe',compact('formations','modalites','niveaux','groupe','annee'));
  }
}
