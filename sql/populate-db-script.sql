\c simpluedo;
INSERT INTO salles (id_salle, nom_salle) VALUES
(1, 'Salle de bal'),
(2, 'Cuisine'),
(3, 'Bibliothèque'),
(4, 'Salon'),
(5, 'Salle à manger'),
(6, 'Hall'),
(7, 'Jardin d hiver'),
(8, 'Bureau'),
(9, 'Salle de billard');

INSERT INTO objets (id_objet, nom_objet, id_salle) VALUES
(1, 'Poignard', 1),    
(2, 'Revolver', 2),    
(3, 'Corde', 3),     
(4, 'Chandelier', 4),  
(5, 'Clé anglaise', 5),
(6, 'Tuyau de plomb', 6); 

INSERT INTO personnages (nom_perso, id_perso) VALUES
('Mademoiselle Rose', 1),
('Colonel Moutarde', 2),
('Révérend Olive', 3),
('Madame Leblanc', 4),
('Professeur Violet', 5),
('Madame Pervenche', 6);

INSERT INTO roles (id_roles, nom_role ) VALUES
('MJ', 'Maitre du jeu'),
('ENQ', 'Enqueteur'),
('OBS', 'Observateur');