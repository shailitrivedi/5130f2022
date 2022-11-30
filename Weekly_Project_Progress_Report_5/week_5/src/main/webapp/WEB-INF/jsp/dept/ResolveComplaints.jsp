
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
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
    <title>Department Update Complaint</title>
    <!-- This page plugin CSS -->
    <link href="../public/assets/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../public/dist/css/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body>
    <%@ include file="Header.jsp" %>
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Update Complaint</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="javascript:void(0);" class="text-muted">Home</a></li>
                                    <li class="breadcrumb-item text-muted active" aria-current="page">Resolve Complaint</li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->

                <x-alert type="ErrorMsg" />
                <div id="Error"></div>
                <div class="col-sm-12 col-md-6 col-lg-6" id="append">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Enter Complaint I'D</h4>
                            <div class="form-group">
                                <input type="text" name="CompID" class="form-control" placeholder="Complaint I'D" id="CompID">                                
                            </div>
                            <center>
                                <button id="btnDetail" class="btn btn-dark ml-1" type="button" data-toggle="collapse" data-target="#UpdateComplaint" aria-expanded="false" aria-controls="UpdateComplaint">
                                    Show Details
                                </button>
                            </center>
                        </div>
                    </div>
                </div>
                <!-- order table -->
                <div id="UpdateComplaint" class="collapse">
                    <div class="row">
                        <div class="col-12">

                            <div class="card mb-3">
                                <div class="card-header">
                                    <i class="fas fa-table"></i>
                                    Complaint Details</div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" width="80%" cellspacing="0">

                                            <tr>
                                                <th>Complaint I'd</th>
                                                <td id="data1"></td>
                                                <th id="data2Heading"></th>
                                                <td id="data2"></td>
                                            </tr>
                                            <tr>
                                                <th>Catogory</th>
                                                <td id="data3"></td>
                                                <th>Sub-Catogory</th>
                                                <td id="data4"></td>

                                            </tr>
                                        </table>
                                        <table class="table table-bordered" width="80%" cellspacing="0">
                                            <tr>
                                                <th>Nature of Complaint</th>
                                                <td id="data5"></td>

                                            </tr>
                                        </table>

                                        <table class="table table-bordered">
                                            <tr>
                                                <th>Last Update</th>
                                                <td id="data6"></td>
                                                <th>Current Status</th>
                                                <td id="data7"></td>
                                            </tr>
                                            <tr>
                                                <th>Update Status</th>
                                                <td>
                                                    <form action="../Dept/DeptResolveComplaints.html" method="POST">

                                                        <div class="form-group mb-4">
                                                            <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="status" required>
                                                                <option value="" selected>Choose...</option>
                                                                <option value="Pending">Pending</option>
                                                                <option value="Solved">Solved</option>
                                                            </select>
                                                        </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Remarks</th>
                                                <td>
                                                    <div class="form-group">
                                                        <textarea class="form-control" rows="3" placeholder="Text Here..." name="remarks" id="data13" required></textarea>
                                                        <small id="textHelp" class="form-text text-muted">Helper Text</small>
                                                    </div>
                                                    <input type="text" name="id" style="display: none;" id="Cid">
                                                </td>
                                            </tr>
                                        </table>
                                        <button type="submit" class="btn btn-primary">Save Update</button>
                                        <button type="submit" class="btn btn-primary">Resolve Complaint</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ============================================================== -->
            <!-- End PAge Content -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->



        <!-- ============================================================== -->
        <!--  Modal content for the above example -->
        <div class="modal fade" id="bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myLargeModalLabel">Logout</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal"><i data-feather="x" class="feather-icon"></i> Close</button>
                        <a href="/" type="button" class="btn btn-primary"><i data-feather="log-out" class="feather-icon"></i> Logout</a>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!-- ============================================================== -->
        <!-- footer -->
<%@ include file="Footer.jsp" %>
</body>

</html>
