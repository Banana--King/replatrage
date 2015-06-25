package com.journaldev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.PartenaireDAO;
import com.journaldev.spring.model.Partenaire;

/**
 * Class Partenaire qui implémente son propre Service.
 */
@Service("partenaireService")
public class PartenaireServiceImpl implements PartenaireService {

	private PartenaireDAO partenaireDAO;
	
	@Autowired
	public void setPartenaireDAO(PartenaireDAO partenaireDAO) {
		this.partenaireDAO = partenaireDAO;
	}
	

	@Override
	@Transactional
	public void addPartenaire(Partenaire p) {
		this.partenaireDAO.addPartenaire(p);
	}

	@Override
	@Transactional
	public void updatePartenaire(Partenaire p) {
		this.partenaireDAO.updatePartenaire(p);
	}

	@Override
	@Transactional
	public List<Partenaire> listPartenaires() {
		return this.partenaireDAO.listPartenaires();
	}

	@Override
	@Transactional
	public Partenaire getPartenaireById(int id) {
		return this.partenaireDAO.getPartenaireById(id);
	}

	@Override
	@Transactional
	public void removePartenaire(int id) {
		this.partenaireDAO.removePartenaire(id);
	}


	@Override
	@Transactional
	public Partenaire getPartenaireByName(String name) {
		return this.partenaireDAO.getPartenaireByName(name);
	}

}
