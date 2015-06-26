package com.journaldev.spring.dao;

import java.util.List;
 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
 
import com.journaldev.spring.model.Mission;

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
        List<Mission> MissionsList = session.createQuery("from Mission").list();
        for(Mission m : MissionsList){
            logger.info("Mission List::"+m);
        }
        return MissionsList;
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
 
    
}