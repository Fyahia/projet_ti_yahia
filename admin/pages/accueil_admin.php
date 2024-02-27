<?php
//toujours veriiier si on est connecté
require './src/php/utils/verifier_connexion.php';
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