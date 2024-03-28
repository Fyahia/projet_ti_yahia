<?php
$dsn = 'pgsql:host=localhost;dbname=projet;port=5432';
$user = 'anonyme';
$password = 'yahia';

try {
    $cnx = new PDO($dsn, $user, $password);
    echo "ok";
} catch (PDOException $e) {
    echo "Erreur de connexion : " . $e->getMessage();
}