package com.journaldev.spring.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Class qui représente les roles des Users.
 * Cette class va auto générer la table qui lui correspond en BDD (user_role)
 */
@Entity
@Table(name="USER_ROLE")
public class Role
{
	/* ---------- Attributs ---------- */
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String username;
	private String roleName;

	
	/* ---------- Constructeurs ---------- */
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Role(int id, String roleName, String username) {
		super();
		this.id = id;
		this.roleName = roleName;
		this.username = username;
	}

	
	/* ---------- Getters / Setters ---------- */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
	/* ---------- Debug ---------- */
	@Override
	public String toString() {
		return "Role [id=" + id + ", username=" + username + ", roleName="
				+ roleName + "]";
	}
}
