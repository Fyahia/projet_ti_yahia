<?php
// Toujours vérifier si on est connecté en tant qu'administrateur
if (!isset($_SESSION['admin']) || $_SESSION['admin'] != 1) {
    header('Location: index_.php?page=login.php');
    exit;
}
?>
<!-- JS de Bootstrap -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- CSS de Bootstrap -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

<div class="container">
    <h1 class="my-4">Bienvenue, Administrateur!</h1>
    <p>Voici quelques liens utiles:</p>
    <ul class="list-group">
        <li class="list-group-item"><a href="index_admin.php?page=gestion_voiture.php">gestion  voiture</a></li>
        <li class="list-group-item"><a href="index_admin.php?page=gestion_vente.php">Gestion vente </a></li>
        <li class="list-group-item"><a href="index_admin.php?page=disconnect.php">Déconnexion</a></li>
    </ul>
</div>

