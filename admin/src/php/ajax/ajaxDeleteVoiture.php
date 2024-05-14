<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/VoitureDB.class.php';

try {
    $cnx = Connexion::getInstance($dsn, $user, $password);

    // Check if id_voiture is set in $_GET
    if(isset($_GET['id_voiture'])) {
        $voiture = new VoitureDB($cnx);
        // Call the deleteVoitureById method
        $data[] = $voiture->deleteVoitureById($_GET['id_voiture']);
        print json_encode($data);
    } else {
        throw new Exception("Missing id_voiture parameter in the URL.");
    }
} catch (Exception $e) {
    print json_encode($e->getMessage());
}
