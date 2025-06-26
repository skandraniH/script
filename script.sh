#!/bin/bash

# 1. Mise à jour du système
echo "🔄 Mise à jour du système..."
sudo apt update && sudo apt upgrade -y

# 2. Installation d'Apache
echo "🌐 Installation du serveur Apache..."
sudo apt install apache2 -y

# 3. Activation et démarrage du service Apache
echo "🚀 Démarrage du service Apache..."
sudo systemctl enable apache2
sudo systemctl start apache2

# 4. Suppression des fichiers par défaut d'Apache
echo "🧹 Nettoyage de la page par défaut Apache..."
sudo rm -rf /var/www/html/*

# 5. Copie de ton site vers le dossier web (à adapter à ton dossier local)
echo "📁 Déploiement du site web..."
sudo cp -r ~/mon-site/* /var/www/html/

# 6. Attribution des bons droits
echo "🔐 Attribution des permissions..."
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# 7. Redémarrage d'Apache pour s'assurer que tout est pris en compte
echo "🔁 Redémarrage du serveur Apache..."
sudo systemctl restart apache2

# 8. Fin
echo "✅ Déploiement terminé !"
echo "👉 Accède à ton site via l'adresse IP du serveur ou http://localhost"
