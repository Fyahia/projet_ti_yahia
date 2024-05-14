CREATE OR REPLACE FUNCTION ajouter_voiture(
    p_marque TEXT,
    p_modele TEXT,
    p_annee INT,
    p_couleur TEXT,
    p_prix DECIMAL,
    p_kilometrage INT,
    p_carburant TEXT,
    p_type_boite TEXT,
    p_image TEXT
) RETURNS VOID AS $$
BEGIN
INSERT INTO voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image)
VALUES (nextval('voiture_id_voiture_seq'), p_marque, p_modele, p_annee, p_couleur, p_prix, p_kilometrage, p_carburant, p_type_boite, p_image);
END;
$$ LANGUAGE plpgsql;
