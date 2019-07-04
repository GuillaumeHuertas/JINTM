#!/bin/bash

echo "Nous allons installer PostgreSQL et créer un user et une base de données pour JINTM"
echo "Nous auront besoin de votre mot de passe root pour poursuivre"
# Installe PostgreSQL
su -c "
# Met-à-jour les paquets
apt-get update
# Install
apt-get install postgresql postgresql-client
# Redémarre le serveur 
service postgresql restart
# Vérifie que le programme tourne en tâche de fond 
ps aux | grep postgres
# Mettre un conrol si la SGBD ne tourne pas

su - postgres -c \"
psql << EOF
CREATE USER jintm; 
ALTER USER jintm WITH ENCRYPTED PASSWORD 'jintm';
CREATE DATABASE jintm;
ALTER DATABASE jintm OWNER TO jintm;
EOF
\"
"


# \i configurationPSQL.sql;