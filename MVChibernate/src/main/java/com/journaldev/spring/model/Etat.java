package com.journaldev.spring.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="Etat")
@Table(name="ETAT")
public class Etat
{
	@Id
	@Column(name="idEtat")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nom;
	
	/*@OneToMany(mappedBy="etat")
	private List<Mission> missions;*/
	
	
	
	public Etat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Etat(int id, String nom/*, List<Mission> missions*/) {
		super();
		this.id = id;
		this.nom = nom;
		//this.missions = missions;
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
	
	
	/*public List<Mission> getMissions() {
		return missions;
	}
	public void setMissions(List<Mission> missions) {
		this.missions = missions;
	}*/
	
	
	@Override
	public String toString() {
		return "Etat [id=" + id + ", nom=" + nom + "]";
	}
	
	
}
