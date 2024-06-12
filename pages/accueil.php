<?php
$voiture = new VoitureDB($cnx);

$filters = [];
if (isset($_GET['marque'])) {
    $filters['marque'] = $_GET['marque'];
}
if (isset($_GET['modele'])) {
    $filters['modele'] = $_GET['modele'];
}
if (isset($_GET['annee_min'])) {
    $filters['annee_min'] = $_GET['annee_min'];
}
if (isset($_GET['annee_max'])) {
    $filters['annee_max'] = $_GET['annee_max'];
}
if (isset($_GET['couleur'])) {
    $filters['couleur'] = $_GET['couleur'];
}
if (isset($_GET['prix_min'])) {
    $filters['prix_min'] = $_GET['prix_min'];
}
if (isset($_GET['prix_max'])) {
    $filters['prix_max'] = $_GET['prix_max'];
}
if (isset($_GET['kilometrage_min'])) {
    $filters['kilometrage_min'] = $_GET['kilometrage_min'];
}
if (isset($_GET['kilometrage_max'])) {
    $filters['kilometrage_max'] = $_GET['kilometrage_max'];
}
if (isset($_GET['carburant'])) {
    $filters['carburant'] = $_GET['carburant'];
}
if (isset($_GET['type_boite'])) {
    $filters['type_boite'] = $_GET['type_boite'];
}

$liste = $voiture->filtreVoiture($filters);

