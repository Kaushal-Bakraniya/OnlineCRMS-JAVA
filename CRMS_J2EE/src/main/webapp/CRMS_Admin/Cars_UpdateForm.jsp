<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Car Update Form - CRMS Admin</title>

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

int id = 0;
String regNo = "";
String modelName = "";
String Status = "";
String City = "";
String Fuel_Type = "";
int airbags = 0;
int seats = 0;
int rentPerDay = 0;
int rentPerKM = 0;
int LimitPerDay = 0;

String heading = "Edit Car Details", btnText = "Update Car Details", clr = "primary";
try
{
if (request.getParameter("OP").equals("delete")) {
	heading = "Are You Sure ?";
	btnText = "Permenantly Delete Record";
	clr = "danger";
}

ResultSet res = getData.select("Select * from tbl_cars where ID = '" + request.getParameter("ID") + "'");

while (res.next()) {
	id = res.getInt(1);
	regNo = res.getString(2);
	modelName = res.getString(3);
	Status = res.getString(4);
	City = res.getString(5);
	Fuel_Type = res.getString(6);
	airbags = res.getInt(7);
	seats = res.getInt(8);
	rentPerDay = res.getInt(9);
	rentPerKM = res.getInt(10);
	LimitPerDay = res.getInt(11);
}
}
catch(Exception e)
{
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
										<form action="../car_controller" method="post"
											enctype="multipart/form-data">
											<div class="row mb-2">
												<div class="col-sm-12 text-dark">
													<h2 class="font-weight-bold ml-1 pb-1"><%=heading%></h2>
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-sm-3">
													<h6 class="mt-3">Registration ID</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" value="<%=id%>"
														name="txtID" readonly>
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-sm-3">
													<h6 class="mt-3">Registration No.</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														placeholder="Enter Registration Number" name="txtRegNo"
														value="<%=regNo%>">
												</div>
											</div>
											<div class="row mb-3">
												<div class="col-sm-3">
													<h6 class="mt-3">Model Name</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														placeholder="Enter Company Name + Car Name"
														value="<%=modelName%>" name="txtModelName">
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
														value="<%=Fuel_Type%>" placeholder="Enter Fuel Type">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Airbags</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtAirbags"
														value="<%=airbags%>" placeholder="Enter No. Of Airbags">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Seating Capacity</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														name="txtSeatingCapacity" value="<%=seats%>"
														placeholder="Enter No. Of Seats">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Rent Per Day</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														name="txtRentPerDay" value="<%=rentPerDay%>"
														placeholder="Enter Per Day Rent">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Rent Per KM</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=rentPerKM%>" name="txtRentPerKM"
														placeholder="Enter Per KM Rent">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Limit Per Day</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=LimitPerDay%>" name="txtLimitPerDay"
														placeholder="Enter Per Day Limit">
												</div>
											</div>
											<div class="row mb-0">
												<div class="col-sm-3">
													<h6 class="mt-3">Image 1</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="file" class="form-control" name="Img1">
												</div>
											</div>
											<div class="row mb-0">
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
													<input type="submit" value="<%=btnText%>"
														class="btn btn-<%=clr%> mt-3 mr-3" name="btnSubmit_Car">
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