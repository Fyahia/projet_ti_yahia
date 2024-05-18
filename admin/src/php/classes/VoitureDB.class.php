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

    public function updateVoiture($id_voiture, $marque, $modele, $annee, $couleur, $prix, $kilometrage, $carburant, $type_boite, $image)
    {
        try {
            $query = "UPDATE voiture SET marque = :marque, modele = :modele, annee = :annee, couleur = :couleur, prix = :prix, kilometrage = :kilometrage, carburant = :carburant, type_boite = :type_boite, image = :image WHERE id_voiture = :id_voiture";
            $res = $this->_db->prepare($query);

            $res->bindValue(':marque', $marque);
            $res->bindValue(':modele', $modele);
            $res->bindValue(':annee', $annee, PDO::PARAM_INT);
            $res->bindValue(':couleur', $couleur);
            $res->bindValue(':prix', $prix, PDO::PARAM_STR); // Utiliser PDO::PARAM_STR pour les nombres flottants
            $res->bindValue(':kilometrage', $kilometrage, PDO::PARAM_INT);
            $res->bindValue(':carburant', $carburant);
            $res->bindValue(':type_boite', $type_boite);
            $res->bindValue(':image', $image);
            $res->bindValue(':id_voiture', $id_voiture, PDO::PARAM_INT);

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
    public function filtreVoiture($filters = [])
    {
        $query = "SELECT * FROM voiture WHERE 1=1";

        // Ajouter les filtres à la requête
        if (!empty($filters['marque'])) {
            $query .= " AND LOWER(marque) LIKE LOWER(:marque)";
        }
        if (!empty($filters['modele'])) {
            $query .= " AND LOWER(modele) LIKE LOWER(:modele)";
        }
        if (!empty($filters['annee_min'])) {
            $query .= " AND annee >= :annee_min";
        }
        if (!empty($filters['annee_max'])) {
            $query .= " AND annee <= :annee_max";
        }
        if (!empty($filters['couleur'])) {
            $query .= " AND LOWER(couleur) LIKE LOWER(:couleur)";
        }
        if (!empty($filters['prix_min'])) {
            $query .= " AND prix >= :prix_min";
        }
        if (!empty($filters['prix_max'])) {
            $query .= " AND prix <= :prix_max";
        }
        if (!empty($filters['kilometrage_min'])) {
            $query .= " AND kilometrage >= :kilometrage_min";
        }
        if (!empty($filters['kilometrage_max'])) {
            $query .= " AND kilometrage <= :kilometrage_max";
        }
        if (!empty($filters['carburant'])) {
            $query .= " AND LOWER(carburant) LIKE LOWER(:carburant)";
        }
        if (!empty($filters['type_boite'])) {
            $query .= " AND LOWER(type_boite) LIKE LOWER(:type_boite)";
        }

        $stmt = $this->_db->prepare($query);

        // Lier les paramètres
        if (!empty($filters['marque'])) {
            $stmt->bindValue(':marque', '%' . $filters['marque'] . '%', PDO::PARAM_STR);
        }
        if (!empty($filters['modele'])) {
            $stmt->bindValue(':modele', '%' . $filters['modele'] . '%', PDO::PARAM_STR);
        }
        if (!empty($filters['annee_min'])) {
            $stmt->bindValue(':annee_min', (int)$filters['annee_min'], PDO::PARAM_INT);
        }
        if (!empty($filters['annee_max'])) {
            $stmt->bindValue(':annee_max', (int)$filters['annee_max'], PDO::PARAM_INT);
        }
        if (!empty($filters['couleur'])) {
            $stmt->bindValue(':couleur', '%' . $filters['couleur'] . '%', PDO::PARAM_STR);
        }
        if (!empty($filters['prix_min'])) {
            $stmt->bindValue(':prix_min', (float)$filters['prix_min'], PDO::PARAM_STR);
        }
        if (!empty($filters['prix_max'])) {
            $stmt->bindValue(':prix_max', (float)$filters['prix_max'], PDO::PARAM_STR);
        }
        if (!empty($filters['kilometrage_min'])) {
            $stmt->bindValue(':kilometrage_min', (int)$filters['kilometrage_min'], PDO::PARAM_INT);
        }
        if (!empty($filters['kilometrage_max'])) {
            $stmt->bindValue(':kilometrage_max', (int)$filters['kilometrage_max'], PDO::PARAM_INT);
        }
        if (!empty($filters['carburant'])) {
            $stmt->bindValue(':carburant', '%' . $filters['carburant'] . '%', PDO::PARAM_STR);
        }
        if (!empty($filters['type_boite'])) {
            $stmt->bindValue(':type_boite', '%' . $filters['type_boite'] . '%', PDO::PARAM_STR);
        }

        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }




    public function getDistinctModeles()
    {
        $stmt = $this->_db->prepare("SELECT DISTINCT modele FROM voiture ORDER BY modele");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function getDistinctMarques()
    {
        $stmt = $this->_db->prepare("SELECT DISTINCT LOWER(marque) AS marque FROM voiture ORDER BY marque");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getDistinctCouleurs()
    {
        $stmt = $this->_db->prepare("SELECT DISTINCT LOWER(couleur) AS couleur FROM voiture ORDER BY couleur");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getDistinctCarburants()
    {
        $stmt = $this->_db->prepare("SELECT DISTINCT LOWER(carburant) AS carburant FROM voiture ORDER BY carburant");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getDistinctTypesBoite()
    {
        $stmt = $this->_db->prepare("SELECT DISTINCT LOWER(type_boite) AS type_boite FROM voiture ORDER BY type_boite");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }



}

