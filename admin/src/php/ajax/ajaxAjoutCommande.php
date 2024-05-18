<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/CommandeDB.class.php';

$response = [];

try {
    $cnx = Connexion::getInstance($dsn, $user, $password);

    if (isset($_GET['id_client'], $_GET['id_voiture'], $_GET['montant'])) {
        $id_client = intval($_GET['id_client']);
        $id_voiture = intval($_GET['id_voiture']);
        $montant = floatval($_GET['montant']);

        $commande = new CommandeDB($cnx);
        $success = $commande->ajoutCommande($id_client, $id_voiture, $montant);

        if ($success) {
            $response = ['success' => true, 'message' => 'Commande ajoutée avec succès.'];
        } else {
            $response = ['success' => false, 'message' => 'Échec de l\'ajout de la commande.'];
        }
    } else {
        $response = ['success' => false, 'message' => 'Paramètres manquants.'];
    }
} catch (Exception $e) {
    $response = ['success' => false, 'message' => 'Erreur: ' . $e->getMessage()];
}

echo json_encode($response);
?>
