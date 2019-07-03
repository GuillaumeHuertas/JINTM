#!/bin/bash

# Ce script permet d'installer openJDK8

read -p "Voulez-vous installer open JDK8  (y/N) " response1

# Si la réponse est vide donne la valeur N à la variable N (réponse par défaut)
if [ -z $response1 ] ; then
response="N"
fi

# Tant que la réponse n'est pas y ou N, boucle pour obtenir une des deux réponse souhaité 
while [[ "$response1" != "y" && "$response1" != "N" ]]
do
echo "Choisissez y ou N"
read -p "Voulez-vous installer open JDK8  (y/N) " response1
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
	echo "#### Installation de open JDK ####"
    echo "##################################"
    apt-get install openjdk-8-jdk -y
    echo "##################################"
	echo "####### Java en version :  #######"
    echo "##################################"
    java -version
    echo -e "\e[92m##################################"
	echo "####### Javac en version :  ######"
    echo "##################################\e[0m"
    javac -version
    exit'
else 
    # Affiche le message en rouge
    echo -e "\e[91mOpenJDK8 n'a pas été installé\e[0m"
fi
