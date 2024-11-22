\c simpluedo;
INSERT INTO salles (nom_salle) VALUES
('Salle de bal'),
('Cuisine'),
('Bibliothèque'),
('Salon'),
('Salle à manger'),
('Hall'),
('Jardin d hiver'),
('Bureau'),
('Salle de billard');

INSERT INTO objets (nom_objet, id_salle) VALUES
('Poignard', 1),
('Revolver', 2),
('Corde', 3),
('Chandelier', 4),
('Clé anglaise', 5),
('Tuyau de plomb', 6);


INSERT INTO personnages (nom_perso) VALUES
('Mademoiselle Rose'),
('Colonel Moutarde'),
('Révérend Olive'),
('Madame Leblanc'),
('Professeur Violet'),
('Madame Pervenche');


INSERT INTO roles (nom_role) VALUES
('MJ'),
('ENQ'),
('OBS');


INSERT INTO utilisateurs (pseudo_users, id_roles, id_perso) VALUES
('user1', 1, null),
('user2', 2, 1),
('user3', 3, null);