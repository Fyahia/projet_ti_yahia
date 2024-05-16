CREATE OR REPLACE FUNCTION ajouter_commande(
    p_montant DECIMAL,
    p_id_voiture INT,
    p_id_client INT
) RETURNS VOID AS $$
BEGIN
    INSERT INTO commande (id_commande, montant, id_voiture, id_client)
    VALUES (nextval('commande_id_commande_seq'), p_montant, p_id_voiture, p_id_client);
END;
$$ LANGUAGE plpgsql;
