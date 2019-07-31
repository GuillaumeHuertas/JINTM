# JINTM (fonctionne sous Debian) En cours de développement ....

Application ayant pour but de générer une application Web avec : 
  Angular 8 en front
  Spring en back 
  Base de donnée au choix : PosgreSQL, MariaDB
  
Cette application est née d'une volonté d'entrevoir le fonctionnement de JHipster. 
  
L'application possède une partie dédié à l'installation de toutes les applications nécessaire 
au fonctionnement du générateur. Le script scanne dans un premier temps ce qui est installé 
sur le poste (Java 8, maven, curl, node.js, npm, Angular, git) et propose d'installer ce qui
manque sur le poste de travail. 

L'applciation demande ensuite ce que l'utilisateur désire comme base de donnée, propose de l'installer 
si celle-ci n'est pas installer sur le poste et va créer un utilisateur "jintm", un mot de passe "jintm"
et une base de donnée "jintm" qui seront réutilsié par la suite. 

La partie générateur de l'application demande le nom de l'application, le package, si nous désirons 
créer une classe, ses attributs etc. 

Une fois les informations entrés, le script va :
  -créer un dossier pour l'application,
  -générer une architecture maven avec l'archetype maven-archetype-webapp à  l'aide du CLI Maven, 
  -créer les dossiers et sous dossiers java, ressources et les tests, 
  -génère une application angular à la racine du dossier avec routing
  -install boostrap dans l'applciation angular
  -modifie le pom.xml pour prendre en comtpe les paramètres entré par l'utilisateur
  -lance des scripts qui génèrent les classes d'API en fonction des réponses au questions précédentes
  
  
Un script est ajouté pour transpiller le projet Angular dans le projet maven, pui compiler le maven et éxécuter le .war compilé. 
  
