package com.journaldev.spring.model;

import java.util.Calendar;
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
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Class qui représente le Bean Mission.
 * Cette class va auto générer la table qui lui correspond en BDD (mission)
 * ATTENTION : il y a une jointure avec la table USER.
 */
@Entity
@Table(name="MISSION")
public class Mission
{
	/* ---------- Attributs ---------- */
    @Id
    @Column(name="idMission")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String titre;
	private String description;
	private String etat;
	private Calendar dateLastAction;
	private String adresse;
	/*private double longitude;
	private double latitude;*/
	
	@ManyToOne
    @JoinColumn(name="idUser")
    private User user;
	
	
	/* ---------- GETTERS / SETTERS ---------- */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public Calendar getDateLastAction() {
		return dateLastAction;
	}
	public void setDateLastAction(Calendar dateLastAction) {
		this.dateLastAction = dateLastAction;
	}
	/*public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}*/
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public User getUser() {
		return user;
	}
	public String getAdresse() {
		return adresse;
	}
	
	
	
	/* ---------- Debug ---------- */
	/*@Override
    public String toString(){
        return "idUser="+id+", titre="+titre+", description="+description+", etat="+etat+", dateLastAction="+dateLastAction+", longitude="+longitude+", latitude="+latitude;
    }*/
}
