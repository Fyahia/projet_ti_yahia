<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/CommandeDB.class.php';

$cnx = Connexion::getInstance($dsn, $user, $password);


$commande = new CommandeDB($cnx);
$data[] = $commande->ajoutCommande($_GET['id_client'], $_GET['id_voiture'], $_GET['montant']);
print json_encode($data);
?>
