package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.RoleUser;

public interface RoleUserService
{
	public void addRoleUser(RoleUser r);
	public void updateRoleUser(RoleUser r);
	public List<RoleUser> listRoleUsers();
	public RoleUser getRoleUserById(int id);
	public RoleUser getRoleUserByCouple(String username, String roleName);
	public List<String> getRoleUserByUsername(String username);
	public void removeRoleUser(int id);
	//public List<Role> getAllRolesNames();
}
