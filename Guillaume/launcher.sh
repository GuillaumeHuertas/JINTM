#!/bin/bash

read -p "Voulez vous lancer JINTM ? (y/N) " response

if [ -z $response ] ; then
response="N"
fi

while [[ "$response" != "y" && "$response" != "N" ]]
do
echo "Choisissez y ou N"
read -p "Voulez vous lancer JINTM ? (y/N)  " response
done

if [ $response == "y" ] ; then


	 wget https://raw.githubusercontent.com/GuillaumeHuertas/JINTM/master/Guillaume/Installeur.sh
     chmod 755 Installeur.sh
     ./Installeur.sh

else 

	echo "Aurevoir !"

fi