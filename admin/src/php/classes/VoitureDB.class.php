<?php
class VoitureDB {
    private $_db;

    public function __construct($db) {
        $this->_db = $db;
    }

    public function getAllCars() {
        // Préparez la requête SQL
        $stmt = $this->_db->prepare("SELECT voiture.id_voiture, voiture.annee, voiture.couleur, voiture.prix, voiture.kilometrage, voiture.carburant, voiture.type_boite, modele.modele, marque.marque FROM voiture INNER JOIN modele ON voiture.id_modele = modele.id_modele INNER JOIN marque ON voiture.id_marque = marque.id_marque");

        // Exécutez la requête
        $stmt->execute();

        // Récupérez toutes les voitures
        $voitures = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $voitures;
    }

    public function getCarsByBrand($brand) {
        $stmt = $this->_db->prepare("SELECT voiture.*, marque.marque, modele.modele FROM voiture
                                  INNER JOIN marque ON voiture.id_marque = marque.id_marque
                                  INNER JOIN modele ON voiture.id_modele = modele.id_modele
                                  WHERE LOWER(TRIM(marque.marque)) = LOWER(TRIM(:marque))");
        $stmt->execute(['marque' => $brand]);
        $voitures = $stmt->fetchAll(PDO::FETCH_ASSOC);


        return $voitures;
    }
}