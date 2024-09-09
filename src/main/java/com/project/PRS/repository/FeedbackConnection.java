package com.project.PRS.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.project.PRS.model.FeedbackForm;

public interface FeedbackConnection extends JpaRepository<FeedbackForm, Integer> {
	@Query("select f.feedback, f.name from FeedbackForm f order by f.rating desc")
	List<Object[]> topFeedback(Pageable pageable);
}
