#!/bin/bash

read -p "Voulez vous lancer JINTM ? (y/N) " response

# Affecte la chaîne "N" à réponse
if [ -z $response ] ; then
response="N"
fi

# Si la réponse n'est pas une des options proposé,
# boucle jusqu'à obtenir une réponse satisfaisante
while [[ "$response" != "y" && "$response" != "N" ]]
do
echo "Choisissez y ou N"
read -p "Voulez vous lancer JINTM ? (y/N)  " response
done

# Si la réponse est "y", télécharge les fichiers nécessaire et exécute le script approprié
if [ $response == "y" ] ; then
    # Télécharge Installeur.sh du dépôt distant
	wget https://raw.githubusercontent.com/GuillaumeHuertas/JINTM/master/Guillaume/Installeur.sh
    # Rend le fichier exécutable
    chmod 755 Installeur.sh
    # Télécharge controleur.sh.sh du dépôt distant
    wget https://raw.githubusercontent.com/GuillaumeHuertas/JINTM/master/Guillaume/controleur.sh
    # Rend le fichier exécutable
    chmod 755 controleur.sh
    # Exécute le script Instaleur.sh
    ./Installeur.sh
else 

	echo "Aurevoir !"

fi