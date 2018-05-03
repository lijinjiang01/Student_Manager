package org.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * S entity. @author MyEclipse Persistence Tools
 */

public class S implements java.io.Serializable {

	// Fields

	private String stuNo;
	private D d;
	private String password;
	private String sname;
	private Boolean gender;
	private Date birth;
	private String photo;
	private Set xes = new HashSet(0);
	private Set gs = new HashSet(0);

	// Constructors

	/** default constructor */
	public S() {
	}

	/** minimal constructor */
	public S(String stuNo, D d, String password, String sname, Boolean gender,
			Date birth, String photo) {
		this.stuNo = stuNo;
		this.d = d;
		this.password = password;
		this.sname = sname;
		this.gender = gender;
		this.birth = birth;
		this.photo = photo;
	}

	/** full constructor */
	public S(String stuNo, D d, String password, String sname, Boolean gender,
			Date birth, String photo, Set xes, Set gs) {
		this.stuNo = stuNo;
		this.d = d;
		this.password = password;
		this.sname = sname;
		this.gender = gender;
		this.birth = birth;
		this.photo = photo;
		this.xes = xes;
		this.gs = gs;
	}

	// Property accessors

	public String getStuNo() {
		return this.stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	public D getD() {
		return this.d;
	}

	public void setD(D d) {
		this.d = d;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public Boolean getGender() {
		return this.gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return this.birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Set getXes() {
		return this.xes;
	}

	public void setXes(Set xes) {
		this.xes = xes;
	}

	public Set getGs() {
		return this.gs;
	}

	public void setGs(Set gs) {
		this.gs = gs;
	}

}