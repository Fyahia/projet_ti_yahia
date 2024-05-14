<h2>Ajout d'une voiture </h2>

<div class="container">
    <form id="form_ajout" method="get" action="">
        <div class="mb-3">
            <label for="marque" class="form-label">Marque</label>
            <input type="text" class="form-control" id="marque" name="marque">
        </div>
        <div class="mb-3">
            <label for="modele" class="form-label">Modèle</label>
            <input type="text" class="form-control" id="modele" name="modele">
        </div>
        <div class="mb-3">
            <label for="annee" class="form-label">Année</label>
            <input type="text" class="form-control" id="annee" name="annee">
        </div>
        <div class="mb-3">
            <label for="couleur" class="form-label">Couleur</label>
            <input type="text" class="form-control" id="couleur" name="couleur">
        </div>
        <div class="mb-3">
            <label for="prix" class="form-label">Prix</label>
            <input type="text" class="form-control" id="prix" name="prix">
        </div>
        <div class="mb-3">
            <label for="kilometrage" class="form-label">Kilométrage</label>
            <input type="text" class="form-control" id="kilometrage" name="kilometrage">
        </div>
        <div class="mb-3">
            <label for="carburant" class="form-label">Carburant</label>
            <input type="text" class="form-control" id="carburant" name="carburant">
        </div>
        <div class="mb-3">
            <label for="type_boite" class="form-label">Type de boîte</label>
            <input type="text" class="form-control" id="type_boite" name="type_boite">
        </div>
        <div class="mb-3">
            <label for="image">Image de la voiture:</label>
            <input type="file" id="image" name="image">
        </div>
        <button type="submit" id="texte_bouton_submit" class="btn btn-primary">
            Ajouter
        </button>
        <button class="btn btn-primary" type="reset" id="reset">Annuler</button>
    </form>
</div>