#!/bin/bash

read -p "Nous allons installer open JDK8, Git et node.js (LTS), vous confirmez ?  (y/N) " response1

# Si la réponse est vide donne la valeur N à la variable N (réponse par défaut)
if [ -z $response1 ] ; then
response1="N"
fi

# Tant que la réponse n'est pas y ou N, boucle pour obtenir une des deux réponse souhaité 
while [[ "$response1" != "y" && "$response1" != "N" ]]
do
echo "Choisissez y ou N"
read -p "Nous allons installer open JDK8, Git et node.js (LTS), vous confirmez ?  (y/N) " response1
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
	echo "###### Installation de Git #######"
    echo "##################################"
    apt-get install git -y
    echo "##################################"
	echo "####### Installation Curl ########"
    echo "##################################"
    apt-get install curl software-properties-common -y
    curl -sL https://deb.nodesource.com/setup_10.x | bash -
    echo "##################################"
	echo "#### Installation de node.js #####"
    echo "##################################"
    apt-get install nodejs -y
    echo "##################################"
	echo "######## Java en version #########"
    echo "##################################"
    java -version
    echo "##################################"
	echo "######## Javac en version ########"
    echo "##################################"
    javac -version
    echo "##################################"
	echo "####### Git en Version ###########"
    echo "##################################"
    git version
    echo "##################################"
	echo "######## Curl en version #########"
    echo "##################################"
    curl --version
    echo "##################################"
	echo "####### node.js en version #######"
    echo "##################################"
    node -v
    echo "##################################"
	echo "######### npm en version #########"
    echo "##################################"
    npm -v
    echo "##################################"
	echo "######## Fin installation ########"
    echo "##################################"
    exit'
    
# Sinon affiche un message
else 
    # Affiche le message en rouge
    echo -e "\e[91mLes paquets ne seront pas installés\e[0m"
fi
