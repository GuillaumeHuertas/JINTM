#!/bin/bash

# Script qui vérifie toutes les isntallations

echo "Vérification des paquets ..."

# Check java
java -version 2>/dev/null 1>/dev/null 
# 2>/dev/null permet de ne pas afficher le résultat dans la console
# Si Java est installé le code retour est 0

#Check Java
# Si le code retours est différents de 0 un message nous averti
# que Java n'est pas installlé
if [ $? != 0 ] ; then
     # Affiche le message en Jaune
     echo -e "\e[38;5;202m[INFO] Java n'est pas installé\e[0m"
     # Stocke la réponse "no" dans la varibale install1
     install1="no"
else 
     # Affiche le message en Vert
     echo -e "\e[92m[INFO] Java est bien installé !\e[0m"
     # Stocke la réponse "yes" dans la varibale install1
     install1="yes"
fi

# Check Javac
javac -version 2>/dev/null >/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202m[INFO] Javac n'est pas installé !\e[0m"
     install1="no"
else 
     echo -e "\e[92m[INFO] Javac est bien installé !\e[0m"
     install1="yes"
fi

# Check Maven
mvn -version >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202m[INFO] Maven n'est pas installé !\e[0m"
     install2="no"
else
     echo -e "\e[92m[INFO] Maven est bien installé !\e[0m"
     install2="yes"
fi

# Check Git
git version >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202m[INFO] Git n'est pas installé !\e[0m"
     install3="no"
else
     echo -e "\e[92m[INFO] Git est bien installé !\e[0m"
     install3="yes"
fi

# Check Curl
curl --version >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202m[INFO] Curl n'est pas installé !\e[0m"
     install4="no"
else 
     echo -e "\e[92m[INFO] Curl est bien installé !\e[0m"
     install4="yes"
fi

# Check node.js
node -v >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202m[INFO] node.js n'est pas installé !\e[0m"
     install5="no"
else 
     echo -e "\e[92m[INFO] node.js est bien installé !\e[0m"
     install5="yes"
fi

# Check npm
npm -v >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202m[INFO] npm n'est pas installé !\e[0m"
     install6="no"
else 
     # Affiche le message en Vert
     echo -e "\e[92m[INFO] npm est bien installé !\e[0m"
     install6="yes"
fi

# Check Angular
ng version >/dev/null 2>/dev/null
if [ $? != 0 ] ; then
     echo -e "\e[38;5;202m[INFO] Angular n'est pas installé !\e[0m"
     install7="no"
else 
     # Affiche le message en Vert
     echo -e "\e[92m[INFO] Angular est bien installé !\e[0m"
     install7="yes"
fi


#######################################################################################
#######################################################################################

# Si l'un des paquets testés n'est pas installé, le if se lance
if [[ $install1 == "no" || $install2 == "no" || $install3 == "no" \
|| $install4 == "no" || $install5 == "no" || $install6 == "no" \
|| $install7 == "no" ]] ; then
    
    read -p "[QUESTION] Voulez-vous que nous installions les packages manquants ? (Y/n)" response

    if [ -z $response ] ; then
    response="Y"
    fi

    while [[ "$response" != "Y" && "$response" != "n" ]]
    do
        echo "[INFO] Choisissez Y ou n"
        read -p "[QUESTION] Voulez-vous que nous installions les packages manquants ? (Y/n)" response
    done    

    if [ $response == "n" ] ; then
	    echo "[EXIT] Vous ne pourrez utiliser le générateur de code ..."
        exit 1
    else 
	    echo "[QUESTION] Nous allons avoir besoin de votre mot de passe root pour effectuer les installations à votre place "
        su -c '
            # Met-à-jour et installe les paquets 
            echo "[INFO] Mise-à-jour et installations des paquets ..."
            apt-get update >/dev/null 2>/dev/null
            apt-get upgrade >/dev/null 2>/dev/null

            #Installation JDK 8 
            if [ "'$install1'" == "no" ] ; then
            echo "[INFO] Installation de OpenJDK 8 ..."
            apt-get install openjdk-8-jdk -y >/dev/null 2>/dev/null
            fi

            # Installation Maven
            if [ "'$install2'" == "no" ] ; then
            echo "[INFO] Installation de Maven ..."
            apt-get install maven -y >/dev/null 2>/dev/null
            fi

            # Installation Git
            if [ "'$install3'" == "no" ] ; then
            echo "[INFO] Installation de Git ..."
            apt-get install git -y >/dev/null 2>/dev/null
            fi

            # Installation Curl
            if [ "'$install4'" == "no" ] ; then
            echo "[INFO] Installation de Curl ..."
            apt-get install curl software-properties-common -y >/dev/null 2>/dev/null
            fi

             # Installation Node.js
            if [ "'$install5'" == "no" ] ; then
            echo "[INFO] Installation de Node.js ..."
            curl -sL https://deb.nodesource.com/setup_10.x | bash - >/dev/null 2>/dev/null
            apt-get install nodejs -y >/dev/null 2>/dev/null
            fi

            # Installation nmp latest
            if [ "'$install6'" == "no" ] ; then
            echo "[INFO] Installation de npm latest ..."
            echo "yes" | npm install -g npm@latest >/dev/null 2>/dev/null
            fi

            # Installation nmp latest
            if [ "'$install7'" == "no" ] ; then
            echo "[INFO] Installation de npm latest ..."
            echo "yes" | npm install -g @angular/cli >/dev/null 2>/dev/null
            fi'

            # Relance le controleur pour vérifier que tout est bien installlé !
            ./controleurFull.sh
    
    fi
else
echo "[INFO] Vous possédez tous les paquets nécessaires pour continuer !!! "
exit 2
fi

exit 0