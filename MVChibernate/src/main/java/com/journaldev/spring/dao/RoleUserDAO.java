package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.RoleUser;

/**
 * Interface DAO des roles.
 */
public interface RoleUserDAO
{
	public void addRoleUser(RoleUser r);
	public void updateRoleUser(RoleUser r);
	public List<RoleUser> listRoleUsers();
	public RoleUser getRoleUserById(int id);
	public RoleUser getRoleUserByCouple(String username, String roleName);
	public void removeRoleUser(int id);
	//public List<Role> getAllRolesNames();
}
