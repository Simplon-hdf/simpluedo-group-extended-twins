DROP DATABASE simpluedo;
CREATE USER simpluedo WITH ENCRYPTED PASSWORD 'trouvemoi';
CREATE DATABASE simpluedo;
GRANT all privileges ON DATABASE simpluedo to simpluedo;

\c simpluedo;

CREATE TABLE roles (
    id_roles VARCHAR(50) PRIMARY KEY,
    nom_role VARCHAR(50) UNIQUE,
);

CREATE TABLE personnages (
    id_perso INTEGER PRIMARY KEY,
    nom_perso VARCHAR(50)
);

CREATE TABLE salles (
    id_salle INTEGER PRIMARY KEY,
    nom_salle VARCHAR(50) UNIQUE
);

CREATE TABLE utilisateurs (
    uuid_users UUID PRIMARY KEY,
    pseudo_users VARCHAR(50),
    id_roles VARCHAR(50) REFERENCES roles(id_roles),
    id_perso INTEGER REFERENCES personnages(id_perso)
);

CREATE TABLE visiter (
    heure_arrivee TIME,
    heure_depart TIME,
    id_perso INTEGER REFERENCES personnages(id_perso),
    id_salle INTEGER REFERENCES salles(id_salle),
    PRIMARY KEY (id_perso, id_salle, heure_arrivee)
);
CREATE TABLE objets (
    id_objet INTEGER PRIMARY KEY,
    nom_objet VARCHAR(50) UNIQUE,
    id_salle INTEGER REFERENCES salles(id_salle)
);