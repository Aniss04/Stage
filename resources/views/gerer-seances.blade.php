
@extends('layout')

@section('contenu')
<div id='id1'>
<?php
//pour fixer le timezone
setlocale(LC_TIME, 'fr_FR');
date_default_timezone_set('Europe/Paris');

$date_du_jour=date_create(request('date_du_jour'));
$j= date_format($date_du_jour,'w');

$semaine_suivante=utf8_encode(strftime('%Y-%m-%d', mktime(0, 0, 0, date_format($date_du_jour,'m'), date_format($date_du_jour,'d')+7, date_format($date_du_jour,'y'))));
$semaine_precedente=utf8_encode(strftime('%Y-%m-%d', mktime(0, 0, 0, date_format($date_du_jour,'m'), date_format($date_du_jour,'d')-7, date_format($date_du_jour,'y'))));

 ?>
</div>
<div>
<select onchange="actualiser()" id="id_salle">
  <?php
  for ($i=0; $i <count($salles) ; $i++) {
    print '<option >'.$salles[$i]->numero_salle.'</option>';
  }
  ?>
</select>
<button class="btn btn-primary" data-toggle="modal" data-target="#creerSeanceModal">Creer</button>

<a class="btn btn-primary" href="gerer-seances?date_du_jour=<?php print $semaine_precedente;?>">Precedent</a>
<a class="btn btn-primary" href="gerer-seances?date_du_jour=<?php print $semaine_suivante;?>">suivant</a>

</div>

<!-- Modal pour la creation d'une seance -->
<form action="{{ url('gerer-seances') }}" method="POST" enctype="multipart/form-data">
  @csrf
  <div class="modal fade" id="creerSeanceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Creer une seance</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body table-responsive ">
          <table>
            <tr>
              <td> Cours  </td>
              <td>
                <select name="id_cours">
                  <option></option>
                  <?php
                  for ($i=0; $i < count($cours) ; $i++) {
                    print '<option value ="'.$cours[$i]->id_cours.'">'.$cours[$i]->libelle_cours.'</option>';
                  }
                  ?>
                </select>
              </td>
            </tr>
            <tr>
              <td> Enseignant  </td>
              <td>
                <select name="id_enseignant">
                  <option></option>
                  <?php
                  for ($i=0; $i < count($enseignants) ; $i++) {
                    print '<option value ="'.$enseignants[$i]->id_individu.'">'.$enseignants[$i]->nom_individu.' '.$enseignants[$i]->prenom_individu.'</option>';
                  }
                  ?>
                </select>
              </td>
            </tr>
            <tr>
              <td> Salle  </td>
              <td>
                <select name="id_salle">
                  <option></option>
                  <?php
                  for ($i=0; $i < count($salles) ; $i++) {
                    print '<option value ="'.$salles[$i]->id_salle.'">'.$salles[$i]->numero_salle.'</option>';
                  }
                  ?>
                </select>
              </td>
            </tr>
            <tr>
              <td> Groupe  </td>
              <td>
                <select name="id_groupe">
                  <option></option>
                  <?php
                  for ($i=0; $i < count($groupes) ; $i++) {
                    print '<option value ="'.$groupes[$i]->id_groupe.'">'.$groupes[$i]->libelle_groupe.'</option>';
                  }
                  ?>
                </select>
              </td>
            </tr>
            <tr>
              <td> Durée  </td>
              <td>
                <input type="date" id="id_dateSeance" name="date_seance">
                <select onchange="dureeSeance()" id="id_debut" name="heure_debut_seance">
                  <?php
                  for ($i=8; $i < 22 ; $i++) {
                    print '<option value="'.$i.':00:00">'.$i.':00</option>';
                    print '<option value="'.$i.':30:00">'.$i.':30</option>';
                  }
                  ?>
                </select>
                 -
                <select id="id_fin" name="heure_fin_seance" onchange="afficher()">
                  <?php
                  for ($i=8; $i < 22 ; $i++) {
                    print '<option value="'.$i.':00:00">'.$i.':00</option>';
                    print '<option value="'.$i.':30:00">'.$i.':30</option>';
                  }
                  ?>
                </select>

               </td>
            </tr>


          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
          <input class="btn btn-success" type="submit" value="Créer">
        </div>
      </div>
    </div>
  </div>
</form>


