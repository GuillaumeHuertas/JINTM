#!/bin/bash



echo "    _____      _____  ____  _____  _________  ____    ____  "
echo "   |_   _|    |_   _||_   \|_   _||  _   _  ||_   \  /   _| "
echo "     | | ______ | |    |   \ | |  |_/ | | \_|  |   \/   |   "
echo " _   | ||______|| |    | |\ \| |      | |      | |\  /| |   "
echo "| |__' |       _| |_  _| |_\   |_    _| |_    _| |_\/_| |_  "
echo "\`.____.'      |_____||_____|\____|  |_____|  |_____||_____| "
                                                            



# Place le nom du projet dans une variable
read -p "Quel est le nom de votre projet ? " projet
# Place le package dans une variable
read -p "Quel est le nom de votre package ? " package
# Choisir entre Postgres et Mysql 
read -p "Quel Base de donnée voulez-vous utiliser ? "



# Genere une application maven avec l'archetype webapp
mvn archetype:generate -DgroupId=$package -DartifactId=$projet -DarchetypeArtifactId=maven-archetype-webapp -DarchetypeVersion=1.4 -DinteractiveMode=false;

echo "Fin du Maven"

# Se déplace dans le projet
cd $projet; 
# Créer les dossiers pour le projet
mkdir -p src/main/java; 
mkdir -p src/main/resources; 
mkdir -p src/test/java; 
mkdir -p src/test/resources; 

echo "Angular !!!!!!"
# Génère une application angular
ng new angularApp --skipGit=true --interactive=false --routing=true --style=scss;
echo "Fin Angular !!!!!!"

# Se déplace dans l'application Angular
cd angularApp; 
# Installe boostrap dans le projet 
npm install bootstrap@3.3.7 --save;


#Remplacer la premiere occurence de style pour y ajouter le bootstrap
sed -i '0,/"src\/styles.scss"/ s/"src\/styles.scss"/ "src\/styles.scss",\
"node_modules\/bootstrap\/dist\/css\/bootstrap.css"/' angular.json;

cd ..; 

# Réécris le pom.xml pour ajouter toutes les dépendances nécessaires
echo '<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>'$package'</groupId>
	<artifactId>'$projet'</artifactId>
	<version>0.0.1-SNAPSHOT</version>

	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.1.1.RELEASE</version>
		<relativePath />
	</parent>
	<properties>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
		<java.version>1.8</java.version>
	</properties>
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jpa</artifactId>
		</dependency>
		<dependency>
			<groupId>org.postgresql</groupId>
			<artifactId>postgresql</artifactId>
			<scope>runtime</scope>
		</dependency>
		<!-- https://mvnrepository.com/artifact/org.apache.httpcomponents/httpclient -->
		<dependency>
			<groupId>org.apache.httpcomponents</groupId>
			<artifactId>httpclient</artifactId>
		</dependency>
		<!-- https://mvnrepository.com/artifact/org.codehaus.jackson/jackson-core-asl -->
		<dependency>
			<groupId>org.codehaus.jackson</groupId>
			<artifactId>jackson-core-asl</artifactId>
			<version>1.9.13</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
	</dependencies>
	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
		</plugins>
	</build>

</project>' > pom.xml;



# Script pour compiler le programme
echo '#!/bin/bash

# Se déplace dans le projet Angular (il faut standardiser le nom)
cd angularApp; 
# Transpile le projet Angular vers le dossier static dans le projet Maven
ng build --prod --outputPath="../src/main/resources/static/"; 
cd ..; 
# Compile le projet Maven
mvn install; 
cd target; 
java -jar *.war; ' >> .compilateur; 
# Déclare le compilateur comme exécutable
chmod 755 .compilateur; 

# Initialise le dépôt Git
git init;
# Ajoute les fichier au HEAD 
git add .; 
# Commit les fichiers
git commit -m "Initialisation du projet"; 






