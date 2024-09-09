package com.project.PRS.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.project.PRS.model.UserRegistration;

public interface RepositoryConnection extends JpaRepository<UserRegistration, Integer> {
	public UserRegistration findByEmail(String email);
	
	@Query("SELECT COUNT(u) FROM UserRegistration u WHERE u.userRole = :userRole")
    int getManageruserRolecnt(String userRole);
	
}

