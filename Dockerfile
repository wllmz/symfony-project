# Utilisation de l'image PHP 8.1 FPM
FROM php:8.1-fpm

# Mise à jour des paquets et installation des dépendances
RUN apt-get update && apt-get install -y unzip git libzip-dev && \
    docker-php-ext-install pdo pdo_mysql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Ajouter Composer et autoriser en tant que superutilisateur
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

# Configuration du répertoire de travail
WORKDIR /var/www/html

# Copier le fichier composer.json et installer les dépendances
COPY composer.json ./
RUN composer install --no-interaction --optimize-autoloader

# Réglage des permissions
RUN chown -R www-data:www-data .

# Configuration PHP pour la production
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

CMD ["php-fpm"]
