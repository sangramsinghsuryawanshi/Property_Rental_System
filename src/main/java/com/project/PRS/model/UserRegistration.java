package com.project.PRS.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_registration")
public class UserRegistration {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "full_name")
	private String fullName;

	@Column(name = "password")
	private String password;

	@Column(name = "email")
	private String email;

	@Column(name = "contact_number")
	private String contactNumber;

	@Column(name = "permanent_address")
	private String permentAddress;

	@Column(name = "city")
	private String city;

	@Column(name = "state")
	private String state;

	@Column(name = "pin_code")
	private String pinCode;

	@Column(name = "country")
	private String country;

	@Column(name = "user_role")
	private String userRole;

	@Column(name = "id_proof_type")
	private String idProofType;

	@Column(name = "id_proof_number")
	private String idProofNumber;

	@Column(name = "upload_id_proof_path")
	private String uploadIdProofPath;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getPermentAddress() {
		return permentAddress;
	}

	public void setPermentAddress(String permentAddress) {
		this.permentAddress = permentAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getIdProofType() {
		return idProofType;
	}

	public void setIdProofType(String idProofType) {
		this.idProofType = idProofType;
	}

	public String getIdProofNumber() {
		return idProofNumber;
	}

	public void setIdProofNumber(String idProofNumber) {
		this.idProofNumber = idProofNumber;
	}

	public String getUploadIdProofPath() {
		return uploadIdProofPath;
	}

	public void setUploadIdProofPath(String uploadIdProofPath) {
		this.uploadIdProofPath = uploadIdProofPath;
	}

	public UserRegistration(int id,String fullName, String password, String email, String contactNumber,
			String permentAddress, String city, String state, String pinCode, String country, String userRole,
			String idProofType, String idProofNumber, String uploadIdProofPath) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.password = password;
		this.email = email;
		this.contactNumber = contactNumber;
		this.permentAddress = permentAddress;
		this.city = city;
		this.state = state;
		this.pinCode = pinCode;
		this.country = country;
		this.userRole = userRole;
		this.idProofType = idProofType;
		this.idProofNumber = idProofNumber;
		this.uploadIdProofPath = uploadIdProofPath;
	}

	public UserRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "UserRegistration [id=" + id + ", fullName=" + fullName + ", password=" + password
				+ " email=" + email + ", contactNumber=" + contactNumber + ", permentAddress=" + permentAddress
				+ ", city=" + city + ", state=" + state + ", pinCode=" + pinCode + ", country=" + country
				+ ", userRole=" + userRole + ", idProofType=" + idProofType + ", idProofNumber=" + idProofNumber
				+ ", uploadIdProofPath=" + uploadIdProofPath + "]";
	}

}
