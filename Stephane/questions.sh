#!/bin/bash

cr=`echo $'\n.'`
cr=${cr%.}
echo -e "\e[102m \e[30m=========================================================================================\e[0m"

# Place le nom du projet dans une variable
read -p "Voulez vous créer une classe d'api ? (y/N) $cr>" reponse

if [ -z $reponse ] ; then
    reponse="N"
fi

reponseup=$reponse;
reponseup=`echo ${reponseup:0:1} | tr  '[a-z]' '[A-Z]'`${reponseup:1}

while [[ "$reponseup" != "Y" && "$reponseup" != "N" ]]
do
    echo "$cr Invalide. (y/n) $cr>"
    read -p "Voulez vous créer une classe d'api ? (y/n) $cr>" reponse
    reponseup=$reponse;
    reponseup=`echo ${reponseup:0:1} | tr  '[a-z]' '[A-Z]'`${reponseup:1}
done

if [ $reponseup == "N" ] ; then
    
loloololo="gggg";
    
else
    break="false"
    objetsvaleurs=();
    read -p "Nom de la classe : $cr>" lenomdelobjet
    while [[  -z $lenomdelobjet  ]]
    do
        echo "$cr Invalide.$cr"
        read -p "Nom de la classe : $cr>" lenomdelobjet
    done
    while [ $break != "true" ]
    do
        
        read -p "Nom de l'attribut : $cr>" nomatt
        while [[  -z $nomatt  ]]
        do
            echo "$cr Invalide.$cr"
            read -p "Nom de l'attribut : $cr>" nomatt
        done
        read -p "Type de l'attribut :$cr 1-String$cr 2-int $cr 3-float$cr 4-boolean$cr 5-char $cr>" typeatt
        while [[ "$typeatt" != "1" && "$typeatt" != "2" && "$typeatt" != "3" && "$typeatt" != "4" && "$typeatt" != "5" ]]
        do
            echo "$cr Invalide.$cr"
            read -p "Type de l'attribut :$cr 1-String$cr 2-int $cr 3-float$cr 4-boolean$cr 5-char $cr>" typeatt
        done
        
        objetsvaleurs=( "${objetsvaleurs[@]}" "$nomatt" )
        if [ $typeatt == "1" ] ; then
            objetsvaleurs=( "${objetsvaleurs[@]}" "String" );
        fi
        if [ $typeatt == "2" ] ; then
            objetsvaleurs=( "${objetsvaleurs[@]}" "int" );
        fi
        if [ $typeatt == "3" ] ; then
            objetsvaleurs=( "${objetsvaleurs[@]}" "float" );
        fi
        if [ $typeatt == "4" ] ; then
            objetsvaleurs=( "${objetsvaleurs[@]}" "boolean" );
        fi
        if [ $typeatt == "5" ] ; then
            objetsvaleurs=( "${objetsvaleurs[@]}" "char" );
        fi
        
        read -p "Voulez vous créer un autre attribut ? (y/N) $cr>" reponse
        
        if [ -z $reponse ] ; then
            reponse="N"
        fi
        reponseup=$reponse;
        reponseup=`echo ${reponseup:0:1} | tr  '[a-z]' '[A-Z]'`${reponseup:1}
        while [[ "$reponseup" != "Y" && "$reponseup" != "N" ]]
        do
            echo "Invalide. (y/n) $cr"
            read -p "Voulez vous créer un autre attribut ? (y/n) $cr>" reponse
            reponseup=$reponse;
            reponseup=`echo ${reponseup:0:1} | tr  '[a-z]' '[A-Z]'`${reponseup:1}
        done
        
        if [ $reponseup == "N" ] ; then
            break="true";
        else
            break="false";
        fi
    done
    . ./generateurApiJava.sh
    cd ..;
    . ./generateurAngular.sh
fi
