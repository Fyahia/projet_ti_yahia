<?php
$voiture = new VoitureDB($cnx);

if (isset($_GET['marque'])) {
    $liste = $voiture->getCarsByBrand($_GET['marque']);
} else {
    $liste = $voiture->getAllCars();
}

?>


<div class="album py-5 bg-body-tertiary">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <?php
            foreach($liste as $voiture){
                ?>
                <div class="col">
                    <div class="card shadow-sm" style="padding: 10px;">
                        <img  src="./admin/public/images/voiture<?php echo htmlspecialchars($voiture['id_voiture'] ?? ''); ?>.jpg" alt="Image de la voiture"  >

                        <div class="card-body">
                            <p class="card-text">
                                Marque: <?php print htmlspecialchars($voiture['marque'] ?? ''); ?><br>
                                Modèle: <?php print htmlspecialchars($voiture['modele'] ?? ''); ?><br>
                                Année: <?php print htmlspecialchars($voiture['annee'] ?? ''); ?><br>
                                Couleur: <?php print htmlspecialchars($voiture['couleur'] ?? ''); ?><br>
                                Prix: <?php print htmlspecialchars($voiture['prix'] ?? ''); ?> €<br>
                                Kilométrage: <?php print htmlspecialchars($voiture['kilometrage'] ?? ''); ?><br>
                                Carburant: <?php print htmlspecialchars($voiture['carburant'] ?? ''); ?><br>
                                Type de boîte: <?php print htmlspecialchars($voiture['type_boite'] ?? ''); ?>
                            </p>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
</div>

