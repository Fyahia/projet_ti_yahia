<?php
if (isset($_GET['id'])) {
    $voitureDB = new VoitureDB($cnx);
    $voiture = $voitureDB->getVoitureById($_GET['id']);
    // Vérifier si la voiture existe
    if ($voiture) {
        ?>
        <h2>Modification des voitures</h2>
        <div class="container">
            <form id="form_modification" method="post" >
                <input type="hidden" name="id_voiture" value="<?= $voiture[0]['id_voiture']; ?>">
                <div class="mb-3">
                    <label for="marque" class="form-label">Marque</label>
                    <input type="text" class="form-control" id="marque" name="marque"
                           value="<?= $voiture[0]['marque'] ?? ''; ?>">
                </div>
                <div class="mb-3">
                    <label for="modele" class="form-label">Modèle</label>
                    <input type="text" class="form-control" id="modele" name="modele"
                           value="<?= $voiture[0]['modele'] ?? ''; ?>">
                </div>
                <div class="mb-3">
                    <label for="annee" class="form-label">Année</label>
                    <input type="text" class="form-control" id="annee" name="annee"
                           value="<?= $voiture[0]['annee'] ?? ''; ?>">
                </div>
                <div class="mb-3">
                    <label for="couleur" class="form-label">Couleur</label>
                    <input type="text" class="form-control" id="couleur" name="couleur"
                           value="<?= $voiture[0]['couleur'] ?? ''; ?>">
                </div>
                <div class="mb-3">
                    <label for="prix" class="form-label">Prix</label>
                    <input type="text" class="form-control" id="prix" name="prix"
                           value="<?= $voiture[0]['prix'] ?? ''; ?>">
                </div>
                <div class="mb-3">
                    <label for="kilometrage" class="form-label">Kilométrage</label>
                    <input type="text" class="form-control" id="kilometrage" name="kilometrage"
                           value="<?= $voiture[0]['kilometrage'] ?? ''; ?>">
                </div>
                <div class="mb-3">
                    <label for="carburant" class="form-label">Carburant</label>
                    <input type="text" class="form-control" id="carburant" name="carburant"
                           value="<?= $voiture[0]['carburant'] ?? ''; ?>">
                </div>
                <div class="mb-3">
                    <label for="type_boite" class="form-label">Type de boîte</label>
                    <input type="text" class="form-control" id="type_boite" name="type_boite"
                           value="<?= $voiture[0]['type_boite'] ?? ''; ?>">
                </div>
                <div class="mb-3">
                    <label for="image">Image de la voiture:</label>
                    <input type="file" id="image" name="image" value="<?= $voiture[0]['image'] ?? ''; ?>">
                </div>
                <input type="hidden" name="id_voiture" value="<?= $voiture[0]['id_voiture'] ?? ''; ?>" id="id_voiture">
                <button type="submit" id="texte_bouton_modif" class="btn btn-primary">Modifier</button>
                <button type="reset" id="reset" class="btn btn-primary">Annuler</button>
            </form>
        </div>
        <?php
    } else {
        exit('La voiture avec cet identifiant n\'existe pas');
    }
} else {
    exit('Aucun identifiant de voiture n\'a été fourni');
}
?>
