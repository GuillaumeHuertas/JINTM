#!/bin/bash

# Script permetant d'installer tous les programme nécesssaire pour le générateur de code
read -p "Avez-vous Node.js, java jdk8, Curl et git installé ? (Y/n) " response

if [ -z $response ] ; then
response="Y"
fi

while [[ "$response" != "Y" && "$response" != "n" ]]
do
echo "Choisissez Y ou n"
read -p "Avez-vous Node.js, java jdk8, Curl et git installé ? (Y/n) " response
done

if [ $response == "n" ] ; then
	# Lance le script installationAll. sh qui installe tout les programme nécessaires
	./installations/installationAll.sh
else 
	echo "J'espère que tout est bien installé !"
fi

# Préviens l'utilisateur que le programme va lancer un script de contrôle
echo "Nous allons vérifier que vous dites la vérité !"
./controleur.sh
echo "fini"


