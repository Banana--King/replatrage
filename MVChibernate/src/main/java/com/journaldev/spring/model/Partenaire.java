package com.journaldev.spring.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Class qui représente le Bean Partenaire.
 * Cette class va auto générer la table qui lui correspond en BDD (partenaire)
 */
@Entity
@Table(name="PARTENAIRE")
public class Partenaire
{
	/* ---------- Attributs ---------- */
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nom;
	
	
	/* ---------- Constructeurs ---------- */
	public Partenaire() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Partenaire(int id, String nom) {
		super();
		this.id = id;
		this.nom = nom;
	}
	
	
	/* ---------- Getters / Setters ---------- */
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
	
	
	/* ---------- Debug ---------- */
	@Override
	public String toString() {
		return "Partenaire [id=" + id + ", nom=" + nom + "]";
	}
	
	
}
