package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Etat;

public interface EtatService
{
	public void addEtat(Etat e);
	public void updateEtat(Etat e);
	public List<Etat> listEtats();
	public Etat getEtatById(int id);
	public Etat getEtatByName(String name);
	public void removeEtat(int id);
}
