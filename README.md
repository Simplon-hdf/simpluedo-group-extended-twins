# Sommaire
- [Dictionnaire de données](/docs/dictionnaire-donnees.md)
- [MCD](/docs/BDD/MCD.png)
- [MLD](/docs/BDD/MLD.png)
- [MPD](/docs/BDD/MPD.png)
- [Fichier looping](/docs/BDD/mcd.loo)
- [Script SQL de génération de la BDD]
- [Script SQL permettant d'intégrer les données]
- [Guide d'utilisation des scripts]
- [Requêtes SQL dans le README.md]

# Contexte du projet
En tant que développeur, vous devez réaliser un système informatique permettant de gérer une partie de jeu de société que vous avez envie de réaliser avec vos amis.<br>

Ce jeu de société est basé sur le Cluedo avec des personnages que les joueurs déplacent au sein d'un manoir, dans les différentes pièces de celui-ci.
<br>
Vous devez donc créer un environnement permettant de stocker, pour une partie donnée d'un jeu, les déplacements des personnages de chaque joueur.
<br>
Comme Rome ne s'est pas construite en un jour, vous allez commencer par la mise en place d'un site web permettant de procéder à différentes opérations de recherches à propos de l'emplacement des différents personnages.
<br>
Sauf que la partie site web n'est pas pour tout de suite.
<br>
Avant cela, vous avez besoin d'une base de données pour le stockage. Et donc de la concevoir et de la mettre en place !

# Utilisation de la base de données
## Utiliser les scripts de création de la base de données
```
psql d-postgres -U postgres -f <sql-file-path>
```
Remplacer <sql-file-path> par (dans l'ordre):
- create-db-script.sql
- populate-dp-script.sql
- triggers.sql
- procedures-db-script.sql<br>
Pour les utilisateurs mac pensez a remplacer "-U postgres" par "-U <votre-nom-de-superuser-postgres>"!!!

# Requêtes à réaliser

- Lister tous les personnages du jeu
```
SELECT * FROM personnages;
```
- Lister chaque joueur et son personnage associé
```
SELECT * FROM utilisateurs u
INNER JOIN roles r ON r.id_roles = u.id_roles
INNER JOIN personnages p ON p.id_perso = u.id_perso
WHERE r.nom_role = 'Enqueteur';

```
- Afficher la liste des personnages présents dans la cuisine entre 08:00 et 09:00
```
SELECT * FROM personnages p
INNER JOIN visiter v ON p.id_perso = v.id_perso
WHERE (v.heure_arrivee BETWEEN '8:00' AND '9:00')
OR (v.heure_depart BETWEEN '8:00' AND '9:00')
OR (v.heure_arrivee < '8:00' AND v.heure_depart > '9:00');
```
- Afficher les pièces où aucun personnage n'est allé
```
SELECT * FROM pieces p
INNER JOIN personnages pe on p.id_piece = pe.id_piece
WHERE pe.id_piece IS NULL;FROM salles s
WHERE NOT EXISTS (  SELECT 1 
                    FROM visiter v
                    WHERE v.id_salle = s.id_salle);
```

- Compter le nombre d'objets par pièce
```
SELECT COUNT(*) FROM visiter v
INNER JOIN salles s ON v.id_salle = s.id_salle
GROUP BY salle.nom_salle
```
- Ajouter une pièce
```
INSERT INTO salles (id_salle, nom_salle) VALUES
(1, 'Salle de bal');
```
- Modifier un objet
```
UPDATE salles SET nom_salle = 'Salle de bain'
WHERE nom_salle = 'Salle de bal';
```
- Supprimer une pièce
```
DELETE FROM salles
WHERE salle = 'Salle de bal';
```