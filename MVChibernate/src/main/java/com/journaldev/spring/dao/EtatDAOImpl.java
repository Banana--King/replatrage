package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Etat;

@Repository("etatDAO")
public class EtatDAOImpl implements EtatDAO
{
	private static final Logger logger = LoggerFactory.getLogger(EtatDAOImpl.class);
	 
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

    
	@Override
	public void addEtat(Etat e) {
		Session session = this.sessionFactory.getCurrentSession();
        session.persist(e);
        logger.info("Etat saved successfully, Etat Details="+e);
	}

	@Override
	public void updateEtat(Etat e) {
		Session session = this.sessionFactory.getCurrentSession();
        session.update(e);
        logger.info("Etat saved successfully, Etat Details="+e);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Etat> listEtats() {
		Session session = this.sessionFactory.getCurrentSession();
        List<Etat> EtatsList = session.createQuery("from Etat").list();
        for(Etat e : EtatsList){
            logger.info("Etat List::"+e);
        }
        return EtatsList;
	}

	@Override
	public Etat getEtatById(int id) {
		Session session = this.sessionFactory.getCurrentSession();      
		Etat e = (Etat) session.load(Etat.class, new Integer(id));
		logger.info("Etat loaded successfully, Etat details="+e);
		return e;
	}

	@Override
	public Etat getEtatByName(String name) {
		Session session = this.sessionFactory.getCurrentSession();      
		Query query = session.createQuery("from Etat where nom=:nom");
		query.setParameter("nom", name);
		Etat e = (Etat) query.uniqueResult();
		logger.info("Etat loaded successfully, Etat details="+e);
		return e;
	}

	@Override
	public void removeEtat(int id) {
		Session session = this.sessionFactory.getCurrentSession();
        Etat e = (Etat) session.load(Etat.class, new Integer(id));
        if(null != e){
            session.delete(e);
        }
        logger.info("Etat deleted successfully, Etat details="+e);
	}

}
