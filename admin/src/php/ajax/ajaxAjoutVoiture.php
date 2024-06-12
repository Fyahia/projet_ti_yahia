<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/VoitureDB.class.php';

$cnx = Connexion::getInstance($dsn, $user, $password);

$voiture = new VoitureDB($cnx);
$data[] = $voiture->ajout_voiture($_GET['marque'], $_GET['modele'], $_GET['annee'], $_GET['couleur'], $_GET['prix'], $_GET['kilometrage'], $_GET['carburant'], $_GET['type_boite'], $_GET['image']);
print json_encode($data);
?>