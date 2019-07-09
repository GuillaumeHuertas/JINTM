#!/bin/bash

echo "Vérification des paquets ..."

# Demande la version de java
java -version 2>/dev/null 1>/dev/null 
# 2>/dev/null permet de ne pas afficher le résultat dans la console
# Si Java est installé le code retour est 0

# Si le code retours est différents de 0 un message nous averti
# que Java n'est pas installlé
if [ $? != 0 ] ; then
     # Affiche le message en Jaune
     echo -e "\e[38;5;202mJava n'est pas installé\e[0m"
     # Stocke la réponse "no" dans la varibale install1
     install1="no"
else 
     # Affiche le message en Vert
     echo -e "\e[92mJava est bien installé !\e[0m"
     # Stocke la réponse "yes" dans la varibale install1
     install1="yes"
fi

# Demande la version de Javac
javac -version 2>/dev/null >/dev/null
# Idem 
if [ $? != 0 ] ; then
     # Affiche le message en Jaune
     echo -e "\e[38;5;202mJavac n'est pas installé !\e[0m"
     # Stocke la réponse "no" dans la varibale install1
     install1="no"
else 
     # Affiche le message en Vert
     echo -e "\e[92mJavac est bien installé !\e[0m"
     # Stocke la réponse "yes" dans la varibale install1
     install1="yes"
fi


read -p "Voulez-vous que nous installions les packages manquants ? (Y/n)" response

if [ -z $response ] ; then
response="Y"
fi

while [[ "$response" != "Y" && "$response" != "n" ]]
do
echo "Choisissez Y ou n"
read -p "Voulez-vous que nous installions les packages manquants ? (Y/n)" response
done

if [ $response == "n" ] ; then
	echo "Vous ne pourrez utiliser le générateur de code ..."
    exit 1
else 
	echo "C'est parti !! "
    su -c '

        echo '$install1'
        #apt-get update && apt-get upgrade
        #if ["'$install1'" == "no"] ; then
        #apt-get install openjdk-8-jdk -y
        #fi'
    '
    






fi