<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Add Car - CRMS Admin</title>

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
										<form action="../car_controller" method="post"
											enctype="multipart/form-data">
											<div class="row mb-2">
												<div class="col-sm-12 text-dark">
													<h2 class="font-weight-bold ml-1 pb-1">Add New Car</h2>
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-sm-3">
													<h6 class="mt-3">Registration No.</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														placeholder="Enter Registration Number" name="txtRegNo">
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-sm-3">
													<h6 class="mt-3">Model Name</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														placeholder="Enter Company Name + Car Name"
														name="txtModelName">
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
														
														String a_city = (String)request.getSession().getAttribute("access");
		
														while (ct.next()) {
														%>
														<option value="<%=ct.getString(1)%>"
															<%if (a_city.equals(ct.getString(1))) {%> selected <%}%>>
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
													<h6 class="mt-3">Fuel Type</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtFuelType"
														placeholder="Enter Fuel Type">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Airbags</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtAirbags"
														placeholder="Enter No. Of Airbags">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Seating Capacity</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														name="txtSeatingCapacity" placeholder="Enter No. Of Seats">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Rent Per Day</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														name="txtRentPerDay" placeholder="Enter Per Day Rent">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Rent Per KM</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtRentPerKM"
														placeholder="Enter Per KM Rent">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Limit Per Day</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														name="txtLimitPerDay" placeholder="Enter Per Day Limit">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Image 1</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="file" class="form-control" name="Img1">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Image 2</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="file" class="form-control" name="Img2">
												</div>
											</div>
											<div class="row mb-0">
												<div class="col-sm-3"></div>
												<div class="col-sm-9">
													<input type="submit" value="Add A Car"
														class="btn btn-primary mt-3 mr-3" name="btnSubmit_Car">
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