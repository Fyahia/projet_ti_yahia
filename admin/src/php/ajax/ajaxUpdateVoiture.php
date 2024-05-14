<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/VoitureDB.class.php';

try {
    $cnx = Connexion::getInstance($dsn, $user, $password);


    if(isset($_GET['id_voiture'], $_GET['marque'], $_GET['modele'], $_GET['annee'], $_GET['couleur'], $_GET['prix'], $_GET['kilometrage'], $_GET['carburant'], $_GET['type_boite'])) {
        $voiture = new VoitureDB($cnx);
        //METHODE DE MISE A JOUR SPECIFIQUE
        $data[] = $voiture->updateVoiture($_GET['id_voiture'], $_GET['marque'], $_GET['modele'], $_GET['annee'], $_GET['couleur'], $_GET['prix'], $_GET['kilometrage'], $_GET['carburant'], $_GET['type_boite']);
        print json_encode($data);
    } else {
        throw new Exception("Missing parameters in the URL.");
    }
} catch (Exception $e) {
    print json_encode($e->getMessage());
}