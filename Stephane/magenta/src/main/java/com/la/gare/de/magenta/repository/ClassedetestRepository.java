package com.la.gare.de.magenta.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.la.gare.de.magenta.model.Classedetest;

@Repository
public interface ClassedetestRepository extends JpaRepository<Classedetest, Long> {

}

