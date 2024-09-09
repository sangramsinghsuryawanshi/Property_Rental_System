package com.project.PRS.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ContactInquiry {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String propertyName;
	private String propertyAddress;
	private String propertyType;
	private String propertyPrice;
	private String visitDate;
	private String contactNumber;
	private String TenantEmail;
	private String TenantName;
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
	public String getPropertyPrice() {
		return propertyPrice;
	}
	public void setPropertyPrice(String propertyPrice) {
		this.propertyPrice = propertyPrice;
	}
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDateStr) {
		this.visitDate = visitDateStr;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	public String getTenantEmail() {
		return TenantEmail;
	}
	public void setTenantEmail(String tenantEmail) {
		TenantEmail = tenantEmail;
	}
	public String getTenantName() {
		return TenantName;
	}
	public void setTenantName(String tenantName) {
		TenantName = tenantName;
	}
	
	public ContactInquiry(int id, String propertyName, String propertyAddress, String propertyType,
			String propertyPrice, String visitDate, String contactNumber, String tenantEmail, String tenantName) {
		super();
		this.id = id;
		this.propertyName = propertyName;
		this.propertyAddress = propertyAddress;
		this.propertyType = propertyType;
		this.propertyPrice = propertyPrice;
		this.visitDate = visitDate;
		this.contactNumber = contactNumber;
		TenantEmail = tenantEmail;
		TenantName = tenantName;
	}
	@Override
	public String toString() {
		return "ContactInquiry [id=" + id + ", propertyName=" + propertyName + ", propertyAddress=" + propertyAddress
				+ ", propertyType=" + propertyType + ", propertyPrice=" + propertyPrice + ", visitDate=" + visitDate
				+ ", contactNumber=" + contactNumber + ", TenantEmail=" + TenantEmail + ", TenantName=" + TenantName
				+ "]";
	}
	public ContactInquiry() {
		super();
	}
	
}
