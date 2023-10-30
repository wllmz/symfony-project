# symfony-project

Voici comment dockeriser une projet symfony.

# Prérequis
Docker et Docker Compose installés sur votre machine.

# Initialisation du projet

1- Clonage du dépôt

  ```sh
  git clone https://github.com/wllmz/symfony-project.git
  ```

# Configuration du fichier .env

Lorsque vous initialisez votre projet, le fichier .env joue un rôle crucial car il contient les valeurs par défaut des variables d'environnement nécessaires à l'application. Voici un guide pour configurer correctement ce fichier.

### Variables générales de Symfony

APP_ENV: Il s'agit de l'environnement dans lequel votre application Symfony fonctionne. Les valeurs courantes sont dev pour le développement et prod pour la production.
  ```sh
APP_ENV=dev
  ```
APP_SECRET: Une chaîne secrète qui est unique à votre application Symfony.
  ```sh
APP_SECRET=your_unique_secret_string
  ```

### Configuration de la base de données

La configuration de votre base de données est définie par la variable DATABASE_URL. Cette URL contient les informations nécessaires pour se connecter à votre base de données. Par exemple :

  ```sh
DATABASE_URL="postgresql://username:password@127.0.0.1:5432/dbname?serverVersion=version&charset=utf8"
  ```
Remplacez username, password, dbname, et version par vos propres valeurs.

### Configuration pour les environnements de Production et Préproduction :

Ces variables sont utilisées pour définir les informations de connexion spécifiques à chaque environnement.

##### . Production :

 ```sh
PROD_MYSQL_DATABASE=nom_de_la_base_production
PROD_MYSQL_USER=utilisateur_production
PROD_MYSQL_PASSWORD=mot_de_passe_production
PROD_MYSQL_ROOT_PASSWORD=mot_de_passe_root_production
  ```
### Accédez à l'application Prod

Ouvrez votre navigateur et accédez à http://localhost:8001 (ou le port que vous avez configuré) pour voir votre application en action.

#### . Préproduction :

 ```sh
PREPROD_MYSQL_DATABASE=nom_de_la_base_preproduction
PREPROD_MYSQL_USER=utilisateur_preproduction
PREPROD_MYSQL_PASSWORD=mot_de_passe_preproduction
PREPROD_MYSQL_ROOT_PASSWORD=mot_de_passe_root_preproduction
  ```

### Accédez à l'application Preprod

Ouvrez votre navigateur et accédez à http://localhost:8002 (ou le port que vous avez configuré) pour voir votre application en action.
