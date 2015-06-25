package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Role;

public interface RoleDAO
{
	public void addRole(Role r);
	public void updateRole(Role r);
	public List<Role> listRoles();
	public Role getRoleById(int id);
	public Role getRoleByName(String name);
	public void removeRole(int id);
}
