package com.project.PRS.repository;


import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.project.PRS.model.AddProperties;

public interface AddPropertiesConnection extends JpaRepository<AddProperties, Integer> {
	public AddProperties findById(int id);

	@Query("SELECT COUNT(a) FROM AddProperties a")
	public int countAllProperties();
	
	@Query("select a.propertyName, a.propertyDescription,a.id from AddProperties a order by a.id desc")
	List<Object[]> findRecentProperties(Pageable pageable);
}
