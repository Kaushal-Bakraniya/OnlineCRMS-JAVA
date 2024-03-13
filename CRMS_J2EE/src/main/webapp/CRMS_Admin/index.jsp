<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Index - CRMS Admin</title>

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

<%
ResultSet result;
ResultSet result2;
ResultSet result3;
ResultSet result4;

result = getData.select("select COUNT(*) from tbl_cars");
result2 = getData.select("select COUNT(*) from tbl_cars where Status = 'Available'");
result3 = getData.select("select COUNT(*) from tbl_rented where Status != 'Rented'");
result4 = getData.select("select COUNT(*) from tbl_rented where Status = 'Rented'");

String access = "";

if (session.getAttribute("access") != null) {
	access = (String) session.getAttribute("access");
}

if (!access.equals("ALL")) {
	result = getData.select("select COUNT(*) from tbl_cars where City = '" + session.getAttribute("access") + "'");

	result2 = getData.select("select COUNT(*) from tbl_cars where Status = 'Available' and City = '"
	+ session.getAttribute("access") + "'");

	result3 = getData.select("select COUNT(*) from tbl_rented where Status != 'Rented' and City = '"
	+ session.getAttribute("access") + "'");

	result4 = getData.select("select COUNT(*) from tbl_rented where Status = 'Rented' and City = '"
	+ session.getAttribute("access") + "'");
}

double cars_count = 0;

while (result.next()) {
	cars_count = result.getInt(1);
}

double cars_available = 0;

while (result2.next()) {
	cars_available = result2.getInt(1);
}

int cars_rented = 0;

while (result4.next()) {
	cars_rented = result4.getInt(1);
}

int cars_requested = 0;

while (result3.next()) {
	cars_requested = result3.getInt(1);
}

double available_percentage = (cars_available / cars_count) * 100;
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

				<!-- TopBar Starts -->
				<%@ include file="includes/topbar.jsp"%>
				<!-- TopBar Ends -->


				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Content Row -->
					<div class="row">
						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Pending Requests</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=cars_requested%></div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
								</a>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<a href="Booking_RentedCars.jsp">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-success text-uppercase mb-1">
													Cars On Rent</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800"><%=cars_rented%></div>
											</div>
											<div class="col-auto">
												<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<a href="Cars_Details.jsp">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-info text-uppercase mb-1">
													Available Cars</div>
												<div class="row no-gutters align-items-center">
													<div class="col-auto">
														<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><%=String.format("%.0f", cars_available)%></div>
													</div>
													<div class="col">
														<div class="progress progress-sm mr-2">
															<div class="progress-bar bg-info" role="progressbar"
																style="width: <%=available_percentage%>%"
																aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<a href="Cars_Details.jsp">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-primary text-uppercase mb-1">
													Total Cars</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800"><%=String.format("%.0f", cars_count)%></div>
											</div>
											<div class="col-auto">
												<i class="fas fa-calendar fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>

					</div>
					<!--a Content Row -->
				</div>
				<!-- End of Content Wrapper -->

				<div class="container-fluid">


					<div
						class="d-sm-flex align-items-center justify-content-between mt-1 mb-3">
						<h1 class="h3 text-gray-800 my-2 font-weight-bold">Welcome,
							Admin</h1>
					</div>


					<section class="mt-2 mb-4">
						<p>Lorem ipsum dolor sit amet. Qui soluta magni id dolor
							dolorum aut sunt natus est tempora perspiciatis qui harum libero
							non odit rerum? Qui aperiam pariatur eos repudiandae porro qui
							earum deleniti et sunt commodi sed odit incidunt.</p>
					</section>


					<div
						class="d-sm-flex align-items-center justify-content-between mb-4 mt-1">
						<h1 class="h4 mb-0 text-gray-800 font-weight-bold">Car
							Booking Requests</h1>
					</div>


					<div class="table-responsive" style="width: 97%">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Reg_No</th>
									<th scope="col">Requested_By</th>
									<th scope="col">Days</th>
									<th scope="col">Pickup_Date</th>
									<th scope="col">Retutn_Date</th>
									<th scope="col">Payment</th>
									<th scope="col">Status</th>
									<th scope="col">View Details</th>
								</tr>
							</thead>
							<tbody>
								<%
								String selectQuery = "select * from tbl_rented where Status = 'Requested'";

								if (!access.equals("ALL")) {
									selectQuery = "select * from tbl_rented where Status = 'Requested' and City = '"
									+ (String) session.getAttribute("access") + "'";
								}

								ResultSet res = getData.select(selectQuery);

								int i = 0;

								while (res.next()) {
									i = i + 1;
								%>
								<tr>
									<th scope="row"><%=res.getInt(1)%></th>
									<td><a
										href="Cars_ViewDetails.jsp?RegNo=<%=res.getString(3)%>"><%=res.getString(3)%></a></td>
									<td><a href="Users_ViewDetails.jsp?ID=<%=res.getInt(2)%>">User_ID
											: <%=res.getInt(2)%></a></td>
									<td><%=res.getString(4)%></td>
									<td><%=res.getString(5)%></td>
									<td><%=res.getString(6)%></td>
									<td><%=res.getString(10)%></td>
									<td><%=res.getString(12)%></td>
									<td><a
										href="Booking_ConfirmForm.jsp?ID=<%=res.getInt(1)%>">View
											Details</a></td>
								</tr>
								<%
								if (i > 5) {
									break;
								}
								}
								%>
							</tbody>
						</table>
					</div>
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
				<script src="vendor/chart.js/Chart.min.js"></script>

				<!-- Page level custom scripts -->
				<script src="js/demo/chart-area-demo.js"></script>
				<script src="js/demo/chart-pie-demo.js"></script>
</body>

</html>