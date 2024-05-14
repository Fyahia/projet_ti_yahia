<?php

class VoitureDB
{
    private $_db;

    public function __construct($db)
    {
        $this->_db = $db;
    }

    public function getAllCars()
    {
        // Préparez la requête SQL
        $stmt = $this->_db->prepare("SELECT * from voiture");

        // Exécutez la requête
        $stmt->execute();

        // Récupérez toutes les voitures
        $voitures = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $voitures;
    }

    public function getCarsByBrand($brand)
{
    // Prepare the SQL query
    $stmt = $this->_db->prepare("SELECT * FROM voiture WHERE LOWER(TRIM(marque)) = LOWER(TRIM(:marque))");

    // Bind the parameters
    $stmt->bindParam(':marque', $brand, PDO::PARAM_STR);

    // Execute the query
    $stmt->execute();

    // Fetch all cars of the given brand
    $voitures = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $voitures;
}

    public function getVoitureById($id)
    {
        // Préparez la requête SQL
        $stmt = $this->_db->prepare("SELECT * FROM voiture WHERE id_voiture = :id");

        // Liez l'identifiant à la requête
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);

        // Exécutez la requête
        $stmt->execute();

        // Récupérez la voiture
        $voiture = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $voiture;
    }

    public function updateVoiture($id_voiture, $marque, $modele, $annee, $couleur, $prix, $kilometrage, $carburant, $type_boite, $image)
    {
        try {
            // Prepare the SQL query
            $query = "UPDATE voiture SET marque = :marque, modele = :modele, annee = :annee, couleur = :couleur, prix = :prix, kilometrage = :kilometrage, carburant = :carburant, type_boite = :type_boite, image = :image WHERE id_voiture = :id_voiture";
            $res = $this->_bd->prepare($query);

            $res->bindValue(':marque', $marque);
            $res->bindValue(':modele', $modele);
            $res->bindValue(':annee', $annee);
            $res->bindValue(':couleur', $couleur);
            $res->bindValue(':prix', $prix);
            $res->bindValue(':kilometrage', $kilometrage);
            $res->bindValue(':carburant', $carburant);
            $res->bindValue(':type_boite', $type_boite);
            $res->bindValue(':image', $image);
            $res->bindValue(':id_voiture', $id_voiture);
            $res->execute();

            echo "Voiture modifiée avec succès.";
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
            echo "Erreur lors de la modification de la voiture.";
        }
    }

    public function ajout_voiture($marque, $modele, $annee, $couleur, $prix, $kilometrage, $carburant, $type_boite, $image)
    {
        try {
            $query = "select ajout_voiture(:marque, :modele, :annee, :couleur, :prix, :kilometrage, :carburant, :type_boite, :image)";
            $res = $this->_bd->prepare($query);
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
            $data = $res->fetch(PDO::FETCH_ASSOC);
            return $data;
        } catch (PDOException $e) {
            print "Echec " . $e->getMessage();
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