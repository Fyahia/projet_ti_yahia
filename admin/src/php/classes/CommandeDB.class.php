<?php

class CommandeDB
{
    private $_db;

    public function __construct($cnx)
    {
        $this->_db = $cnx;
    }

    // Récupérer toutes les commandes
    public function getAllCommandes()
    {
        $stmt = $this->_db->prepare("SELECT * FROM commande");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Récupérer une commande par son ID
    public function getCommandeById($id_commande)
    {
        $stmt = $this->_db->prepare("SELECT * FROM commande WHERE id_commande = :id_commande");
        $stmt->bindParam(':id_commande', $id_commande, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Ajouter une nouvelle commande en utilisant la fonction PL/pgSQL
    public function ajoutCommande($id_client, $id_voiture, $montant)
    {
        try {
            $query = "SELECT ajouter_commande(:montant, :id_voiture, :id_client)";
            $stmt = $this->_db->prepare($query);
            $stmt->bindParam(':montant', $montant, PDO::PARAM_STR);
            $stmt->bindParam(':id_voiture', $id_voiture, PDO::PARAM_INT);
            $stmt->bindParam(':id_client', $id_client, PDO::PARAM_INT);
            return $stmt->execute();
        } catch (PDOException $e) {
            echo "Échec : " . $e->getMessage();
            return false;
        }
    }

    // Supprimer une commande par son ID
    public function deleteCommandeById($id_commande)
    {
        try {
            $query = "DELETE FROM commande WHERE id_commande = :id_commande";
            $stmt = $this->_db->prepare($query);
            $stmt->bindParam(':id_commande', $id_commande, PDO::PARAM_INT);
            $stmt->execute();
            return array('status' => 'success', 'message' => 'Commande supprimée avec succès.');
        } catch (PDOException $e) {
            return array('status' => 'error', 'message' => 'Erreur lors de la suppression de la commande.');
        }
    }
}
