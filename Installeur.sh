#!/bin/bash

read -p "Avez-vous Node.js, java jdk8 et git installé ? (Y/n) " response

if [ -z $response ] ; then
response="Y"
fi

while [[ "$response" != "Y" && "$response" != "n" ]]
do
echo "Choisissez Y ou n"
read -p "Avez-vous Node.js, java jdk8 et git installé ? (Y/n) " response
done

if [ $response == "n" ] ; then

	 ./ressources.sh

else 

	echo "pas grave"

fi

echo "fini"


