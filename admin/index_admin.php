<?php
session_start();
print "<br>index_admin.php";
require 'C:\laragon\www\projet_ti_yahia\admin\src\php\utils\liste_includes.php';
require 'C:\laragon\www\projet_ti_yahia\admin\src\php\utils\verifier_connexion.php';

?>

<!doctype html>
<html lang="fr">
<head>
    <title>Projet Yahia</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./admin/public/css/style.css" type="text/css">
    <link rel="stylesheet" href="./admin/public/css/custom.css" type="text/css">
</head>
<body>
<div class="container">
    <header id="header">
    </header>

    <nav id="menu">
        <?php
        if (file_exists('./admin/src/php/utils/menu_admin.php')) {
            include './admin/src/php/utils/menu_admin.php';
        }
        ?>
    </nav>
    <div id="contenu">
        <?php
        //si aucune variable de session 'page'
        if (!isset($_SESSION['page'])) {
            $_SESSION['page'] = './pages/accueil_admin.php';
        }
        if (isset($_GET['page'])) {
            $_SESSION['page'] = 'pages/'.$_GET['page'];
        }
        if (file_exists($_SESSION['page'])) {
            include $_SESSION['page'];
        } else {
            include './pages/page404.php';
        }
        ?>
    </div>
    <footer id="footer">&nbsp;</footer>
</div>
</body>

</html>