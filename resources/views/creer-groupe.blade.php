@extends('layout')

@section('contenu')

<br>
<div class="card mx-auto " style="width: 50rem;">
  <div class="card-body">
    <form action="liste-groupes" method="POST" >
      {{ csrf_field ()}}
      
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="niveau">Niveau</label>
          <select class="form-control" name="niveau" id="niveau">
          
          @foreach($niveaux as $niveau)

          <option value= "{{ $niveau->id_niveau }}" > {{ $niveau->libelle_niveau }} </option>
          
          @endforeach

        </select>
        </div>
        <div class="form-group col-md-6">
          <label for="formation">Formation</label>
          <select class="form-control" name="ufr" id="ufr">
          
          @foreach($formations as $formation)

          <option value= "{{ $formation->id_formation }}" > {{ $formation->code_formation }} </option>
          
          @endforeach

        </select>
        </div>

        </div>
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="modalite">Modalité</label>
          <select class="form-control" name="ufr" id="ufr">
          
          @foreach($modalites as $modalite)

          <option value= "{{ $modalite->id_modalite }}" > {{ $modalite->libelle_modalite }} </option>
          
          @endforeach

        </select>
        </div>

        
        </div>
      <button type="submit" class="btn btn-info">Créer le groupe</button>
      </div>
    </form>
  </div>
</div>
<div id="div">


</div>

<br>
<div class="card mx-auto " style="width: 50rem;">
  <div class="card-body">
    <form action="liste-groupes" method="POST" >
      {{ csrf_field ()}}
      
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="modalite">Groupe 1</label>
          <select class="form-control" name="niveau" id="niveau">
          
          @foreach($niveaux as $niveau)

          <option value= "{{ $niveau->id_niveau }}" > {{ $niveau->libelle_niveau }} </option>
          
          @endforeach

        </select>
        </div>
        <div class="form-group col-md-6">
          <label for="Groupe 2">Groupe 2</label>
          <select class="form-control" name="ufr" id="ufr">
          
          @foreach($formations as $formation)

          <option value= "{{ $formation->id_formation }}" > {{ $formation->code_formation }} </option>
          
          @endforeach

        </select>
        </div>


        
        </div>
      <button type="submit" class="btn btn-info">Créer le groupe</button>
      </div>
    </form>
  </div>
</div>
<div id="div">


</div>








@endsection
