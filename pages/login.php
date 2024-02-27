<?php
if(isset($_POST['submit_login'])){
    extract($_POST,EXTR_OVERWRITE);
   // print "<br> recu : ".$login;

    $ad = new AdminDB($cnx);
    $admin = $ad->getAdmin($login,$password);//retourne 1 ou 0
    //print "<br>retour : ".$admin;
    if($admin){
        $_SESSION['admin'] = 1;
        ?>
        <meta http-equiv = "refresh": content = "0;url=admin/index_.php?page=accueil_admin.php">
        <?php

    }else{
        //rediriger vers acceuil public

        ?>
        <meta http-equiv = "refresh": content = "0;url=index_.php?page=accueil.php">
        <?php
    }
}
?>

<form method="post" action="<?= $_SERVER['PHP_SELF'];?>">
    <div class="mb-3">
        <label for="login" class="form-label">Email address</label>
        <input type="text" name="login" class="form-control" id="login" aria-describedby="loginHelp">
    </div>
    <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" name="password" class="form-control" id="password">
    </div>

    <button type="submit" name="submit_login" class="btn btn-primary">Connexion</button>
</form>

