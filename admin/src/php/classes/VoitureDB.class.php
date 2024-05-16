<?php

class VoitureDB
{
    private $_db;

    public function __construct($cnx)
    {
        $this->_db = $cnx;
    }

    public function getAllCars()
    {
        $stmt = $this->_db->prepare("SELECT * from voiture");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getCarsByBrand($brand)
    {
        $stmt = $this->_db->prepare("SELECT * FROM voiture WHERE LOWER(TRIM(marque)) = LOWER(TRIM(:marque))");
        $stmt->bindParam(':marque', $brand, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getVoitureById($id)
    {
        $stmt = $this->_db->prepare("SELECT * FROM voiture WHERE id_voiture = :id");
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC); // Utilisez fetch() au lieu de fetchAll()
    }

    public function updateVoiture($id_voiture, $marque, $modele, $annee, $couleur, $prix, $kilometrage, $carburant, $type_boite)
    {
        try {
            $query = "UPDATE voiture SET marque = :marque, modele = :modele, annee = :annee, couleur = :couleur, prix = :prix, kilometrage = :kilometrage, carburant = :carburant, type_boite = :type_boite WHERE id_voiture = :id_voiture";
            $res = $this->_db->prepare($query);

            $res->bindValue(':marque', $marque);
            $res->bindValue(':modele', $modele);
            $res->bindValue(':annee', $annee);
            $res->bindValue(':couleur', $couleur);
            $res->bindValue(':prix', $prix);
            $res->bindValue(':kilometrage', $kilometrage);
            $res->bindValue(':carburant', $carburant);
            $res->bindValue(':type_boite', $type_boite);
            $res->bindValue(':id_voiture', $id_voiture);
            $res->execute();

            echo "Voiture modifiée avec succès.";
        } catch (PDOException $e) {
            print "Échec " . $e->getMessage();
            echo "Erreur lors de la modification de la voiture.";
        }
    }

    public function ajout_voiture($marque, $modele, $annee, $couleur, $prix, $kilometrage, $carburant, $type_boite, $image)
    {
        try {
            $query = "SELECT ajouter_voiture(:marque, :modele, :annee, :couleur, :prix, :kilometrage, :carburant, :type_boite, :image)";
            $res = $this->_db->prepare($query);
            $res->bindValue(':marque', $marque);
            $res->bindValue(':modele', $modele);
            $res->bindValue(':annee', $annee);
            $res->bindValue(':couleur', $couleur);
            $res->bindValue(':prix', $prix);
            $res->bindValue(':kilometrage', $kilometrage);
            $res->bindValue(':carburant', $carburant);
            $res->bindValue(':type_boite', $type_boite);
            $res->bindValue(':image', $image);
            $res->execute();
            return $res->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            print "Échec " . $e->getMessage();
        }
    }

    public function deleteVoitureById($id_voiture)
    {
        try {
            $query = "DELETE FROM voiture WHERE id_voiture = :id";
            $res = $this->_db->prepare($query);
            $res->bindValue(':id', $id_voiture);
            $res->execute();
            return array('status' => 'success', 'message' => 'Voiture supprimée avec succès.');
        } catch (PDOException $e) {
            return array('status' => 'error', 'message' => 'Erreur lors de la suppression de la voiture.');
        }
    }
}
