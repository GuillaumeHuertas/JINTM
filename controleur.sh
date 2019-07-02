#!/bin/bash

echo "Nous allons controler que vous posséder les logiciels nécessaires pour générer votre application"

# Demande la version de java
java -version 2>/dev/null 
# 2>/dev/null permet de ne pas afficher le résultat dans la console
# Si Java est installé le code retour est 0

# Si le code retours est différents de 0 un message nous averti
# que Java n'est pas installlé
if [ $? != 0 ] ; then
	 echo "Java n'est pas installé !"
     # Appel le script d'installation de OpenJDK8
     ./installations/installationOpenJDK8.sh
else 
	echo "Java est bien installé ! "
fi

# Demande la version de Javac
javac -version 2>/dev/null
# Idem 
if [ $? != 0 ] ; then
	 echo "Javac n'est pas installé !"
     # Appel le script d'installation de OpenJDK8
     ./installations/installationOpenJDK8.sh
else 
	echo "Javac est bien installé ! "
fi

# Demande la version de Git
git version >/dev/null
# Idem 
if [ $? != 0 ] ; then
	 echo "Git n'est pas installé !"
     # Appel le script d'installation de Git
     ./installations/installationGit.sh
else 
	echo "Git est bien installé ! "
fi

# Demande la version de Curl
curl --version >/dev/null
# Idem 
if [ $? != 0 ] ; then
	 echo "Curl n'est pas installé !"
     # Appel le script d'installation de Curl
     ./installations/installationCurl.sh
else 
	echo "Curl est bien installé ! "
fi

# Demande la version de node.js
node -v >/dev/null
# Idem 
if [ $? != 0 ] ; then
	 echo "node.js n'est pas installé !"
     # Appel le script d'installation de Node.js
     ./installations/installationNode.sh
else 
	echo "node.js est bien installé ! "
fi

# Demande la version de npm
npm -v >/dev/null
# Idem 
if [ $? != 0 ] ; then
	 echo "npm n'est pas installé !"
     # Appel le script d'installation de Node.js
     ./installations/installationNode.sh
else 
	echo "npm est bien installé ! "
fi


