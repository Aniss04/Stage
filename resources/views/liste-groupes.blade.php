@extends('layout')

@section('contenu')
<div class="container">
    <div class="card mt-4">
Selectionner le groupe :

<select id= "groupe" onchange="myFunction()">

  @foreach($listegroupes as $listegroupe)

  <option value= "{{ $listegroupe->id_groupe }}" > {{ $listegroupe->libelle_groupe }} </option>
  @endforeach
</select>

<script>
function myFunction() {
  var idGroupe = document.getElementById("groupe").value;
  var donnees = @json($listeindividu);
  document.getElementById("id_tableau").innerHTML='';
   var ligne1=document.createElement("tr");
   var colonne1=document.createElement("th");
   var colonne2=document.createElement("th");
   var colonne3=document.createElement("th");
   colonne1.innerHTML="id"
   colonne2.innerHTML="nom"
   colonne3.innerHTML="prenom"
   ligne1.appendChild(colonne1);
   ligne1.appendChild(colonne2);
   ligne1.appendChild(colonne3);
   document.getElementById("id_tableau").appendChild(ligne1);

  for (var i = 0; i < donnees.length; i++) {
 //on test si c'est le meme groupe
  if(donnees[i].id_groupe==idGroupe){
       //on creer une ligne
       var ligne2=document.createElement("tr");
        //on cerre les colonnes
      var colonne4=document.createElement("td");
      var colonne5=document.createElement("td");
      var colonne6=document.createElement("td");
      var colonne7=document.createElement("td");
      var check=document.createElement("input");
       //on remplie les colonne

        colonne4.innerHTML=donnees[i].id_individu
        colonne5.innerHTML=donnees[i].nom_individu
        colonne6.innerHTML=donnees[i].prenom_individu
        colonne7.innerHTML=donnees[i].id_groupe

        check.setAttribute("type","checkbox");
        check.name="choix[]"
        check.value=donnees[i].id_individu

       //on l'ajoute dans la ligne
        ligne2.appendChild(check);
        ligne2.appendChild(colonne4);
        ligne2.appendChild(colonne5);
        ligne2.appendChild(colonne6);
        ligne2.appendChild(colonne7);

      //on ajoute la ligne dans le tableau
       document.getElementById("id_tableau").appendChild(ligne2);
    }



}
      return choix;
}



</script>


</div><br>
<button class="btn btn-success" >Supprimer</button>
</div>


<div class="container">
    <div class="card mt-4">

      <div>
        <h3 class="">💻 Individus de Nanterre </h3>
      </div>

        <div class="table-responsive">
          <table id="id_tableau" class="table table-bordered table-striped">
            <tr>
              <th></th>
              <th>Numéro</th>
              <th>Nom</th>
              <th>Prénom</th>
            </tr>
             @foreach($listeindividu as $row)
       <tr>
        <td class="text-center" ><input type="checkbox" name="choix[]" value="{{$row->id_individu}}"></td>
        <td>{{ $row->id_individu }}</td>
        <td>{{ $row->nom_individu }}</td>
        <td>{{ $row->prenom_individu }}</td>
       </tr>
       @endforeach
          </table>
        </div>
      </div>
  </div>




@endsection
