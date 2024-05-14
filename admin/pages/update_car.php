<?php
require_once 'C:\laragon\www\projet_ti_yahia\admin\src\php\db\dbPgConnect.php';
require_once 'C:\laragon\www\projet_ti_yahia\admin\src\php\classes\VoitureDB.class.php';

echo 'update_car.php est correctement appele';
if(isset($cnx)) {
    // Créer une instance de VoitureDB
    $voitureDB = new VoitureDB($cnx);

    // Récupérer les données du formulaire
    $id_voiture = $_POST['id_voiture'];
    $marque = $_POST['marque'];
    $modele = $_POST['modele'];
    $annee = $_POST['annee'];
    $couleur = $_POST['couleur'];
    $prix = $_POST['prix'];
    $kilometrage = $_POST['kilometrage'];
    $carburant = $_POST['carburant'];
    $type_boite = $_POST['type_boite'];

    // Mettre à jour la voiture dans la base de données
    $voitureDB->updateCar($id_voiture, $marque, $modele, $annee, $couleur, $prix, $kilometrage, $carburant, $type_boite);
} else {
    echo 'La connexion à la base de données a échoué.';
}
?>