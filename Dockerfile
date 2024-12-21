# Choisir une image de base avec PHP
FROM php:8.2-fpm

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copier le code dans le conteneur
COPY . /app/

# Créer les répertoires nécessaires pour Nginx
RUN mkdir -p /var/log/nginx && mkdir -p /var/cache/nginx

# Exécuter composer install
RUN composer install --ignore-platform-reqs

# Autres étapes de configuration...
# Changer les permissions pour le répertoire
RUN chown -R www-data:www-data /app

# Exécuter composer install
RUN composer install --ignore-platform-reqs