$marques = $voiture->getDistinctMarques();
$modeles = $voiture->getDistinctModeles();
$couleurs = $voiture->getDistinctCouleurs();
$carburants = $voiture->getDistinctCarburants();
$types_boite = $voiture->getDistinctTypesBoite();
?>
<div class="container-fluid mt-5">
    <div class="row">
        <div class="col-md-3">
            <h3>Filtres</h3>
            <form id="filterForm" method="get">
                <div class="mb-3">
                    <label for="marque" class="form-label">Marque</label>
                    <select class="form-control" id="marque" name="marque">
                        <option value="">Toutes les marques</option>
                        <?php
                        foreach ($marques as $marque) {
                            $selected = (isset($_GET['marque']) && strtolower($_GET['marque']) == strtolower($marque['marque'])) ? 'selected' : '';
                            echo "<option value='" . htmlspecialchars($marque['marque']) . "' $selected>" . htmlspecialchars($marque['marque']) . "</option>";
                        }
                        ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="modele" class="form-label">Modèle</label>
                    <select class="form-control" id="modele" name="modele">
                        <option value="">Tous les modèles</option>
                        <?php
                        foreach ($modeles as $modele) {
                            $selected = (isset($_GET['modele']) && strtolower($_GET['modele']) == strtolower($modele['modele'])) ? 'selected' : '';
                            echo "<option value='" . htmlspecialchars($modele['modele']) . "' $selected>" . htmlspecialchars($modele['modele']) . "</option>";
                        }
                        ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="annee_min" class="form-label">Année (Min)</label>
                    <input type="number" class="form-control" id="annee_min" name="annee_min" value="<?= htmlspecialchars($_GET['annee_min'] ?? '') ?>">
                </div>
                <div class="mb-3">
                    <label for="annee_max" class="form-label">Année (Max)</label>
                    <input type="number" class="form-control" id="annee_max" name="annee_max" value="<?= htmlspecialchars($_GET['annee_max'] ?? '') ?>">
                </div>
                <div class="mb-3">
                    <label for="couleur" class="form-label">Couleur</label>
                    <select class="form-control" id="couleur" name="couleur">
                        <option value="">Toutes les couleurs</option>
                        <?php
                        foreach ($couleurs as $couleur) {
                            $selected = (isset($_GET['couleur']) && strtolower($_GET['couleur']) == strtolower($couleur['couleur'])) ? 'selected' : '';
                            echo "<option value='" . htmlspecialchars($couleur['couleur']) . "' $selected>" . htmlspecialchars($couleur['couleur']) . "</option>";
                        }
                        ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="prix_min" class="form-label">Prix (Min)</label>
                    <input type="number" step="0.01" class="form-control" id="prix_min" name="prix_min" value="<?= htmlspecialchars($_GET['prix_min'] ?? '') ?>">
                </div>
                <div class="mb-3">
                    <label for="prix_max" class="form-label">Prix (Max)</label>
                    <input type="number" step="0.01" class="form-control" id="prix_max" name="prix_max" value="<?= htmlspecialchars($_GET['prix_max'] ?? '') ?>">
                </div>
                <div class="mb-3">
                    <label for="kilometrage_min" class="form-label">Kilométrage (Min)</label>
                    <input type="number" class="form-control" id="kilometrage_min" name="kilometrage_min" value="<?= htmlspecialchars($_GET['kilometrage_min'] ?? '') ?>">
                </div>
                <div class="mb-3">
                    <label for="kilometrage_max" class="form-label">Kilométrage (Max)</label>
                    <input type="number" class="form-control" id="kilometrage_max" name="kilometrage_max" value="<?= htmlspecialchars($_GET['kilometrage_max'] ?? '') ?>">
                </div>
                <div class="mb-3">
                    <label for="carburant" class="form-label">Carburant</label>
                    <select class="form-control" id="carburant" name="carburant">
                        <option value="">Tous les carburants</option>
                        <?php
                        foreach ($carburants as $carburant) {
                            $selected = (isset($_GET['carburant']) && strtolower($_GET['carburant']) == strtolower($carburant['carburant'])) ? 'selected' : '';
                            echo "<option value='" . htmlspecialchars($carburant['carburant']) . "' $selected>" . htmlspecialchars($carburant['carburant']) . "</option>";
                        }
                        ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="type_boite" class="form-label">Type de boîte</label>
                    <select class="form-control" id="type_boite" name="type_boite">
                        <option value="">Tous les types de boîte</option>
                        <?php
                        foreach ($types_boite as $type_boite) {
                            $selected = (isset($_GET['type_boite']) && strtolower($_GET['type_boite']) == strtolower($type_boite['type_boite'])) ? 'selected' : '';
                            echo "<option value='" . htmlspecialchars($type_boite['type_boite']) . "' $selected>" . htmlspecialchars($type_boite['type_boite']) . "</option>";
                        }
                        ?>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Appliquer</button>

            </form>
        </div>
        <div class="col-md-9">
            <div class="album py-5 bg-body-tertiary">
                <div class="container">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        <?php
                        if (!empty($liste)) {
                            foreach ($liste as $voiture) {
                                ?>
                                <div class="col">
                                    <div class="card shadow-sm" style="padding: 10px;">
                                        <div class="card-body">
                                            <p class="card-text">
                                                <img src="./admin/public/images/<?= htmlspecialchars($voiture['image'] ?? ''); ?>" alt="Image de la voiture" width="250" height="200">
                                                Marque: <?= htmlspecialchars($voiture['marque'] ?? ''); ?><br>
                                                Modèle: <?= htmlspecialchars($voiture['modele'] ?? ''); ?><br>
                                                Année: <?= htmlspecialchars($voiture['annee'] ?? ''); ?><br>
                                                Couleur: <?= htmlspecialchars($voiture['couleur'] ?? ''); ?><br>
                                                Prix: <?= htmlspecialchars($voiture['prix'] ?? ''); ?> €<br>
                                                Kilométrage: <?= htmlspecialchars($voiture['kilometrage'] ?? ''); ?><br>
                                                Carburant: <?= htmlspecialchars($voiture['carburant'] ?? ''); ?><br>
                                                Type de boîte: <?= htmlspecialchars($voiture['type_boite'] ?? ''); ?>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <?php
                            }
                        } else {
                            echo "<p>Aucune voiture trouvée.</p>";
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
