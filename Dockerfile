FROM php:8.1-fpm

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    libzip-dev
# Installer les extensions PHP nécessaires
RUN docker-php-ext-install pdo pdo_mysql
# Ajouter Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# Si vous voulez autoriser Composer en tant que superutilisateur
ENV COMPOSER_ALLOW_SUPERUSER=1

# Set the working directory
WORKDIR /var/www/html

COPY composer.json /var/www/html/composer.json
RUN composer clear-cache

# Supprimez les dépendances de développement et installez les dépendances de production uniquement
RUN composer install --no-interaction --optimize-autoloader

# Réglez les permissions si nécessaire
RUN chown -R www-data:www-data .

# Configurez le fichier ini pour PHP pour la production
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Autres configurations spécifiques à la production...

CMD ["php-fpm"]