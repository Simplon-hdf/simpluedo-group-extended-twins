\c simpluedo
DROP FUNCTION create_position_table_function();
CREATE OR REPLACE FUNCTION create_position_table_function() RETURNS trigger AS $$
BEGIN
    CREATE TABLE positions (
        id_position serial PRIMARY KEY,
        id_salle INTEGER REFERENCES salles(id_salle),
        id_perso INTEGER REFERENCES personnages(id_perso)
    );
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER create_postition_table_trigger
    AFTER UPDATE ON visiter
    EXECUTE FUNCTION create_position_table_function();