package com.journaldev.spring.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="USER")
public class User
{
	/* ---------- Attributs ---------- */
    @Id
    @Column(name="idUser")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idUser;
	private String nom;
	private String prenom;
	private String username;
	private String password;
	private boolean enabled;
	
	@ManyToMany(cascade=CascadeType.ALL)  
    @JoinTable(name="USERMISSION",  
    joinColumns={@JoinColumn(name="idUser", referencedColumnName="idUser")},  
    inverseJoinColumns={@JoinColumn(name="idMission", referencedColumnName="idMission")})  
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
	
		
<<<<<<< HEAD
	/* ---------- Getters / Setters ---------- */
	public int getId() {
		return id;
=======
	/* ---------- GETTERS / SETTERS ---------- */
	public int getIdUser() {
		return idUser;
>>>>>>> 10510b8a0873098b6f2de1d12d854dfee6553821
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
  
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public List<Mission> getMissions() {
		return missions;
	}
	public void setMissions(List<Mission> missions) {
		this.missions = missions;
	}
	
	
	/* ---------- Debug ---------- */
	@Override
    public String toString(){
        return "idUser="+idUser+", nom="+nom+", prenom="+prenom+", username="+username+", password="+password;
    }
}
