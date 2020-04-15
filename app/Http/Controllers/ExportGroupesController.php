<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ExportGroupes;
use DB;


class ExportGroupesController extends Controller
{
	public function afficher()
	{
		return view('export-groupes');
	}
	public function export()
	{
		$nom_fichier=request('nom_fichier');
	    $nom_fichier.=".xls";
	    return Excel::download(new ExportGroupes, $nom_fichier);
	    return view('accueil');
	}
}
