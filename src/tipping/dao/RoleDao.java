package tipping.dao;

import tipping.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String theRoleName);
	
}
