package com.project.PRS.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.PRS.model.ContactInquiry;

public interface RequestViste extends JpaRepository<ContactInquiry, Integer> {
	 ContactInquiry findByContactNumber(String contactNumber);
}
