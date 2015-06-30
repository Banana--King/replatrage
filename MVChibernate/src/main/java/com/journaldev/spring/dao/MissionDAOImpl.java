package com.journaldev.spring.dao;

import java.util.ArrayList;
import java.util.List;
 



import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
 



import com.journaldev.spring.model.Mission;
import com.journaldev.spring.model.Partenaire;
import com.journaldev.spring.model.User;

@Repository("missionDAO")
public class MissionDAOImpl implements MissionDAO {
     
    private static final Logger logger = LoggerFactory.getLogger(MissionDAOImpl.class);
 
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addMission(Mission m) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(m);
        logger.info("Mission saved successfully, Mission Details="+m);
    }
 
    @Override
    public void updateMission(Mission m) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(m);
        logger.info("Mission updated successfully, Mission Details="+m);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<Mission> listMissions() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Mission> MissionsList = session.createQuery("from Mission group by adresse").list();
        List<Mission> LastMissionList = new ArrayList<Mission>();
        for(Mission m : MissionsList){
        	Query query = session.createQuery("from Mission where dateLastAction = (select MAX(dateLastAction) from Mission where adresse=:adresse) and etat!=:etat");
    		query.setParameter("adresse", m.getAdresse());
    		query.setParameter("etat", "cloture");
    		Mission mission = (Mission) query.uniqueResult();
    		System.out.println("MISSION !!!! "+mission);
    		LastMissionList.add(mission);
        }
        return LastMissionList;
    }
 
    @Override
    public Mission getMissionById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        Mission m = (Mission) session.load(Mission.class, new Integer(id));
        logger.info("Mission loaded successfully, Mission details="+m);
        return m;
    }
 
    @Override
    public void removeMission(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Mission m = (Mission) session.load(Mission.class, new Integer(id));
        if(null != m){
            session.delete(m);
        }
        logger.info("Mission deleted successfully, Mission details="+m);
    }

	@Override
	public List<Mission> listMissionsByUserId(User userId) {
		Session session = this.sessionFactory.getCurrentSession();
        List<Mission> MissionsList = session.createQuery("from Mission group by adresse").list();
        List<Mission> LastMissionList = new ArrayList<Mission>();
        for(Mission m : MissionsList){
        	Query query = session.createQuery("from Mission where dateLastAction = (select MAX(dateLastAction) from Mission where adresse=:adresse) and user=:userId and etat!=:etat");
    		query.setParameter("adresse", m.getAdresse());
    		query.setParameter("userId", userId);
    		query.setParameter("etat", "cloture");
    		Mission mission = (Mission) query.uniqueResult();
    		System.out.println("MISSION !!!! "+mission);
    		LastMissionList.add(mission);
        }
        return LastMissionList;
	}
 
    
}