package com.journaldev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.RoleDAO;
import com.journaldev.spring.model.Role;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	private RoleDAO roleDAO;
	
	@Autowired
	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}
	
	
	@Override
	@Transactional
	public void addRole(Role r) {
		this.roleDAO.addRole(r);
	}

	@Override
	@Transactional
	public void updateRole(Role r) {
		this.roleDAO.updateRole(r);
	}

	@Override
	@Transactional
	public List<Role> listRoles() {
		return this.roleDAO.listRoles();
	}

	@Override
	@Transactional
	public Role getRoleById(int id) {
		return this.roleDAO.getRoleById(id);
	}

	@Override
	@Transactional
	public Role getRoleByName(String name) {
		return this.roleDAO.getRoleByName(name);
	}

	@Override
	@Transactional
	public void removeRole(int id) {
		this.roleDAO.removeRole(id);
	}

}
