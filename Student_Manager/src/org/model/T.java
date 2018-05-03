package org.model;

import java.util.HashSet;
import java.util.Set;

/**
 * T entity. @author MyEclipse Persistence Tools
 */

public class T implements java.io.Serializable {

	// Fields

	private String tno;
	private D d;
	private String password;
	private String tname;
	private Boolean gender;
	private String career;
	private String photo;
	private Set xes = new HashSet(0);
	private Set gs = new HashSet(0);
	private Set os = new HashSet(0);

	// Constructors

	/** default constructor */
	public T() {
	}

	/** minimal constructor */
	public T(String tno, D d, String password, String tname, Boolean gender,
			String career, String photo) {
		this.tno = tno;
		this.d = d;
		this.password = password;
		this.tname = tname;
		this.gender = gender;
		this.career = career;
		this.photo = photo;
	}

	/** full constructor */
	public T(String tno, D d, String password, String tname, Boolean gender,
			String career, String photo, Set xes, Set gs, Set os) {
		this.tno = tno;
		this.d = d;
		this.password = password;
		this.tname = tname;
		this.gender = gender;
		this.career = career;
		this.photo = photo;
		this.xes = xes;
		this.gs = gs;
		this.os = os;
	}

	// Property accessors

	public String getTno() {
		return this.tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
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

	public String getTname() {
		return this.tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public Boolean getGender() {
		return this.gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public String getCareer() {
		return this.career;
	}

	public void setCareer(String career) {
		this.career = career;
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

	public Set getOs() {
		return this.os;
	}

	public void setOs(Set os) {
		this.os = os;
	}

}