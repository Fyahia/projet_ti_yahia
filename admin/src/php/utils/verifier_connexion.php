<?php

//fichier à inclure en haut des pages admin
if(isset($session['admin'])){
    //si on n'est pas passer par le login et si on est pas reconnue admin
    ?>

    <meta http-equiv = "refresh": content = "0;url=../index_.php?page=accueil.php">

    <?php

}
?>