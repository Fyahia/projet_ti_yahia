<?php
// Toujours vérifier si on est connecté en tant qu'administrateur
if (!isset($_SESSION['admin']) || $_SESSION['admin'] != 1) {
    header('Location: index_.php?page=login.php');
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Accueil Admin</title>
</head>
<body>
<h1>Bienvenue, Administrateur!</h1>
<p>Voici quelques liens utiles:</p>
<ul>
    <li><a href="gestion_utilisateurs.php">Gestion des utilisateurs</a></li>
    <li><a href="gestion_produits.php">Gestion des produits</a></li>
    <li><a href="logout.php">Déconnexion</a></li>
</ul>
</body>
</html>