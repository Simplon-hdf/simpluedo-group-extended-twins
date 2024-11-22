# simpluedo-group-extended-twins
Brief 'Simpluedo" du groupe "Extended Twins" (Yohan et Gabriel)

# Utilisation de la base de données
## Utiliser le script de création de la base de données
```
psql d-postgres -U postgres -f <sql-file-path>
```
Pour les utilisateurs mac pensez a remplacer "-U postgres" par "-U <votre-nom-de-superuser-postgres>"!!!

# Requêtes à réaliser

- Lister tous les personnages du jeu
```
SELECT * FROM personnages;
```
- Lister chaque joueur et son personnage associé
```
SELECT * FORM utilisateur u
INNER JOIN roles r ON r.id_roles = p.id_roles
INNER JOIN personnage p ON p.id_perso = p.id_perso
WHERE r.nom_role = 'Enqueteur'

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
SELECT * 
```
- Compter le nombre d'objets par pièce

- Ajouter une pièce

- Modifier un objet

- Supprimer une pièce