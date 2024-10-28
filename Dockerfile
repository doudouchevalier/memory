# Utilise l'image de base Nginx officielle
FROM nginx:latest

# Installation de Nginx
RUN apt-get update && apt-get install -y file

# Copie du fichier de configuration Nginx dans le conteneur
COPY conf/nginx.conf /etc/nginx/

# Création d'un répertoire pour stocker les fichiers de l'application
RUN mkdir -p /var/concentration/html

# Définir le répertoire de travail
WORKDIR /var/concentration/html

# Copie des fichiers de l'application dans le conteneur
COPY /html/* /var/concentration/html

# Exposition des ports Nginx
EXPOSE 80

# Commande pour démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
