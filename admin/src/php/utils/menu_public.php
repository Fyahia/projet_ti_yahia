<<?php
// Inclure le fichier de connexion à la base de données
require './admin/src/php/db/dbPgConnect.php';


// Récupérez toutes les marques de la base de données
$stmt = $cnx->prepare("SELECT * FROM marque");
$stmt->execute();
$marques = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index_.php?page=accueil.php">Nos Voitures</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index_.php?page=contact.php">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index_.php?page=login.php">Se connecter</a>
                </li>
            </ul>
            <form class="d-flex" method="get" action="index_.php?page=accueil.php">
                <select class="form-control me-2" name="marque">
                    <?php foreach ($marques as $marque): ?>
                        <option value="<?php echo htmlspecialchars($marque['marque']); ?>">
                            <?php echo htmlspecialchars($marque['marque']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
                <button class="btn btn-outline-success" type="submit">Recherche</button>
            </form>
        </div>
    </div>
</nav>