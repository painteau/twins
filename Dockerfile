# Utilisation d'Ubuntu slim comme base
FROM ubuntu:latest

# Installation des dépendances
RUN apt-get update && apt-get install -y \
    snapd \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Installation de Go via Snap
RUN snap install go --classic

# Installation de twins
RUN /snap/bin/go install code.rocketnine.space/tslocum/twins@latest

# Création des dossiers nécessaires
RUN mkdir -p /home/twins/certs /home/twins/sites

# Définition des variables d'environnement
ENV DOMAINS="example.com example.net"

# Copie du script d'entrée
COPY start /usr/local/bin/start
RUN chmod +x /usr/local/bin/start

# Exposition du port Gemini
EXPOSE 1965

# Définition du point d'entrée
CMD ["/usr/local/bin/start"]
