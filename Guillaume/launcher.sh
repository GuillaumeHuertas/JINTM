#!/bin/bash

echo "Voulez vous lancer JINTM ? (y/N) "

if [ -z $response ] ; then
response="N"
fi

while [[ "$response" != "y" && "$response" != "N" ]]
do
echo "Choisissez y ou N"
read -p "Voulez vous lancer JINTM ? (y/N)  " response
done

if [ $response == "Y" ] ; then

	 wget https://github.com/GuillaumeHuertas/JINTM/Guillaume/installeur.sh

else 

	echo "Aurevoir !"

fi