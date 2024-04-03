<?php

class AdminDB extends Admin
{

    private $_bd;
    private $_array = array();

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getAdmin($login, $password)
    {
        try {
            $query = "SELECT * FROM admin WHERE login = :login AND password = :password";
            $_resultset = $this->_bd->prepare($query);
            $_resultset->bindValue(':login', $login);
            $_resultset->bindValue(':password', $password);
            $_resultset->execute();
            $retour = $_resultset->fetchAll();

            // Vérifie si des résultats ont été trouvés
            if (!empty($retour)) {
                $_array[] = new Admin($retour); // Crée un objet Admin à partir des données récupérées
                return $_array; // Renvoie un tableau contenant l'objet Admin
            } else {
                return null; // Renvoie null si aucun résultat n'a été trouvé
            }
        } catch (PDOException $e) {
            print("Erreur : " . $e->getMessage()); // Affiche une erreur en cas d'exception PDO
        }
    }



}
