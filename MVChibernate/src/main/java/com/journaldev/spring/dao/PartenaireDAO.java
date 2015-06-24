package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Partenaire;

/**
 * Interface DAO des partenaires.
 */
public interface PartenaireDAO
{
	public void addPartenaire(Partenaire p);
	public void updatePartenaire(Partenaire p);
	public List<Partenaire> listPartenaires();
	public Partenaire getPartenaireById(int id);
	public Partenaire getPartenaireByName(String name);
	public void removePartenaire(int id);
}
