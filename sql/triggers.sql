\c simpluedo
CREATE OR REPLACE FUNCTION update_position_function()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO positions (id_salle, id_perso)
    VALUES (NEW.id_salle, NEW.id_perso);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_position_trigger
AFTER INSERT ON visiter
FOR EACH ROW
EXECUTE FUNCTION update_position_function();

