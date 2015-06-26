package com.journaldev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.EtatDAO;
import com.journaldev.spring.model.Etat;

@Service("etatService")
public class EtatServiceImpl implements EtatService
{
	private EtatDAO etatDAO;

	@Autowired
	public void setEtatDAO(EtatDAO etatDAO) {
		this.etatDAO = etatDAO;
	}
	
	
	@Override
	@Transactional
	public void addEtat(Etat e) {
		this.etatDAO.addEtat(e);
	}

	@Override
	@Transactional
	public void updateEtat(Etat e) {
		this.etatDAO.updateEtat(e);
	}

	@Override
	@Transactional
	public List<Etat> listEtats() {
		return this.etatDAO.listEtats();
	}

	@Override
	@Transactional
	public Etat getEtatById(int id) {
		return this.etatDAO.getEtatById(id);
	}

	@Override
	@Transactional
	public Etat getEtatByName(String name) {
		return this.etatDAO.getEtatByName(name);
	}

	@Override
	@Transactional
	public void removeEtat(int id) {
		this.etatDAO.removeEtat(id);
	}

}
