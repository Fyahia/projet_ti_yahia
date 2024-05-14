CREATE OR REPLACE FUNCTION ajout_voiture(
    p_annee INT, 
    p_couleur TEXT, 
    p_prix DECIMAL(15,2), 
    p_kilometrage INT, 
    p_carburant TEXT, 
    p_type_boite TEXT, 
    p_image TEXT, 
    p_id_modele INT, 
    p_id_marque INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO voiture(annee, couleur, prix, kilometrage, carburant, type_boite, image, id_modele, id_marque)
    VALUES (p_annee, p_couleur, p_prix, p_kilometrage, p_carburant, p_type_boite, p_image, p_id_modele, p_id_marque);
END;
$$ LANGUAGE plpgsql;