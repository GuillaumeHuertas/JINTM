#!/bin/bash

nom=$lenomduprojet;
str=$lepackageduprojet;
objet=$lenomdelobjet;
echo -e "\e[92mCreation de la classe d'api\e[0m";

for var in "${objetsvaleurs[@]}"
do
    if [  $((i%2)) -eq 0 ];then
        nomvar=${var};
    else
        nomtype=${var};
        echo -e ">> $nomvar \t $nomtype $cr"
    fi
done
#--------------------------------------------------------------------------------

declare -l objet
objet=$objet;

objetup=$objet;
objetup=`echo ${objetup:0:1} | tr  '[a-z]' '[A-Z]'`${objetup:1}

#--------------------------------------------------------------------------------


IFS='.' # space is set as delimiter
read -ra ADDR <<< "$str" # str is read into an array as tokens separated by IFS


#--------------------------------------------------------------------------------


cd $nom;
cd src/main/resources;

echo "server.port=8080
spring.datasource.url=jdbc:postgresql://localhost:5432/jintm
spring.datasource.username=jintm
spring.datasource.password=jintm
spring.jpa.show-sql=true

## Hibernate Properties
# The SQL dialect makes Hibernate generate better SQL for the chosen database
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.PostgreSQLDialect

# Hibernate ddl auto (create, create-drop, validate, update)
spring.jpa.hibernate.ddl-auto = update
spring.jpa.properties.hibernate.jdbc.lob.non_contextual_creation=true" > application-prod.properties;


echo "# H2
spring.h2.console.enabled=true
spring.h2.console.path=/h2

# Datasource
spring.datasource.url=jdbc:h2:file:~/dev
spring.datasource.username=sa
spring.datasource.password=
spring.datasource.driver-class-name=org.h2.Driver" > application-dev.properties


echo "spring.profiles.active=dev" > application.properties


cd ..;


#--------------------------------------------------------------------------------#--------------------------------------------------------------------------------


cd java;
for i in "${ADDR[@]}"; do # access each element of array
    mkdir $i;
    cd $i;
done


#--------------------------------------------------------------------------------#--------------------------------------------------------------------------------

echo "package $str;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}" > Application.java;


#--------------------------------------------------------------------------------#--------------------------------------------------------------------------------


mkdir exception;
cd exception;
echo "package $str.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class ResourceNotFoundException extends Exception{

    private static final long serialVersionUID = 1L;

    public ResourceNotFoundException(String message){
        super(message);
    }
}" > ResourceNotFoundException.java

cd ..;


#--------------------------------------------------------------------------------

mkdir configuration;
cd configuration;


echo "package $str.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
@Configuration
@ConfigurationProperties(\"spring.datasource\")
@SuppressWarnings(\"unused\")
public class DBConfiguration {

	@Profile(\"dev\")
	@Bean
	public String devDatabaseConnection() {
		System.out.println(\"mode dev\");
		return \"DB connection for DEV - POSTGRES\";
	}
	
	@Profile(\"prod\")
	@Bean
	public String prodDatabaseConnection() {
		System.out.println(\"mode prod\");
		return \"DB connection for DEV - POSTGRES\";
	}
}
" > DBConfiguration.java; 
cd ..;

#--------------------------------------------------------------------------------


mkdir model;
cd model;


echo "package $str.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = \""$objet"s\")
public class $objetup implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = \"id\", updatable = false, nullable = false)
	private Long id;

	public $objetup() {
	}

	// Getters et Setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}" > $objetup.java;



for var in "${objetsvaleurs[@]}"
	do
	if [  $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
		nomvarup=$nomvar;
		nomvarup=`echo ${nomvarup:0:1} | tr  '[a-z]' '[A-Z]'`${nomvarup:1}



	else
		nomtype=${var};

	echo "@Column(name=\"$nomvar\", nullable = false)
	$nomtype $nomvar;

	public void set$nomvarup($nomtype $nomvar){
		this.$nomvar = $nomvar;
	}
	public $nomtype get$nomvarup(){
		return $nomvar;
}

" >> $objetup.java;



	fi
	let "i++";
	done
echo "}" >>$objetup.java

cd ..;


#--------------------------------------------------------------------------------#--------------------------------------------------------------------------------


mkdir repository;
cd repository;

echo "package $str.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import $str.model.$objetup;

@Repository
public interface "$objetup"Repository extends JpaRepository<"$objetup", Long> {

}
" > $objetup'Repository.java';

cd ..;


#--------------------------------------------------------------------------------#--------------------------------------------------------------------------------


mkdir controller;
cd controller;
echo "package $str.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import $str.exception.ResourceNotFoundException;
import $str.model.$objetup;
import $str.repository."$objetup"Repository;

@CrossOrigin
@RestController
@RequestMapping(\"/api/v1\")
public class "$objetup"Controller {
	@Autowired
	private "$objetup"Repository "$objet"Repository;

	@GetMapping(\"/$objet\")
	public List<$objetup> getAll"$objetup"s() {
		return "$objet"Repository.findAll();
	}

	@GetMapping(\"/"$objet"/{id}\")
	public ResponseEntity<$objetup> get"$objet"ById(@PathVariable(value = \"id\") Long "$objet"Id)
			throws ResourceNotFoundException {
		"$objetup" "$objet" = "$objet"Repository.findById("$objet"Id)
				.orElseThrow(() -> new ResourceNotFoundException(\""$objetup" not found for this id :: \" + "$objet"Id));
		return ResponseEntity.ok().body("$objet");
	}

	@PostMapping(\"/$objet\")
	public $objetup create"$objetup"(@Valid @RequestBody $objetup $objet) {
		return "$objet"Repository.save("$objet");
	}

	@PutMapping(\"/$objet\")
    public ResponseEntity<$objetup> update"$objetup"(@Valid @RequestBody $objetup "$objet"Details) throws ResourceNotFoundException {
        $objetup $objet = "$objet"Repository.findById("$objet"Details.getId())
                .orElseThrow(() -> new ResourceNotFoundException(\"$objetup not found for this id :: \" + "$objet"Details.getId()));
/*BALISEATROUVER*/

        final $objetup updated"$objetup" = "$objet"Repository.save($objet);
        return ResponseEntity.ok(updated"$objetup");
    }

	@DeleteMapping(\"/$objet/{id}\")
	public Map<String, Boolean> delete"$objetup"(@PathVariable(value = \"id\") Long "$objet"Id)
			throws ResourceNotFoundException {
		$objetup $objet = "$objet"Repository.findById("$objet"Id)
				.orElseThrow(() -> new ResourceNotFoundException(\"$objetup not found for this id :: \" + "$objet"Id));

		"$objet"Repository.delete("$objet");
		Map<String, Boolean> response = new HashMap<>();
		response.put(\"deleted\", Boolean.TRUE);
		return response;
	}

}

" > "$objetup"Controller.java;


for var in "${objetsvaleurs[@]}"
	do
	if [  $((i%2)) -eq 0 ];then
		nomvar=${var};
		declare -l nomvar
		nomvarup=$nomvar;
		nomvarup=`echo ${nomvarup:0:1} | tr  '[a-z]' '[A-Z]'`${nomvarup:1}

		sed -i '/^\/\*BALISEATROUVER\*\//a '$objet'.set'$nomvarup'('$objet'Details.get'$nomvarup'());' "$objetup"Controller.java;
	fi
	let "i++";
done

cd ..;
for i in "${ADDR[@]}"; do # access each element of array
    cd ..;
done

cd ../../..;

echo -e "\e[91mFin de la creation de la classe d'api\e[0m";

