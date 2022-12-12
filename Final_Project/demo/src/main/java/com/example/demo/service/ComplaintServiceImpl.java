package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Complaint;
import com.example.demo.repository.ComplaintRepository;

@Service
public class ComplaintServiceImpl implements ComplaintService {

	@Autowired
	ComplaintRepository complaintRepository;

	@Override
	public Complaint registerComplaint(Complaint complaint) {
		return complaintRepository.save(complaint);
	}

	@Override
	public List<Complaint> getComplaintsByUserId(int id) {
		return complaintRepository.findByUserId(id);
	}

	@Override
	public List<Complaint> getComplaintByDeptId(Integer deptId) {
		return complaintRepository.findByDeptId(deptId);
	}

	@Override
	public Complaint getComplaintById(int comId) {
		return complaintRepository.findById(comId);
	}

	@Override
	public void deleteComplaintById(int comId) {
		Integer id = comId;
		complaintRepository.deleteById(id);
	}

	@Override
	public List<Complaint> getAllComplaints() {
		return complaintRepository.findAll();
	}

	@Override
	public List<Complaint> getAllPendingComplaints(String status) {
		return complaintRepository.findByStatus(status);
	}

	@Override
	public int getSolvedComplaints(int id) {
		List<Complaint> li = complaintRepository.findByUserId(id);
		int count = 0;
		for (Complaint x : li) {
			if (x.getStatus().equalsIgnoreCase("solved"))
				count++;
		}
		return count;
	}

	@Override
	public int getPendingComplaints(int id) {
		List<Complaint> li = complaintRepository.findByUserId(id);
		int count = 0;
		for (Complaint x : li) {
			if (x.getStatus().equalsIgnoreCase("pending"))
				count++;
		}
		return count;
	}

	@Override
	public int getSolvedComplaintsByDept(int deptid) {
		List<Complaint> li = complaintRepository.findByDeptId(deptid);
		int count = 0;
		for (Complaint x : li) {
			if (x.getStatus().equalsIgnoreCase("solved"))
				count++;
		}
		return count;
	}

	@Override
	public int getPendingComplaintsByDept(int deptid) {
		List<Complaint> li = complaintRepository.findByDeptId(deptid);
		int count = 0;
		for (Complaint x : li) {
			if (x.getStatus().equalsIgnoreCase("pending"))
				count++;
		}
		return count;
	}

	@Override
	public int getAllSolvedComplaints() {
		List<Complaint> li = complaintRepository.findAll();
		int count = 0;
		for (Complaint x : li) {
			if (x.getStatus().equalsIgnoreCase("solved"))
				count++;
		}
		return count;
	}

	@Override
	public int getAllPendingComplaints() {
		List<Complaint> li = complaintRepository.findAll();
		int count = 0;
		for (Complaint x : li) {
			if (x.getStatus().equalsIgnoreCase("pending"))
				count++;
		}
		return count;
	}
}
