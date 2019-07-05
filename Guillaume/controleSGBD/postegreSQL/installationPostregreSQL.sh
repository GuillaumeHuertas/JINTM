#!/bin/bash

echo "Nous allons installer PostgreSQL et créer un user et une base de données pour JINTM"
read -p "Validez-vous ? (y/N) " response

if [ -z $response ] ; then
response="N"
fi

while [[ "$response" != "y" && "$response" != "N" ]]
do
echo "Choisissez y ou N"
read -p "Validez-vous ? (y/N) " response
done

if [ $response == "y" ] ; then
	
echo "Nous auront besoin de votre mot de passe root pour poursuivre"
# Installe PostgreSQL
: << 'EOF'
Le script qui suit va faire plusieurs chose, il va ouvrir un premier flux en su pour installer les paquets nécessaires puis,
dans ce flux il va ouvrir un nouveau flux pour se connecter en tant qu'utilisateur postgres qui lui permettra d'ouvrir un 
dernier flux pour travailler sur psql permetant de créer un user et une base de donnée. 
EOF
su -c "
# Met-à-jour les paquets
apt-get update
# Install
apt-get install postgresql postgresql-client
# Redémarre le serveur 
service postgresql restart
# Vérifie que le programme tourne en tâche de fond 
ps aux | grep postgres
# Mettre un controle si la SGBD ne tourne pas

su - postgres -c \"
psql << EOF
CREATE USER jintm; 
ALTER USER jintm WITH ENCRYPTED PASSWORD 'jintm';
CREATE DATABASE jintm;
ALTER DATABASE jintm OWNER TO jintm;
EOF
\"
"

else 
	echo "Vous ne pourrez lancer votre programme sans base de donnée ! "
fi
