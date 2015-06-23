package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.journaldev.spring.model.Partenaire;

public class PartenaireDAOImpl implements PartenaireDAO
{
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	 
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

	@Override
	public void addPartenaire(Partenaire p) {
		Session session = this.sessionFactory.getCurrentSession();
        session.persist(p);
        logger.info("Partenaire saved successfully, Partenaire Details="+p);
	}

	@Override
	public void updatePartenaire(Partenaire p) {
		Session session = this.sessionFactory.getCurrentSession();
        session.update(p);
        logger.info("Partenaire updated successfully, Partenaire Details="+p);
	}

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

	@Override
	public Partenaire getPartenaireById(int id) {
		Session session = this.sessionFactory.getCurrentSession();      
		Partenaire p = (Partenaire) session.load(Partenaire.class, new Integer(id));
		logger.info("Partenaire loaded successfully, Partenaire details="+p);
		return p;
	}

	@Override
	public Partenaire getPartenaireByName(String name) {
		Session session = this.sessionFactory.getCurrentSession();      
		Partenaire p = (Partenaire) session.load(Partenaire.class, new String(name));
		logger.info("Partenaire loaded successfully, Partenaire details="+p);
		return p;
	}

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
