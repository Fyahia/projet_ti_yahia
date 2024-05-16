<?php
class ClientDB {
    private $_db;

    public function __construct($db) {
        $this->_db = $db;
    }

    public function getAllClients() {
        $query = "SELECT * FROM client";
        $result = $this->_db->query($query);
        if (!$result) {
            throw new Exception("Erreur lors de l'exécution de la requête SQL");
        }
        $clients = $result->fetchAll(PDO::FETCH_ASSOC);
        return $clients;
    }
    public function getClientById($id) {
    $stmt = $this->_db->prepare("SELECT * FROM client WHERE id_client = :id");
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}
}
?>