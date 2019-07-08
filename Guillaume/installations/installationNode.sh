#!/bin/bash

# Ce script permet d'installer Node en version LTS

read -p "Voulez-vous installer Node.js en version LTS (comprend npm) (y/N) " response1

# Si la réponse est vide donne la valeur N à la variable N (réponse par défaut)
if [ -z $response1 ] ; then
response="N"
fi

# Tant que la réponse n'est pas y ou N, boucle pour obtenir une des deux réponse souhaité 
while [[ "$response1" != "y" && "$response1" != "N" ]]
do
echo "Choisissez y ou N"
read -p "Voulez-vous installer Node.js en version LTS (comprend npm) (y/N) " response1
done

# Si la réponse est y installe et met-à-jour les paquets
if [ $response1 == "y" ] ; then
    echo "Nous allons avoir besoin de votre mot de passe root"
    # Connection en root (demande le mot de passe)
    # Lance les commandes root dans un flux 
    # Installe tous les paquets et donne les versions
    su -c '
    echo "##################################"
	echo "#### Mise-à-jour des paquets #####"
    echo "##################################"
    apt-get update
    echo "##################################"
	echo "#### Installation des paquets ####"
    echo "##################################"
    apt-get upgrade -y
    echo "##################################"
	echo "#### Installation de node.js #####"
    echo "##################################"
    curl -sL https://deb.nodesource.com/setup_10.x | bash -
    apt-get install nodejs -y
    npm install -g npm@latest
    echo -e "\e[92m##################################"
	echo "####### Node en version :  #######"
    echo "##################################\e[0m"
    node -v
    echo -e "\e[92m##################################"
	echo "####### npm en version :  ######"
    echo -e "##################################\e[0m"
    npm -v
    exit'
else 
    # Affiche le message en rouge
    echo -e "\e[91mNode.js n'a pas été installé\e[0m"
fi
