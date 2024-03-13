<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Users Update Form - CRMS Admin</title>

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
String heading = "Edit User Details", btnText = "Save Details", clr = "primary";

if (request.getParameter("OP").equals("delete")) {
	heading = "Are You Sure ?";
	btnText = "Permenantly Delete Account";
	clr = "danger";
}

String nm = "";
String gen = "";
String contact = "";
String email = "";
String address = "";
String city = "";
String profilepic = "";
String pwd = "";

ResultSet res = getData.select("Select * from tbl_users where ID = '" + request.getParameter("ID") + "'");

while (res.next()) {
	nm = res.getString(2);
	gen = res.getString(5);
	email = res.getString(3);
	contact = res.getString(4);
	address = res.getString(6);
	city = res.getString(7);
	profilepic = res.getString(9);
	pwd = res.getString(9);
}

request.getSession().setAttribute("ueid", Integer.parseInt(request.getParameter("ID")));
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
										<form action="../userController_Admin" method="post"
											enctype="multipart/form-data">
											<div class="row mb-2">
												<div class="col-sm-12 text-dark">
													<h2 class="font-weight-bold ml-1 pb-1"><%=heading%></h2>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Registration ID</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=request.getParameter("ID")%>" readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Name</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtName"
														value="<%=nm%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Gender</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<select name="gender" class="form-control">
														<option value="Male" <%if (gen.equals("Male")) {%>
															selected <%}%>>Male</option>
														<option value="Female" <%if (gen.equals("Female")) {%>
															selected <%}%>>Female</option>
													</select>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Phone</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtContact"
														placeholder="10 Digits Only" value="<%=contact%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Email</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtEmail"
														value="<%=email%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">City</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<select name="city" class="form-control">
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
											<div class="row mb-0">
												<div class="col-sm-3">
													<h6 class="mt-3">Address</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=address%>" name="txtAddress">
												</div>
											</div>
											<div class="row mb-0">
												<div class="col-sm-3">
													<h6 class="mt-3">Password</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="password" class="form-control"
														value="<%=pwd%>" name="txtPassword">
												</div>
											</div>
											<div class="row mb-0">
												<div class="col-sm-3"></div>
												<div class="col-sm-9">
													<input type="submit" value="<%=btnText%>"
														class="btn btn-<%=clr%> mt-3 mr-3"
														name="btnSubmitAdmin_User">
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