package com.project.PRS.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class FeedbackForm {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int rating;
	private String feedback;
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public FeedbackForm(int id, int rating, String feedback, String name) {
		super();
		this.id = id;
		this.rating = rating;
		this.feedback = feedback;
		this.name = name;
	}

	@Override
	public String toString() {
		return "FeedbackForm [id=" + id + ", rating=" + rating + ", feedback=" + feedback + ", name=" + name + "]";
	}

	public FeedbackForm() {
		super();
		// TODO Auto-generated constructor stub
	}
}
