# Dockerfile
FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git unzip libicu-dev libzip-dev

RUN docker-php-ext-install \
    pdo_mysql \
    mysqli \
    intl \
    zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN a2enmod rewrite

WORKDIR /var/www/html
COPY . .
RUN composer install --no-interaction
RUN chown -R www-data:www-data var/
RUN chmod -R 777 var/

COPY apache.conf /etc/apache2/sites-available/000-default.conf

------
7ot command hethom mba3ed :

docker-compose down -v
docker-compose build --no-cache
docker-compose up -d

docker-compose exec app php bin/console doctrine:migrations:migrate

docker-compose exec app php bin/console cache:clear