<div class="table-responsive">
<table class="table table-bordered table-sm">
  <thead>
    <tr>
      <th scope="col">Heures</th>
      <?php
      $j= date_format($date_du_jour,'w');
      if($j==0){
        for ($i=6; $i >=0 ; $i--) {
          $d=utf8_encode(strftime('%A %d %B %Y', mktime(0, 0, 0, date_format($date_du_jour,'m'), date_format($date_du_jour,'d')-$i, date_format($date_du_jour,'y'))));
          print '<th scope="col">'.$d.'</th>';
        }

      }
      else {
        for ($i=$j-1; $i >=1 ; $i--) {

          $d=utf8_encode(strftime('%A %d %B %Y', mktime(0, 0, 0, date_format($date_du_jour,'m'), date_format($date_du_jour,'d')-$i, date_format($date_du_jour,'y'))));
          print '<th scope="col">'.$d.'</th>';
        }

        for ($k=0; $k <=7-$j; $k++) {

          $d=utf8_encode(strftime('%A %d %B %Y', mktime(0, 0, 0, date_format($date_du_jour,'m'), date_format($date_du_jour,'d')+$k, date_format($date_du_jour,'y'))));
          print '<th scope="col">'.$d.'</th>';
        }

      }
       ?>

    </tr>
  </thead>
  <tbody>
    <?php
    for ($i=8; $i < 22; $i++) {
      print '<tr>';
        print '<td>'.$i.'h00 - '.$i.'h30</td>';
        //la par exemple je suis ou
        print '<td> <input type="text" id="1_'.$i.'"> </td>';

        print '<td> <input type="text" id="2_'.$i.'"></td>';

        print '<td> <input type="text" id="3_'.$i.'"></td>';

        print '<td> <input type="text" id="4_'.$i.'"></td>';

        print '<td> <input type="text" id="5_'.$i.'"></td>';

        print '<td> <input type="text" id="6_'.$i.'"></td>';

        print '<td> <input type="text" id="0_'.$i.'"></td>';
      print '</tr>';
    }
     ?>
  </tbody>
</table
</div>
<div>

</div>



<script>

//pour definir la date et l'heure de l'utilisateur
Date.prototype.toDateInputValue = (function() {
    var local = new Date(this);
    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
    return local.toJSON().slice(0,10);
});
//par default, la date de la seance est la date du jour
document.getElementById('id_dateSeance').value = new Date().toDateInputValue();




function actualiser(){
  document.getElementById('id1').innerHTML="hahaha";
}


function dureeSeance(){
  var selectHeureFin= document.getElementById("id_fin");
  var heure=document.getElementById('id_debut').value;
  selectHeureFin.innerHTML='';
  var h;
  if(heure[1]==':')heure=heure[0];
  else heure=heure[0]+heure[1];



  for (i=parseInt(heure)+1; i < 22; i++) {
    var option1=document.createElement("option");
    var option2=document.createElement("option");
    option1.value=i+":00:00";
    option1.innerHTML=i+":00";
    option2.value=i+":30:00";
    option2.innerHTML=i+":30";
    selectHeureFin.appendChild(option1);
    selectHeureFin.appendChild(option2);
  }
}



//var d= new Date("2020-04-14 09:30:00");
//console.log(d.getDay());
var liste = @json($liste_seances_groupes);



function actualiser(){
  //je vide le tableau des données
  for (var i = 8; i < 22; i++) {
    document.getElementById("1_"+i).value='';
    document.getElementById("2_"+i).value='';
    document.getElementById("3_"+i).value='';
    document.getElementById("5_"+i).value='';
    document.getElementById("6_"+i).value='';
    document.getElementById("0_"+i).value='';
  }


  //console.log(document.getElementById('id_salle').value);
  for (var i = 0; i < liste.length; i++) {
    //si c'est la salle choisis, j'affiche les cours
    if (liste[i].numero_salle==document.getElementById('id_salle').value) {
      //je recupere le noumero du jour correspondant
      var dateDebut=new Date(liste[i].date_debut_seance);
      var dateFin=new Date(liste[i].date_fin_seance);
      var jour=dateDebut.getDay();

      //je recupere les heures
      var heureDebut=dateDebut.getHours();
      var heureFin=dateFin.getHours();

      for (var h = heureDebut; h <= heureFin; h++) {
        var id=jour+"_"+h;
        document.getElementById(id).value=liste[i].libelle_cours;
      }
    }
  }
}

actualiser();
console.log(liste);



</script>

@endsection
