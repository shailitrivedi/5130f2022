package com.example.demo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Complaint {
	@Id
	@GeneratedValue
	private int id;
	private int deptId;
	private Date complaintDate;
	private String detail;
	private String type;
	private String nature;

	public Complaint() {

	}

	public Complaint(int id, int deptId, Date complaintDate, String detail, String type, String nature) {
		super();
		this.id = id;
		this.deptId = deptId;
		this.complaintDate = complaintDate;
		this.detail = detail;
		this.type = type;
		this.nature = nature;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public Date getComplaintDate() {
		return complaintDate;
	}

	public void setComplaintDate(Date complaintDate) {
		this.complaintDate = complaintDate;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	@Override
	public String toString() {
		return "Complaint [id=" + id + ", deptId=" + deptId + ", complaintDate=" + complaintDate + ", detail=" + detail
				+ ", type=" + type + ", nature=" + nature + "]";
	}

}
