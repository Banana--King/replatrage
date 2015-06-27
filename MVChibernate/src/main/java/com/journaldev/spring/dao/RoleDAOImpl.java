package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Role;

@Repository("roleDAO")
public class RoleDAOImpl implements RoleDAO
{	
	private static final Logger logger = LoggerFactory.getLogger(RoleDAOImpl.class);
	 
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

	@Override
	public void addRole(Role r) {
		Session session = this.sessionFactory.getCurrentSession();
        session.persist(r);
        logger.info("Role saved successfully, Role Details="+r);
	}

	@Override
	public void updateRole(Role r) {
		Session session = this.sessionFactory.getCurrentSession();
        session.update(r);
        logger.info("Role updated successfully, Role Details="+r);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> listRoles() {
		Session session = this.sessionFactory.getCurrentSession();
        List<Role> RolesList = session.createQuery("from Role").list();
        for(Role r : RolesList){
            logger.info("Role List::"+r);
        }
        return RolesList;
	}

	@Override
	public Role getRoleById(int id) {
		Session session = this.sessionFactory.getCurrentSession();      
		Role r = (Role) session.load(Role.class, new Integer(id));
		logger.info("Role loaded successfully, Role details="+r);
		return r;
	}

	@Override
	public Role getRoleByName(String name) {
		Session session = this.sessionFactory.getCurrentSession();      
		Query query = session.createQuery("from Role where name=:name");
		query.setParameter("name", name);
		Role r = (Role) query.uniqueResult();
		logger.info("Role loaded successfully, Role details="+r);
		return r;
	}

	@Override
	public void removeRole(int id) {
		Session session = this.sessionFactory.getCurrentSession();
        Role r = (Role) session.load(Role.class, new Integer(id));
        if(null != r){
            session.delete(r);
        }
        logger.info("Role deleted successfully, Role details="+r);
	}
	
    
}
