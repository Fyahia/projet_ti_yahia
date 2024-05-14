<?php
// Toujours vérifier si on est connecté en tant qu'administrateur
if (!isset($_SESSION['admin']) || $_SESSION['admin'] != 1) {
    header('Location: index_.php?page=login.php');
    exit;
}
require_once 'C:\laragon\www\projet_ti_yahia\admin\src\php\db\dbPgConnect.php';
require_once 'C:\laragon\www\projet_ti_yahia\admin\src\php\classes\VoitureDB.class.php';
require_once 'C:\laragon\www\projet_ti_yahia\admin\src\php\classes\ClientDB.class.php';
require_once 'C:\laragon\www\projet_ti_yahia\admin\src\php\classes\VenteDB.php';





// Récupérer les voitures et les clients de la base de données
$voitureDB = new VoitureDB($cnx);
$voitures = $voitureDB->getAllCars();

$clientDB = new ClientDB($cnx);
$clients = $clientDB->getAllClients();

echo '<form method="POST">';
echo '<select name="voiture">'; // Liste des voitures
foreach ($voitures as $voiture) {
    echo '<option value="' . $voiture['id'] . '">' . $voiture['marque'] . ' ' . $voiture['modele'] . '</option>';
}
echo '</select>';

echo '<select name="client">'; // Liste des clients
foreach ($clients as $client) {
    echo '<option value="' . $client['id'] . '">' . $client['nom'] . ' ' . $client['prenom'] . '</option>';
}
echo '</select>';

echo '<input type="submit" value="Vendre voiture">';
echo '</form>';


// Si le formulaire a été soumis
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    var_dump($_POST);
    $id_voiture = $_POST['voiture'];
    $id_client = $_POST['client'];

    // Valider les données
    if (!isset($id_voiture) || $id_voiture === '' || !isset($id_client) || $id_client === '') {
    echo 'Veuillez sélectionner une voiture et un client.';
    exit;
}

    // Ajouter la vente à la base de données
    $venteDB = new VenteDB($cnx);
    $venteDB->addVente($id_voiture, $id_client);

    // Créer la facture en PDF
    $pdf = new TCPDF();
    $pdf->AddPage();
    $pdf->SetFont('Helvetica', '', 14);
    $pdf->Write(0, "Facture pour la vente de la voiture $id_voiture au client $id_client");
    $pdf->Output('facture.pdf', 'I');
    exit;
}

$venteDB = new VenteDB($cnx);
$ventes = $venteDB->getAllVentes();

foreach ($ventes as $vente) {
    echo 'Vente ID: ' . $vente['id_commande'] . ', Montant: ' . $vente['montant'] . ', Voiture ID: ' . $vente['id_voiture'] . ', Client ID: ' . $vente['id_client'] . '<br>';
}