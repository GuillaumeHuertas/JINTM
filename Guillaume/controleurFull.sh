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

# Si l'un des paquets testés n'est pas installé, le if se lance
if [[ $install1 == "no" || $install2 == "no" || $install3 == "no" \
|| $install4 == "no" || $install5 == "no" || $install6 == "no" \
|| $install7 == "no" ]] ; then
    
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

            # Met-à-jour et installe les paquets 
            apt-get update >/dev/null 2>/dev/null
            apt-get upgrade >/dev/null 2>/dev/null

            #Installation JDK 8 
            if [ "'$install1'" == "no" ] ; then
            echo "Installation de OpenJDK 8 ..."
            apt-get install openjdk-8-jdk -y >/dev/null 2>/dev/null
            fi

            # Installation Maven
            if [ "'$install2'" == "no" ] ; then
            echo "Installation de Maven ..."
            apt-get install maven -y >/dev/null 2>/dev/null
            fi

            # Installation Git
            if [ "'$install3'" == "no" ] ; then
            echo "Installation de Git ..."
            apt-get install git -y >/dev/null 2>/dev/null
            fi

            # Installation Curl
            if [ "'$install4'" == "no" ] ; then
            echo "Installation de Curl ..."
            apt-get install curl software-properties-common -y >/dev/null 2>/dev/null
            fi

             # Installation Node.js
            if [ "'$install5'" == "no" ] ; then
            echo "Installation de Node.js ..."
            curl -sL https://deb.nodesource.com/setup_10.x | bash - >/dev/null 2>/dev/null
            apt-get install nodejs -y >/dev/null 2>/dev/null
            fi

            # Installation nmp latest
            if [ "'$install6'" == "no" ] ; then
            echo "Installation de npm latest ..."
            echo "yes" | npm install -g npm@latest >/dev/null 2>/dev/null
            fi

            # Installation nmp latest
            if [ "'$install7'" == "no" ] ; then
            echo "Installation de npm latest ..."
            echo "yes" | npm install -g @angular/cli >/dev/null 2>/dev/null
            fi'

            # Relance le controleur pour vérifier que tout est bien installlé !
            ./controleurFull.sh
    
    fi
else
echo "Vous possédez tous les paquets nécessaires pour continuer !!! "
exit 2
fi


exit 0