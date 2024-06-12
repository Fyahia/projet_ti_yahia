<?php

class Commande
{
    private $_attributs = array();

    public function __construct(array $data)
    {
        $this->hydrate($data);
    }

    public function hydrate(array $data)
    {
        foreach ($data as $champ => $valeur) { // chaque champ est créé et associé à sa valeur
            $this->_attributs[$champ] = $valeur;
        }
    }

    public function __get($champ)
    {
        if (isset($this->_attributs[$champ])) {
            return $this->_attributs[$champ];
        }
    }

    public function __set($champ, $valeur)
    {
        $this->_attributs[$champ] = $valeur;
    }
}
?>
