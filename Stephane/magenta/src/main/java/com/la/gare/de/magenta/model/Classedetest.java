package com.la.gare.de.magenta.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "classedetests")
public class Classedetest implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "id", updatable = false, nullable = false)
	private Long id;

	public Classedetest() {
	}

	// Getters et Setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
@Column(name="att", nullable = false)
	String att;

	public void setAtt(String att){
		this.att = att;
	}
	public String getAtt(){
		return att;
} 


@Column(name="att2", nullable = false)
	String att2;

	public void setAtt2(String att2){
		this.att2 = att2;
	}
	public String getAtt2(){
		return att2;
} 


}
