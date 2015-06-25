package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.RoleUser;

@Repository("roleUserDAO")
public class RoleUserDAOImpl implements RoleUserDAO
{
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	 
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
	
    
	@Override
	public void addRoleUser(RoleUser r) {
		Session session = this.sessionFactory.getCurrentSession();
        session.persist(r);
        logger.info("Role saved successfully, Role Details="+r);
	}

	@Override
	public void updateRoleUser(RoleUser r) {
		Session session = this.sessionFactory.getCurrentSession();
        session.update(r);
        logger.info("Role updated successfully, Role Details="+r);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RoleUser> listRoleUsers() {
		Session session = this.sessionFactory.getCurrentSession();
        List<RoleUser> RolesList = session.createQuery("from RoleUser").list();
        for(RoleUser r : RolesList){
            logger.info("Role List::"+r);
        }
        return RolesList;
	}

	@Override
	public RoleUser getRoleUserByCouple(String username, String roleName) {
		Session session = this.sessionFactory.getCurrentSession();      
		Query query = (org.hibernate.Query) session.createQuery("from RoleUser where username=:username and roleName=:roleName");
		query.setParameter("username", username);
		query.setParameter("roleName", roleName);
		RoleUser ru = (RoleUser) query.uniqueResult();
		logger.info("RoleUser loaded successfully, RoleUser details="+ru);
		return ru;
	}

	@Override
	public void removeRoleUser(int id) {
		Session session = this.sessionFactory.getCurrentSession();
        RoleUser r = (RoleUser) session.load(RoleUser.class, new Integer(id));
        if(null != r){
            session.delete(r);
        }
        logger.info("Role deleted successfully, Role details="+r);
	}


	@Override
	public RoleUser getRoleUserById(int id) {
		Session session = this.sessionFactory.getCurrentSession();      
		RoleUser r = (RoleUser) session.load(RoleUser.class, new Integer(id));
		logger.info("Role loaded successfully, Role details="+r);
		return r;
	}


	/*@SuppressWarnings("unchecked")
	@Override
	public List<Role> getAllRolesNames() {
		Session session = this.sessionFactory.getCurrentSession();  
		List<Role> RoleNamesList = session.createQuery("from Role").list();
		return RoleNamesList;
	}*/

}
