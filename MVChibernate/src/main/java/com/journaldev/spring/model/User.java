package com.journaldev.spring.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Class qui représente le Bean User.
 * Cette class va auto générer la table qui lui correspond en BDD (user)
 * ATTENTION : il y a une jointure avec la table MISSION
 */
@Entity
@Table(name="USER")
public class User
{
	/* ---------- Attributs ---------- */
    @Id
    @Column(name="idUser")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nom;
	private String prenom;
	private String username;
	private String password;
	private boolean enabled;
	
	@OneToMany(mappedBy="user")
    private List<Mission> missions;  
	
	
	/* ---------- Constructeurs ---------- */
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id, String nom, String prenom, String username,
			String password, boolean enabled, List<Mission> missions) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.missions = missions;
	}
	
	
	/* ---------- Getters / Setters ---------- */
	public int getId() { // id
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNom() { // nom
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() { // prenom
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	public String getUsername() { // username
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() { // password
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
  
	public boolean isEnabled() { // enabled
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public List<Mission> getMissions() { // missions
		return missions;
	}
	public void setMissions(List<Mission> missions) {
		this.missions = missions;
	}
	
	
	/* ---------- Debug ---------- */
	@Override
	public String toString() {
		return "User [id=" + id + ", nom=" + nom + ", prenom=" + prenom
				+ ", username=" + username + ", password=" + password
				+ ", enabled=" + enabled + "]";
	}
}
