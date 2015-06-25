package com.journaldev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.RoleUserDAO;
import com.journaldev.spring.model.RoleUser;

@Service("roleUserService")
public class RoleUserServiceImpl implements RoleUserService {


	private RoleUserDAO roleUserDAO;
	
	@Autowired
	public void setRoleUserDAO(RoleUserDAO roleUserDAO) {
		this.roleUserDAO = roleUserDAO;
	}
	
	
	@Override
	@Transactional
	public void addRoleUser(RoleUser r) {
		this.roleUserDAO.addRoleUser(r);
	}

	@Override
	@Transactional
	public void updateRoleUser(RoleUser r) {
		this.roleUserDAO.updateRoleUser(r);
	}

	@Override
	@Transactional
	public List<RoleUser> listRoleUsers() {
		return this.roleUserDAO.listRoleUsers();
	}

	@Override
	@Transactional
	public RoleUser getRoleUserByCouple(String username, String roleName) {
		return this.roleUserDAO.getRoleUserByCouple(username, roleName);
	}

	@Override
	@Transactional
	public void removeRoleUser(int id) {
		this.roleUserDAO.removeRoleUser(id);
	}


	@Override
	@Transactional
	public RoleUser getRoleUserById(int id) {
		return this.roleUserDAO.getRoleUserById(id);
	}


	/*@Override
	public List<Role> getAllRolesNames() {
		return this.roleDAO.getAllRolesNames();
	}*/

}
