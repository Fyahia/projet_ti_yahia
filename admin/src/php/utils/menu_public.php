<<?php
// Inclure le fichier de connexion à la base de données
require './admin/src/php/db/dbPgConnect.php';


// Récupérez toutes les marques de la base de données
$stmt = $cnx->prepare("SELECT marque FROM voiture");
$stmt->execute();
$marques = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <!-- Ajout d'un nom de page -->
        <a class="navbar-brand" href="index_.php?page=accueil.php">TransakAuto</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <!-- Ajout d'autres options intéressantes -->
                <li class="nav-item">
                    <a class="nav-link" href="index_.php?page=apropos.php">À propos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index_.php?page=service.php">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index_.php?page=contact.php">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index_.php?page=login.php">Se connecter</a>
                </li>
            </ul>

        </div>
    </div>
</nav>