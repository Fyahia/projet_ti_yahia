<?php
if(isset($_POST['submit_login'])){
    extract($_POST,EXTR_OVERWRITE);

    $ad = new AdminDB($cnx);
    $admin = $ad->getAdmin($login,$password);
    if($admin){
        $_SESSION['admin'] = 1;
        // Redirection vers index_admin.php
        echo '<meta http-equiv="refresh" content="0;admin/index_admin.php">';
        exit;
    }else{
        // Redirection vers accueil.php
        echo '<meta http-equiv="refresh" content="0;url=index_.php?page=accueil.php">';
    }
}
?>
<!-- Reste du code -->
<form method="post" action="<?= $_SERVER['PHP_SELF'];?>">
    <div class="mb-3">
        <h3> Page de connexion dédié aux admin : </h3>
        <label for="login" class="form-label">Entrez le login </label>
        <input type="text" name="login" class="form-control" id="login" aria-describedby="loginHelp">
    </div>
    <div class="mb-3">
        <label for="password" class="form-label">Entrez le mot de passe </label>
        <input type="password" name="password" class="form-control" id="password">
    </div>

    <button type="submit" name="submit_login" class="btn btn-primary">Connexion</button>
</form>

