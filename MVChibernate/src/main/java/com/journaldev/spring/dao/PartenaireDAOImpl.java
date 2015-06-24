package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Partenaire;

/**
 * Class Partenaire qui implémente son propre DAO.
 */
@Repository("partenaireDAO")
public class PartenaireDAOImpl implements PartenaireDAO
{
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	 
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

    /**
     * Ajoute un Partenaire en BDD
     */
	@Override
	public void addPartenaire(Partenaire p) {
		Session session = this.sessionFactory.getCurrentSession();
        session.persist(p);
        logger.info("Partenaire saved successfully, Partenaire Details="+p);
	}

	/**
	 * Modifie un Partenaire en BDD
	 */
	@Override
	public void updatePartenaire(Partenaire p) {
		Session session = this.sessionFactory.getCurrentSession();
        session.update(p);
        logger.info("Partenaire updated successfully, Partenaire Details="+p);
	}

	/**
	 * Selectionne tous les Partenaires en BDD
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Partenaire> listPartenaires() {
		Session session = this.sessionFactory.getCurrentSession();
        List<Partenaire> PartenairesList = session.createQuery("from Partenaire").list();
        for(Partenaire p : PartenairesList){
            logger.info("Partenaire List::"+p);
        }
        return PartenairesList;
	}

	/**
	 * Selectionne un Partenaire en fonction de son ID en BDD
	 */
	@Override
	public Partenaire getPartenaireById(int id) {
		Session session = this.sessionFactory.getCurrentSession();      
		Partenaire p = (Partenaire) session.load(Partenaire.class, new Integer(id));
		logger.info("Partenaire loaded successfully, Partenaire details="+p);
		return p;
	}

	/**
	 * Selectionne un Partenaire en fonction de son nom en BDD
	 */
	@Override
	public Partenaire getPartenaireByName(String name) {
		Session session = this.sessionFactory.getCurrentSession();      
		Partenaire p = (Partenaire) session.load(Partenaire.class, new String(name));
		logger.info("Partenaire loaded successfully, Partenaire details="+p);
		return p;
	}

	/**
	 * Supprime un Partenaire en BDD selon son ID
	 */
	@Override
	public void removePartenaire(int id) {
		Session session = this.sessionFactory.getCurrentSession();
        Partenaire p = (Partenaire) session.load(Partenaire.class, new Integer(id));
        if(null != p){
            session.delete(p);
        }
        logger.info("Partenaire deleted successfully, Partenaire details="+p);
	}

}
