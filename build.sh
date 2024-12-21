#!/bin/bash
set -e

# Installer les dépendances
composer install --no-dev --optimize-autoloader --ignore-platform-reqs

# Configurer les permissions
chmod -R 777 var/cache var/log
