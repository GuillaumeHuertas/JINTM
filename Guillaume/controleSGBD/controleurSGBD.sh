#!/bin/bash

# Choix de la SGBD
echo "Quel Base de Donnée Relationelle voulez-vous utiliser ?"
echo "(1) PosgreSQL, (2) MariaDB, (3) H2"
read response
echo $response

# Si la réponse n'est pas une des options proposé,
# boucle jusqu'à obtenir une réponse satisfaisante
while [[ "$response" != "1" && "$response" != "2" && "$response" != "3" ]]
do
echo "Quel Base de Donnée Relationelle voulez-vous utiliser ?"
echo "(1) PosgreSQL, (2) MariaDB, (3) H2"
read response
done

if [ $response == "1" ] ; then
	echo "Vous avez choisi une SGBD PostegreSQL"
    postgreSQL/controleurPostgreSQL.sh
elif [ $response == "2" ] ; then
	echo "Vous avez choisi une SGBD MariaDB"
else

    echo "Vous avez choisi une SGBD H2"
    echo "Pas encore implementé"
fi
