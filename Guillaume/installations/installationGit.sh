#!/bin/bash

# Ce script permet d'installer Git

read -p "Voulez-vous installer Git  (y/N) " response1

# Si la réponse est vide donne la valeur N à la variable N (réponse par défaut)
if [ -z $response1 ] ; then
response="N"
fi

# Tant que la réponse n'est pas y ou N, boucle pour obtenir une des deux réponse souhaité 
while [[ "$response1" != "y" && "$response1" != "N" ]]
do
echo "Choisissez y ou N"
read -p "Voulez-vous installer  Git  (y/N) " response1
done

# Si la réponse est y met-à-jour et installe le paquet
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
	echo "###### Installation de Git #######"
    echo "##################################"
    apt-get install git -y
    echo "##################################"
	echo "####### Git en Version ###########"
    echo "##################################"
    git version
    exit'
else 
    # Affiche le message en rouge
    echo -e "\e[91mGit n'a pas été installé\e[0m"
fi
