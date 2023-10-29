# symfony-project

Voici comment dockeriser une projet symfony.

# Prérequis
Docker et Docker Compose installés sur votre machine.

# Initialisation du projet

1- Clonage du dépôt

  ```sh
  git clone https://github.com/wllmz/symfony-project.git
  ```

2- Configuration des variables d'environnement
 
 ajout d'un fichier .ENV

# Configuration des bases de données
Votre projet Docker est configuré pour fonctionner avec deux environnements distincts : production et préproduction. Ces environnements ont des bases de données MySQL séparées, chacune avec sa propre configuration.

### Configuration de la production
Pour l'environnement de production, le service est nommé db_prod et utilise l'image MySQL version 5.7. Les variables d'environnement pour la configuration de cette base de données doivent être définies dans votre fichier .env :

  ```sh
PROD_MYSQL_DATABASE=nom_de_la_base_production
PROD_MYSQL_USER=utilisateur_production
PROD_MYSQL_PASSWORD=mot_de_passe_production
PROD_MYSQL_ROOT_PASSWORD=mot_de_passe_root_production
 ```

### Configuration de la préproduction
Pour l'environnement de préproduction, le service est nommé db_preprod et utilise également l'image MySQL version 5.7. Les variables d'environnement pour la configuration de cette base de données doivent être définies dans votre fichier .env :

```sh
PREPROD_MYSQL_DATABASE=nom_de_la_base_preproduction
PREPROD_MYSQL_USER=utilisateur_preproduction
PREPROD_MYSQL_PASSWORD=mot_de_passe_preproduction
PREPROD_MYSQL_ROOT_PASSWORD=mot_de_passe_root_preproduction
 ```

# Lancer les services Docker

Utilisez Docker Compose pour démarrer les services nécessaires :

### Preprod
  ```sh
docker-compose -f docker-compose.preprod.yml up -d
 ```

### Accédez à l'application Preprod

Ouvrez votre navigateur et accédez à http://localhost:8002 (ou le port que vous avez configuré) pour voir votre application en action.

### Prod
  ```sh
docker-compose -f docker-compose.prod.yml up -d
 ```

### Accédez à l'application Preprod

Ouvrez votre navigateur et accédez à http://localhost:8001 (ou le port que vous avez configuré) pour voir votre application en action.
