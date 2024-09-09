package com.project.PRS.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.PRS.model.ContactForm;

public interface ContactConnection extends JpaRepository<ContactForm, Integer> {
	public ContactForm findById(int id);
}
