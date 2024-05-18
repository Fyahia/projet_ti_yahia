<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/VoitureDB.class.php';

try {
    $cnx = Connexion::getInstance($dsn, $user, $password);

    // Vérifiez si les données GET sont définies
    if (isset($_GET['id_voiture'], $_GET['marque'], $_GET['modele'], $_GET['annee'], $_GET['couleur'], $_GET['prix'], $_GET['kilometrage'], $_GET['carburant'], $_GET['type_boite'])) {
        // Vérifiez si le paramètre image est défini
        $image = isset($_GET['image']) ? trim($_GET['image']) : null;

        // Valider et nettoyer les entrées
        $id_voiture = intval($_GET['id_voiture']);
        $marque = trim($_GET['marque']);
        $modele = trim($_GET['modele']);
        $annee = intval($_GET['annee']);
        $couleur = trim($_GET['couleur']);
        $prix = floatval($_GET['prix']);
        $kilometrage = intval($_GET['kilometrage']);
        $carburant = trim($_GET['carburant']);
        $type_boite = trim($_GET['type_boite']);

        // Assurez-vous que les valeurs nécessaires ne sont pas nulles ou invalides
        if ($id_voiture > 0 && !empty($marque) && !empty($modele) && $annee > 0 && !empty($couleur) && $prix > 0 && $kilometrage >= 0 && !empty($carburant) && !empty($type_boite)) {
            $voiture = new VoitureDB($cnx);
            // METHODE DE MISE A JOUR SPECIFIQUE
            $data = $voiture->updateVoiture($id_voiture, $marque, $modele, $annee, $couleur, $prix, $kilometrage, $carburant, $type_boite, $image);
            print json_encode($data);
        } else {
            throw new Exception("Invalid parameters: Check if all required fields are filled and valid.");
        }
    } else {
        throw new Exception("Missing parameters in the URL.");
    }
} catch (Exception $e) {
    print json_encode(['error' => $e->getMessage()]);
}
?>
