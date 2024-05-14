DROP FUNCTION IF EXISTS update_voiture(integer,text,text,integer,text,decimal,integer,text,text,text);

CREATE OR REPLACE FUNCTION update_voiture(p_id_voiture integer, p_marque text, p_modele text, p_annee integer, p_couleur text, p_prix decimal, p_kilometrage integer, p_carburant text, p_type_boite text, p_image text)
RETURNS integer AS $$
BEGIN
    EXECUTE format('UPDATE voiture SET marque = %L, modele = %L, annee = %L, couleur = %L, prix = %L, kilometrage = %L, carburant = %L, type_boite = %L, image = %L WHERE id_voiture = %L', p_marque, p_modele, p_annee, p_couleur, p_prix, p_kilometrage, p_carburant, p_type_boite, p_image, p_id_voiture);
    RETURN 1;
END;
$$ LANGUAGE plpgsql;