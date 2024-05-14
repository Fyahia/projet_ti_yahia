<?php
if (isset($_GET['id'])) {
    $voitureDB = new VoitureDB($cnx);
    $voiture = $voitureDB->getVoitureById($_GET['id']);

    // Vérifier si la voiture existe
    if (!$voiture) {
        exit('La voiture avec cet identifiant n\'existe pas');
    }
} else {
    exit('Aucun identifiant de voiture n\'a été fourni');
}
?>

<h2>Suppression de voiture</h2>
<div class="container">
    <form id="form_deletion" method="post" action="./src/php/ajax/AjaxDeleteVoiture.php">
        <input type="hidden" name="id_voiture" value="<?= htmlspecialchars($voiture[0]['id_voiture']); ?>" id="id_voiture">
        <div class="mb-3">
            <label for="marque" class="form-label">Marque</label>
            <input type="text" class="form-control" id="marque" value="<?= htmlspecialchars($voiture[0]['marque'] ?? ''); ?>" readonly>
        </div>
        <div class="mb-3">
            <label for="modele" class="form-label">Modèle</label>
            <input type="text" class="form-control" id="modele" value="<?= htmlspecialchars($voiture[0]['modele'] ?? ''); ?>" readonly>
        </div>
        <div class="mb-3">
            <label for="annee" class="form-label">Année</label>
            <input type="text" class="form-control" id="annee" value="<?= htmlspecialchars($voiture[0]['annee'] ?? ''); ?>" readonly>
        </div>
        <div class="mb-3">
            <label for="couleur" class="form-label">Couleur</label>
            <input type="text" class="form-control" id="couleur" value="<?= htmlspecialchars($voiture[0]['couleur'] ?? ''); ?>" readonly>
        </div>
        <div class="mb-3">
            <label for="prix" class="form-label">Prix</label>
            <input type="text" class="form-control" id="prix" value="<?= htmlspecialchars($voiture[0]['prix'] ?? ''); ?>" readonly>
        </div>
        <div class="mb-3">
            <label for="kilometrage" class="form-label">Kilométrage</label>
            <input type="text" class="form-control" id="kilometrage" value="<?= htmlspecialchars($voiture[0]['kilometrage'] ?? ''); ?>" readonly>
        </div>
        <div class="mb-3">
            <label for="carburant" class="form-label">Carburant</label>
            <input type="text" class="form-control" id="carburant" value="<?= htmlspecialchars($voiture[0]['carburant'] ?? ''); ?>" readonly>
        </div>
        <div class="mb-3">
            <label for="type_boite" class="form-label">Type de boîte</label>
            <input type="text" class="form-control" id="type_boite" value="<?= htmlspecialchars($voiture[0]['type_boite'] ?? ''); ?>" readonly>
        </div>
        <div class="mb-3">
            <label for="image">Image de la voiture:</label><br>
            <img src="<?= htmlspecialchars($voiture[0]['image'] ?? ''); ?>" alt="Image de la voiture">
        </div>
        <button type="submit" id="texte_bouton_delete" class="btn btn-danger">
            Supprimer
        </button>
        <a href="index_.php?page=gestion_voiture.php" class="btn btn-primary">Annuler</a>
    </form>
</div>
