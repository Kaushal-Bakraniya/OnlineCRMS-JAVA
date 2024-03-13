<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Driver Update Form - CRMS Admin</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<%
String nm = "";
String gen = "";
String contact = "";
String email = "";
String address = "";
String city = "";
int experience = 0;
String AadharCard = "";
String DrivingLicense = "";
String DOB = "";
String Status = "";
int CurrentTrip = 0;
int Salary = 0;
String JoinDate = "";

String heading = "";
String btn1 = "";
String btn2 = "";

try {
	ResultSet res = getData.select("Select * from tbl_driver where ID = '" + request.getParameter("ID") + "'");

	while (res.next()) {
		nm = res.getString(2);
		gen = res.getString(3);
		email = res.getString(4);
		contact = res.getString(5);
		address = res.getString(6);
		city = res.getString(7);
		experience = res.getInt(8);
		AadharCard = res.getString(9);
		DrivingLicense = res.getString(10);
		DOB = res.getString(11);
		Status = res.getString(13);
		Salary = res.getInt(14);
		CurrentTrip = res.getInt(15);
		JoinDate = res.getString(12);
	}

	if (Status.equals("REQUESTED")) {
		heading = "Review Request";
		btn1 = "Approve Request";
		btn2 = "Decline Request";
	} else {
		heading = "Update Driver Details";
		btn1 = "Save Details";
		btn2 = "Delete Profile";
	}

	request.getSession().setAttribute("did", Integer.parseInt(request.getParameter("ID")));
} catch (Exception e) {
	e.printStackTrace();
}
%>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- SideBar Starts -->
		<%@ include file="includes/sidebar.jsp"%>
		<!-- SideBar Ends -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<%@ include file="includes/topbar.jsp"%>

				<div class="container mb-5 fix-container fix-2">
					<div class="main-body">
						<div class="row d-flex justify-content-center align-items-center">
							<div class="col-lg-8 fix-details">
								<div class="card">
									<div class="card-body">
										<form action="../Driver_Manager" method="post"
											enctype="multipart/form-data">
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Full Name</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control mt-2"
														name="txtFullName" value="<%=nm%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Gender</h6>
												</div>
												<div class="col-sm-9 mt-1 text-secondary">
													<select class="form-control" name="txtGen">
														<option value="Male" <%if (gen.equals("Male")) {%>
															selected <%}%>>Male</option>
														<option value="Female" <%if (gen.equals("Female")) {%>
															selected <%}%>>Female</option>
													</select>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Email</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="email" class="form-control" name="txtEmail"
														value="<%=email%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Contact No.</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtContactNo"
														value="<%=contact%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Address</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtAddress"
														value="<%=address%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">City</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<select name="txtCity" class="form-control">
														<%
														ResultSet ct = getData.select("select Access from tbl_admin where ID != 1 ORDER BY ID ASC");
														
														while (ct.next()) {
														%>
														<option value="<%=ct.getString(1)%>"
															<%if (city.equals(ct.getString(1))) {%> selected <%}%>>
															<%=ct.getString(1)%>
														</option>
														<%
														}
														%>
													</select>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-2">Experience_Years</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="number" class="form-control"
														name="txtExperience" value="<%=experience%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-2">Aadhar Card</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="file" class="form-control"
														name="txtAadharCard" accept="image/*">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-2">Driving License</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="file" class="form-control"
														name="txtDrivingLicense" accept="image/*">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Date Of Birth</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="date" class="form-control" name="txtDOB"
														value="<%=DOB%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Status</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<select class="form-control" name="txtStatus">
														<%
														if (Status.equals("REQUESTED")) {
														%>
														<option value="AVAILABLE" selected>AVAILABLE</option>
														<%
														} else {
														%>
														<option value="AVAILABLE">AVAILABLE</option>
														<option value="ON TRIP">ON TRIP</option>
														<option value="ON LEAVE">ON LEAVE</option>
														<%
														}
														%>
													</select>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Join Date</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="date" class="form-control" name="txtJoinDate"
														<%if (!Status.equals("REQUESTED")) {%>
														value="<%=JoinDate%>" <%}%>>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Salary</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtSalary"
														value="<%=Salary%>">
												</div>
											</div>
											<%
											if (!Status.equals("REQUESTED")) {
											%>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Current Trip</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="date" class="form-control" name="txtSalaey"
														value="<%=CurrentTrip%>">
												</div>
											</div>
											<%
											}
											%>
											<div class="row mb-0">
												<div class="col-sm-3"></div>
												<div class="col-sm-9">
													<input type="submit" value="<%=btn1%>"
														class="form-control btn btn-primary mt-3 mr-3"
														name="btnDriver"> <input type="submit"
														value="<%=btn2%>"
														class="form-control btn btn-danger mt-3 mr-3"
														name="btnDriver">
												</div>
											</div>
										</form>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- User Account End -->


			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

</body>

</html>