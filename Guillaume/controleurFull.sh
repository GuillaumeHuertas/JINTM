#!/bin/bash

# Script qui vérifie toutes les isntallations

echo "Vérification des paquets ..."

# Demande la version de java
java -version 2>/dev/null 1>/dev/null 
# 2>/dev/null permet de ne pas afficher le résultat dans la console
# Si Java est installé le code retour est 0

#Check Java
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

# Check Javac
javac -version 2>/dev/null >/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202mJavac n'est pas installé !\e[0m"
     install1="no"
else 
     echo -e "\e[92mJavac est bien installé !\e[0m"
     install1="yes"
fi

# Check Maven
mvn -version >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202mMaven n'est pas installé !\e[0m"
     install2="no"
else
     echo -e "\e[92mMaven est bien installé !\e[0m"
     install2="yes"
fi

# Check Git
git version >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202mGit n'est pas installé !\e[0m"
     install3="no"
else
     echo -e "\e[92mGit est bien installé !\e[0m"
     install3="yes"
fi

# Check Curl
curl --version >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202mCurl n'est pas installé !\e[0m"
     install4="no"
else 
     echo -e "\e[92mCurl est bien installé !\e[0m"
     install4="yes"
fi

# Check node.js
node -v >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202mnode.js n'est pas installé !\e[0m"
     install5="no"
else 
     echo -e "\e[92mnode.js est bien installé !\e[0m"
     install5="yes"
fi

# Check npm
npm -v >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202mnpm n'est pas installé !\e[0m"
     install6="no"
else 
     # Affiche le message en Vert
     echo -e "\e[92mnpm est bien installé !\e[0m"
     install6="yes"
fi

# Check Angular
ng version >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202mAngular n'est pas installé !\e[0m"
     install7="no"
else 
     # Affiche le message en Vert
     echo -e "\e[92mAngular est bien installé !\e[0m"
     install7="yes"
fi


#######################################################################################
#######################################################################################

if [[ $install1 == "no" || $install2 == "no" ]] ; then
    echo "C'est la merde noir ! "
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
        echo '$install2'
        echo '$install3'
        echo '$install4'
        echo '$install5'
        echo '$install6'
        echo '$install7'




        #apt-get update && apt-get upgrade
        if [ "'$install1'" == "no" ] ; then
        apt-get install openjdk-8-jdk -y
        fi'
    






fi
echo "test1"

exit 0