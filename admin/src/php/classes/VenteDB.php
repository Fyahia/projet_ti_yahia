<?php

class VenteDB
{
    private $_db;

    public function __construct($db)
    {
        $this->_db = $db;
    }

    public function addVente($id_voiture, $id_client)
    {
        // Get the price of the car
        $query = "SELECT prix FROM voiture WHERE id_voiture = :id_voiture";
        $stmt = $this->_db->prepare($query);
        $stmt->execute([':id_voiture' => $id_voiture]);
        $prix = $stmt->fetchColumn();

        // Insert the new sale into the commande table
        $query = "INSERT INTO commande (montant, id_voiture, id_client) VALUES (:montant, :id_voiture, :id_client)";
        $stmt = $this->_db->prepare($query);
        $stmt->execute([
            ':montant' => $prix,
            ':id_voiture' => $id_voiture,
            ':id_client' => $id_client
        ]);
    }

    public function getAllVentes()
    {
        $query = "SELECT * FROM commande";
        $result = $this->_db->query($query);
        if (!$result) {
            throw new Exception("Erreur lors de l'exécution de la requête SQL");
        }
        $ventes = $result->fetchAll(PDO::FETCH_ASSOC);
        return $ventes;
    }
}