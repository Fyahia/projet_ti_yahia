<h2>Gestion des voitures</h2>
<a href="index_admin.php?page=ajouter_voiture.php">Nouvelle voiture</a><br>


<?php

//récupération des voitures et affichage dans table bootstrap
$voitures = new VoitureDB($cnx);
$liste = $voitures->getAllCars();
//var_dump($liste);
$nbr = count($liste);


if($nbr == 0){
    print "<br>Aucune voiture encodée<br>";
}
else{
    ?>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Marque</th>
            <th scope="col">Modèle</th>
            <th scope="col">Année</th>
            <th scope="col">Couleur</th>
            <th scope="col">Prix</th>
            <th scope="col">Kilométrage</th>
            <th scope="col">Carburant</th>
            <th scope="col">Type de boîte</th>
        </tr>
        </thead>
        <tbody>
        <?php
        for($i = 0; $i < $nbr; $i++) {
            ?>
            <tr>
                <th><?= $liste[$i]['id_voiture']; ?></th>
                <td contenteditable="true" id="<?= $liste[$i]['id_voiture']; ?>" name="marque"><?= $liste[$i]['marque']; ?></td>
                <td contenteditable="true" id="<?= $liste[$i]['id_voiture']; ?>" name="modele"><?= $liste[$i]['modele']; ?></td>
                <td contenteditable="true" id="<?= $liste[$i]['id_voiture']; ?>" name="annee"><?= $liste[$i]['annee']; ?></td>
                <td contenteditable="true" id="<?= $liste[$i]['id_voiture']; ?>" name="couleur"><?= $liste[$i]['couleur']; ?></td>
                <td contenteditable="true" id="<?= $liste[$i]['id_voiture']; ?>" name="prix"><?= $liste[$i]['prix']; ?></td>
                <td contenteditable="true" id="<?= $liste[$i]['id_voiture']; ?>" name="kilometrage"><?= $liste[$i]['kilometrage']; ?></td>
                <td contenteditable="true" id="<?= $liste[$i]['id_voiture']; ?>" name="carburant"><?= $liste[$i]['carburant']; ?></td>
                <td contenteditable="true" id="<?= $liste[$i]['id_voiture']; ?>" name="type_boite"><?= $liste[$i]['type_boite']; ?></td>
                <td><a href="index_admin.php?page=modifier_voiture.php&id=<?= $liste[$i]['id_voiture']; ?>">Modifier</a></td>
                <td><a href="index_admin.php?page=supprimer_voiture.php&id=<?= $liste[$i]['id_voiture']; ?>">Supprimer</a></td>
            </tr>
            <?php
        }

        ?>

        </tbody>
    </table>
<?php
}