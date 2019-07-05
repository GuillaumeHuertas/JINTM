#!/bin/bash

# Controlle si PostgreSQL, MariaDB ou H2 est installé

echo "Vérification des SGBD Installés ..."

# Demande la version de java
psql --version 2>/dev/null 1>/dev/null 
# 2>/dev/null permet de ne pas afficher le résultat dans la console
# en cas d'erreur et 1>/dev/null  fait de me pour le cas nominal
# Si Java est installé le code retour est 0

# Si le code retours est différents de 0 un message nous averti
# que Java n'est pas installlé
if [ $? != 1 ] ; then
     # Affiche le message en Jaune  
     echo -e "\e[38;5;202mPosgreSQL n est pas installé\e[0m"
     ./installationPostregreSQL.sh
else 
     # Affiche le message en Vert
     echo -e "\e[92mPostreSQL est bien installé !\e[0m"
fi
