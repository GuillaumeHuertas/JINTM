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
     echo -e "\e[93mJava n'est pas installé\e[0m"
     # Appel le script d'installation de OpenJDK8
     ./installations/installationOpenJDK8.sh
else 
     # Affiche le message en Vert
     echo -e "\e[92mJava est bien installé !\e[0m"
fi

# Demande la version de Javac
javac -version 2>/dev/null >/dev/null
# Idem 
if [ $? != 0 ] ; then
     # Affiche le message en Jaune
     echo -e "\e[93mJavac n'est pas installé !\e[0m"
     # Appel le script d'installation de OpenJDK8
     ./installations/installationOpenJDK8.sh
else 
     # Affiche le message en Vert
     echo -e "\e[92mJavac est bien installé !\e[0m"
fi

# Demande la version de Git
git version >/dev/null 2>/dev/null
# Idem 
if [ $? != 0 ] ; then
     # Affiche le message en Jaune
     echo -e "\e[93mGit n'est pas installé !\e[0m"
     # Appel le script d'installation de Git
     ./installations/installationGit.sh
else 
     # Affiche le message en Vert
     echo -e "\e[92mGit est bien installé !\e[0m"
fi

# Demande la version de Curl
curl --version >/dev/null 2>/dev/null
# Idem 
if [ $? != 0 ] ; then
     # Affiche le message en Jaune
     echo -e "\e[93mCurl n'est pas installé !\e[0m"
     # Appel le script d'installation de Curl
     ./installations/installationCurl.sh
else 
     # Affiche le message en Vert
     echo -e "\e[92mCurl est bien installé !\e[0m"
fi

# Demande la version de node.js
node -v >/dev/null 2>/dev/null
# Idem 
if [ $? != 0 ] ; then
     # Affiche le message en Jaune
     echo -e "\e[93mnode.js n'est pas installé !\e[0m"
     # Appel le script d'installation de Node.js
     ./installations/installationNode.sh
else 
     # Affiche le message en Vert
     echo -e "\e[92mnode.js est bien installé !\e[0m"
fi

# Demande la version de npm
npm -v >/dev/null 2>/dev/null
# Idem 
if [ $? != 0 ] ; then
     # Affiche le message en Jaune
     echo -e "\e[93mnpm n'est pas installé !\e[0m"
     # Appel le script d'installation de Node.js
     ./installations/installationNode.sh
else 
     # Affiche le message en Vert
     echo -e "\e[92mnpm est bien installé !\e[0m"
fi


