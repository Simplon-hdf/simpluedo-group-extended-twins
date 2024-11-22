\c simpluedo

CREATE TABLE IF NOT EXISTS positions (
    id_position SERIAL PRIMARY KEY,
    id_salle INTEGER REFERENCES salles(id_salle),
    id_perso INTEGER REFERENCES personnages(id_perso),
    heure_arrivee TIME,
    heure_depart TIME
);

CREATE OR REPLACE FUNCTION update_position() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.heure_depart IS NULL THEN
        INSERT INTO positions (id_salle, id_perso, heure_arrivee, heure_depart)
        VALUES (NEW.id_salle, NEW.id_perso, NEW.heure_arrivee, NEW.heure_depart);
    ELSE
        UPDATE positions
        SET heure_depart = NEW.heure_depart
        WHERE id_salle = NEW.id_salle AND id_perso = NEW.id_perso AND heure_depart IS NULL;
    END IF;
    RETURN NEW;
END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER log_update_visiter
AFTER INSERT OR UPDATE ON visiter
FOR EACH ROW
EXECUTE FUNCTION update_position();

