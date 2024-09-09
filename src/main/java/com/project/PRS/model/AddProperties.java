package com.project.PRS.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AddProperties {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String propertyName;
	private String propertyAddress;
	private String propertyType;
	private double propertyPrice;
	private String propertyDescription;
	private String propertyImage;
	private double latitude;
	private double longitude;
	private String availability;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getPropertyAddress() {
		return propertyAddress;
	}

	public void setPropertyAddress(String propertyAddress) {
		this.propertyAddress = propertyAddress;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public double getPropertyPrice() {
		return propertyPrice;
	}

	public void setPropertyPrice(double propertyPrice) {
		this.propertyPrice = propertyPrice;
	}

	public String getPropertyDescription() {
		return propertyDescription;
	}

	public void setPropertyDescription(String propertyDescription) {
		this.propertyDescription = propertyDescription;
	}

	public String getPropertyImage() {
		return propertyImage;
	}

	public void setPropertyImage(String propertyImage) {
		this.propertyImage = propertyImage;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public AddProperties(int id, String propertyName, String propertyAddress, String propertyType, double propertyPrice,
			String propertyDescription, String propertyImage, double latitude, double longitude, String availability) {
		super();
		this.id = id;
		this.propertyName = propertyName;
		this.propertyAddress = propertyAddress;
		this.propertyType = propertyType;
		this.propertyPrice = propertyPrice;
		this.propertyDescription = propertyDescription;
		this.propertyImage = propertyImage;
		this.latitude = latitude;
		this.longitude = longitude;
		this.availability = availability;
	}

	public AddProperties() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "AddProperties [id=" + id + ", propertyName=" + propertyName + ", propertyAddress=" + propertyAddress
				+ ", propertyType=" + propertyType + ", propertyPrice=" + propertyPrice + ", propertyDescription="
				+ propertyDescription + ", propertyImage=" + propertyImage + ", latitude=" + latitude + ", longitude="
				+ longitude + ", availability=" + availability + "]";
	}
}
