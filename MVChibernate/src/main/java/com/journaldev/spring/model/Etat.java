package com.journaldev.spring.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ETAT")
public class Etat
{
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nom;
	
	
	
	public Etat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Etat(int id, String nom) {
		super();
		this.id = id;
		this.nom = nom;
	}
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	
	
	@Override
	public String toString() {
		return "Etat [id=" + id + ", nom=" + nom + "]";
	}
	
	
}
