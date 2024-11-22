
-- Se connecter à la base de données simpluedo
\c simpluedo

-- Créer la table positions si elle n'existe pas déjà
-- Cette table enregistre les positions des personnages en temps réel
CREATE TABLE IF NOT EXISTS positions (
    id_position SERIAL PRIMARY KEY, -- Identifiant unique pour chaque position
    id_salle INTEGER REFERENCES salles(id_salle), -- Référence à l'identifiant de la salle
    id_perso INTEGER REFERENCES personnages(id_perso), -- Référence à l'identifiant du personnage
    heure_arrivee TIME, -- Heure d'arrivée du personnage dans la salle
    heure_depart TIME -- Heure de départ du personnage de la salle
);

-- Créer ou remplacer la fonction update_position
-- Cette fonction est déclenchée après chaque insertion ou mise à jour dans la table visiter
CREATE OR REPLACE FUNCTION update_position() RETURNS TRIGGER AS $$
BEGIN
    -- Si l'heure de départ est NULL, cela signifie que le personnage vient d'arriver
    IF NEW.heure_depart IS NULL THEN
        -- Insérer une nouvelle ligne dans la table positions avec les nouvelles valeurs
        INSERT INTO positions (id_salle, id_perso, heure_arrivee, heure_depart)
        VALUES (NEW.id_salle, NEW.id_perso, NEW.heure_arrivee, NEW.heure_depart);
    ELSE
        -- Sinon, mettre à jour l'heure de départ pour la ligne correspondante dans la table positions
        UPDATE positions
        SET heure_depart = NEW.heure_depart
        WHERE id_salle = NEW.id_salle AND id_perso = NEW.id_perso AND heure_depart IS NULL;
    END IF;
    -- Retourner la nouvelle ligne pour indiquer que le trigger a été exécuté avec succès

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Créer le trigger log_update_visiter
-- Ce trigger est déclenché après chaque insertion ou mise à jour dans la table visiter
CREATE TRIGGER log_update_visiter
AFTER INSERT OR UPDATE ON visiter
FOR EACH ROW
EXECUTE FUNCTION update_position();
