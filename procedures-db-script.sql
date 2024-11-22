\c simpluedo
-- Lister tous les objets situés dans une pièce passée en paramètre

CREATE OR REPLACE PROCEDURE liste_objets(nom_piece varchar(50))
LANGUAGE SQL
AS $$
SELECT COUNT(*) FROM objets o
INNER JOIN salles s ON o.id_salle = s.id_salle
WHERE s.nom_salle = (nom_piece);
$$;

-- Ajout d'un objet passé en paramètre et association avec la pièce concernée
a
CREATE OR REPLACE PROCEDURE ajout_piece(nom_objet varchar(50), nom_piece varchar(50))
LANGUAGE SQL
AS $$
    INSERT INTO salles (nom_salle)
    SELECT nom_piece
    WHERE NOT EXISTS (SELECT 1 FROM salles WHERE nom_salle = nom_piece)
    RETURNING id_salle;

    UPDATE objets
    SET id_salle = (SELECT id_salle FROM salles WHERE nom_salle = nom_piece)
    WHERE id_objet = id_objet
$$;
    
