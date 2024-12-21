
# Installer Composer
COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

# Installer les extensions PHP nécessaires
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    libicu-dev \
    libonig-dev \
    libzip-dev \
    && docker-php-ext-install intl mbstring zip pdo_mysql
   
# Installer Composer
COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers du projet
COPY . .

# Installer les dépendances PHP
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs

# Configurer les permissions
RUN chmod -R 777 var/cache var/log

# Exposer le port
EXPOSE 8000

# Commande par défaut
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
COPY build.sh /app/
RUN chmod +x /app/build.sh
RUN /app/build.sh
