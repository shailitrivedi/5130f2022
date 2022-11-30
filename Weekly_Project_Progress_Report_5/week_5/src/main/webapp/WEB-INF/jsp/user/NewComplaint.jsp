<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>





    <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center mb-4">
                                    <h4 class="card-title">Complaint Registration Form</h4>
                                </div>
                                <x-alert type="ValidationError" />
                                <div class="table-responsive">
                                    <form action="//" method="POST" enctype="multipart/form-data">
                                        
                                        <table class="table table-bordered" width="80%" cellspacing="0">
                                            <tr>
                                                <th>Department Name</th>
                                                <td><textarea rows="1" cols="40" name="deptName" class="form-control" placeholder="Enter Department Name" required></textarea></td>
                                            </tr>
                                            <tr>
                                                <th>Complaint Type</th>
                                                <td>
                                                    <select class="form-control" id="Complaint Type" name="complaintType" required>
                                                        <option value="">Select Type</option>
                                                        <option value="Complaint" }>Complaint</option>
                                                        <option value="Query" >Query</option>
                                                    </select>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <th>Complaint Details</th>
                                                <td><textarea rows="3" cols="40" name="complaintDetails" class="form-control" placeholder="Please Enter Complaint Details" required></textarea></td>
                                            </tr>

                                            
                                            
                                            <tr>
                                                <th>Priority of Complaint
                                                <td> <select class="form-control" id="complaintPriority" name="complaintPriority" required>
                                                        <option value="">Select Type</option>
                                                        <option value="High">High</option>
                                                        <option value="Medium" >Medium</option>
                                                        <option value="Low" >Low</option>
                                                    </select></td>

                                                </th>
                                            </tr>
                                            <tr>
                                                <th>Date of Complaint</th>
                                                <td><input type="date" name="complaintDate" class="form-control" id="DateOfComp" value="{{ old('complaintDate') }}" required></td>
                                            </tr>
                                            

                                        

                                            
                                            
                                        </table>
                                        <br><br>

                                        <button class="btn btn-success" > <i data-feather="check-circle" class="feather-icon"></i>&nbsp;&nbsp;Register Complaint</button>
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

            <!-- All Jquery -->
            <%@ include file="Footer.jsp" %>
    </body>
    
</html>
