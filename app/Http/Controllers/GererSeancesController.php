<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class GererSeancesController extends Controller
{
  public function afficher()
  {
    setlocale(LC_TIME, 'fr_FR');
    date_default_timezone_set('Europe/Paris');

    //je recupere la date du jour
    $date_du_jour=date_create(request('date_du_jour'));
    $j= date_format($date_du_jour,'w');
    $diff=7-$j;

    if($j==0){
      $debutSemaine=utf8_encode(strftime('%Y-%m-%d 00:00:00', mktime(0, 0, 0, date_format($date_du_jour,'m'), date_format($date_du_jour,'d')-6, date_format($date_du_jour,'y'))));
      $finSemaine=utf8_encode(strftime('%Y-%m-%d 23:59:59', mktime(0, 0, 0, date_format($date_du_jour,'m'), date_format($date_du_jour,'d'), date_format($date_du_jour,'y'))));
    }
    else{
      $debutSemaine=utf8_encode(strftime('%Y-%m-%d 00:00:00', mktime(0, 0, 0, date_format($date_du_jour,'m'), date_format($date_du_jour,'d')-$j+1, date_format($date_du_jour,'y'))));
      $finSemaine=utf8_encode(strftime('%Y-%m-%d 23:59:59', mktime(0, 0, 0, date_format($date_du_jour,'m'), date_format($date_du_jour,'d')+$diff, date_format($date_du_jour,'y'))));
    }

    $cours=DB::table('Cours')->get();

    $salles=DB::table('Salle')
    ->JOIN('Seance','Seance.fid_salle','=','Salle.id_salle')
    ->get();

    $groupes=DB::table('Groupe')->get();

    $enseignants=DB::table('individu')
    ->WHERE('annuaire','=',1)
    ->get();

    $liste_seances_groupes=DB::table('Salle')
    ->JOIN ('Seance','Seance.fid_salle','=','Salle.id_salle')
    ->JOIN ('Type_Seance','Type_Seance.id_type_seance','=','Seance.fid_type_seance')
    ->JOIN ('Seance_Groupe','Seance_Groupe.fid_seance','=','Seance.id_seance')
    ->JOIN ('Cours','Cours.id_cours','=','Seance_Groupe.fid_cours')
    ->JOIN ('individu','individu.id_individu','=','Seance_Groupe.fid_individu')
    ->JOIN ('Groupe','Seance_Groupe.fid_groupe','=','Groupe.id_groupe')
    ->whereBetween('date_debut_seance', [$debutSemaine, $finSemaine])
    ->orderBy('Salle.numero_salle','desc')
    ->orderBy('date_debut_seance','asc')
    ->get();


    return view('gerer-seances',compact('liste_seances_groupes','cours','salles','groupes','enseignants'));
  }

  public function creer()
  {
    //pour la création
    if(!empty(request('creer'))){
      //je recupere l'id de la seance grace au numéro de la salles
      $id_seance=DB::table('Seance')
      ->WHERE('fid_salle','=',request('id_salle'))
      ->take(1)
      ->value('id_seance');

      //je recupere puis concatene les dates (date debut & date fin)
      $date_debut=request('date_seance')." ".request('heure_debut_seance');
      $date_fin=request('date_seance')." ".request('heure_fin_seance');

      //j'enregistre dans la BDD, dans la table Seance_Groupe
      DB::table('Seance_Groupe')
      ->updateOrInsert(['fid_seance'=>$id_seance,'fid_groupe'=>request('id_groupe'),'fid_individu'=>request('id_enseignant'),
      'fid_cours'=>request('id_cours'),'date_debut_seance'=>$date_debut,'date_fin_seance'=>$date_fin],
      ['fid_seance'=>$id_seance,'fid_groupe'=>request('id_groupe'),'fid_individu'=>request('id_enseignant'),
      'fid_cours'=>request('id_cours'),'date_debut_seance'=>$date_debut,'date_fin_seance'=>$date_fin]);
    }

    //pour la suppression
    if(!empty(request('supprimer'))){


      DB::table('Seance_Groupe')
      ->where('fid_seance', '=', request('fid_seance'))
      ->where('fid_groupe', '=', request('fid_groupe'))
      ->where('fid_individu', '=', request('fid_individu'))
      ->where('fid_cours', '=', request('fid_cours'))
      ->where('date_debut_seance', '=', request('date_debut_seance'))
      ->where('date_fin_seance', '=', request('date_fin_seance'))
      ->delete();


      //echo "date du jour : ".request('date_du_jour');
      $date_du_jour=request('date_du_jour');


      header ('Location: ?date_du_jour='.$date_du_jour.'&msg=supprime_seance');
      exit();

    }

    return view('accueil');
  }

}
