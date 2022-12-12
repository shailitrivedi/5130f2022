package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Complaint;

public interface ComplaintService {

	Complaint registerComplaint(Complaint complaint);

	List<Complaint> getComplaintsByUserId(int id);

	List<Complaint> getComplaintByDeptId(Integer deptId);

	Complaint getComplaintById(int comId);

	void deleteComplaintById(int comId);

	List<Complaint> getAllComplaints();

	List<Complaint> getAllPendingComplaints(String nature);

	public int getSolvedComplaints(int id);

	public int getPendingComplaints(int id);

	int getSolvedComplaintsByDept(int deptid);

	int getPendingComplaintsByDept(int id);

	int getAllSolvedComplaints();

	int getAllPendingComplaints();

}
