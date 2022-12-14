<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.List, com.example.demo.model.Dept" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../public/assets/images/favicon.png">
    <title>New Complaint</title>
    <!-- Custom CSS -->

    <link href="../public/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="../public/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="../public/dist/css/style.css" rel="stylesheet">
    <link href="../public/programs/assets/css/select2.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="Header.jsp" %>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">
                        	<span id="greet">,</span>
                        </h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item">
                                    	<a href="javascript:void(0);">Dashboard</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
    		<div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <%
                	int id = (Integer) request.getAttribute("userid");
                %>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center mb-4">
                                    <h4 class="card-title">Complaint Registration Form</h4>
                                </div>
                                <x-alert type="ValidationError" />
                                <div class="table-responsive">
                                    <form action="/complaint/newComplaint" method="POST" enctype="multipart/form-data" id="form">
                                        <table class="table table-bordered" width="80%" cellspacing="0">
                                            <tr>
                                                <th>Complaint Type</th>
                                                <td>
                                                    <select class="form-control" id="Complaint Type" name="type" required>
                                                        <option value="Complaint">Complaint</option>
                                                        <option value="Query">Query</option>
                                                    </select>
                                                </td>
                                             </tr>
                                             <tr>
                                                <th>Department Name</th>
                                                <td>
                                                	<select class="form-control" id="complaintPriority" name="deptId" required>
	                                               		<c:forEach var="dept" items="${deptList}">
	                                               			<option value="${dept.id}">
	                                               				${dept.deptName}
	                                               			</option>
	                                               		</c:forEach>
                                                	</select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Priority of Complaint</th>
                                                <td>
                                                	<select class="form-control" id="complaintPriority" name="nature" required>
                                                        <option value="High">High</option>
                                                        <option value="Medium">Medium</option>
                                                        <option value="Low">Low</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Complaint Details</th>
                                                <td>
	                                                <textarea rows="3" cols="40" name="detail" class="form-control" placeholder="Please Enter Complaint Details" required></textarea>
                                                    <input type="hidden" id="userid" value="${userid}" name="userId" style="display:none;" class="form-control">
                                                </td>
                                            </tr>
                                            <!-- <tr>
                                                <th>Date of Complaint</th>
                                                <td>
                                                	<input type="date" id="temp" name="complaintDate" placeholder="MM/dd/yyyy" value="" required>
                                                </td>
                                            </tr> -->
                                        </table>
                                        <br/><br/>
                                        <button class="btn btn-success" >
                                        	<i data-feather="check-circle" class="feather-icon"></i>&nbsp;&nbsp;Register Complaint
                                        </button>
                                    </form>
                                </div>

                            </div> <!-- end card-body-->
                        </div> <!-- end card-->
                    </div> <!-- end col-->
                </div>
                <!-- end row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
			<div class="modal fade" id="bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <h4 class="modal-title" id="myLargeModalLabel">Logout</h4>
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">??</button>
	                        </div>
	                        <div class="modal-body">
	
	                        </div>
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-light" data-dismiss="modal"><i data-feather="x" class="feather-icon"></i> Close</button>
	                            <a href="/" class="btn btn-primary"><i data-feather="log-out" class="feather-icon"></i> Logout</a>
	
	                        </div>
	                    </div><!-- /.modal-content -->
	                </div><!-- /.modal-dialog -->
            	</div><!-- /.modal -->
    		</div>
            <!-- All Jquery -->
            <%@ include file="Footer.jsp" %>
    </body>
    <script type="text/javascript">
    	var msg = '<%= request.getAttribute("save-comp-msg") %>';
		if (msg != "null"){
			$('#form').prepend('<div class="alert alert-danger">'+msg+'</div>')
		}
    </script>
</html>

<%-- 
<%
	List<Dept> listDept = (List<Dept>) request.getAttribute("deptList");
	for(Dept oneDept : listDept){
%>
	<option value="<%=oneDept.getId()%>">
		<%=oneDept.getDeptName()%>
	</option>
<%
	}
%>
--%>