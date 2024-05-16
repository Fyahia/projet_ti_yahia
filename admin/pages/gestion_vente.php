<h2>Gestion des commandes</h2>

<?php
// Création d'une instance de la classe CommandeDB
$commandes = new CommandeDB($cnx);
// Création d'une instance de la classe VoitureDB
$voitures = new VoitureDB($cnx);
// Création d'une instance de la classe ClientDB
$clients = new ClientDB($cnx);

// Récupération de toutes les commandes
$liste = $commandes->getAllCommandes();
$nbr = count($liste);

if ($nbr == 0) {
    print "<br>Aucune commande enregistrée<br>";
} else {
    ?>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Id Commande</th>
            <th scope="col">Montant</th>
            <th scope="col">Détails Voiture</th>
            <th scope="col">Détails Client</th>
        </tr>
        </thead>
        <tbody>
        <?php
        for ($i = 0; $i < $nbr; $i++) {
            $voiture = $voitures->getVoitureById($liste[$i]['id_voiture']);
            $client = $clients->getClientById($liste[$i]['id_client']);
            ?>
            <tr>
                <th><?= $liste[$i]['id_commande']; ?></th>
                <td><?= $liste[$i]['montant']; ?></td>
                <td><?= $voiture['marque'] . ' ' . $voiture['modele']; ?></td> <!-- Affiche la marque et le modèle de la voiture -->
                <td><?= $client['nom'] . ' ' . $client['prenom']; ?></td> <!-- Affiche le nom et le prénom du client -->
            </tr>
            <?php
        }
        ?>
        </tbody>
    </table>
    <?php
}
?>

<h2>Ajout d'une commande</h2>

<div class="container">
    <form id="form_ajout" method="post" action="ajout_commande.php">
        <div class="mb-3">
            <label for="id_client" class="form-label">Client</label>
            <select class="form-control" id="id_client" name="id_client" required>
                <?php
                $allClients = $clients->getAllClients();
                foreach ($allClients as $client) {
                    echo "<option value='{$client['id_client']}'>{$client['nom']} {$client['prenom']}</option>";
                }
                ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="id_voiture" class="form-label">Voiture</label>
            <select class="form-control" id="id_voiture" name="id_voiture" required>
                <?php
                $allCars = $voitures->getAllCars();
                foreach ($allCars as $car) {
                    echo "<option value='{$car['id_voiture']}'>{$car['marque']} {$car['modele']}</option>";
                }
                ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="montant" class="form-label">Montant</label>
            <input type="number" step="0.01" class="form-control" id="montant" name="montant" required>
        </div>
        <button type="submit" id="texte_bouton_submit" class="btn btn-primary">Ajouter</button>
        <button class="btn btn-secondary" type="reset" id="reset">Annuler</button>
    </form>
</div>
