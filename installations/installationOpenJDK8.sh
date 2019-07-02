#!/bin/bash

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

echo "Nous allons avoir besoin de votre mot de passe root"

# Si la réponse est y installe et met-à-jour les paquets
if [ $response1 == "y" ] ; then
    
    # Connection en root (demande le mot de passe)
    # Lance les commandes root dans un flux 
    # Installe tous les paquets et donne les versions
    su -c '
    echo "##################################"
	echo "#### Installation de open JDK ####"
    echo "##################################"
    apt-get install openjdk-8-jdk -y
    exit'
else 
	echo "Les paquets ne seront pas installés"
fi
