@extends('layout')

@section('contenu')


<form action="supprimer" method="POST" >
{{ csrf_field ()}}

<div class="card mx-auto " style="width: 50rem;">
  <div class="card-body">
Selectionner le groupe :

<select name="groupe1">

  @foreach($listegroupes as $listegroupe)

  <option value= "{{ $listegroupe->id_groupe }}" > {{ $listegroupe->libelle_groupe }} </option>
  @endforeach
</select>

<br>

<button class="btn btn-success">Supprimer</button>
</div>

</div>
</form>
@endsection