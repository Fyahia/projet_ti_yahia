CREATE OR REPLACE FUNCTION delete_voiture(p_id integer) 
RETURNS integer AS 
$$
BEGIN
    DELETE FROM voiture WHERE id_voiture = p_id;
    RETURN 1;
END;
$$ LANGUAGE plpgsql;
