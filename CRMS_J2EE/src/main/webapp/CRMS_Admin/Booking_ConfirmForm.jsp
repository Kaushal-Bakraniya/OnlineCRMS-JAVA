<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Booking Confirm - CRMS Admin</title>

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
ResultSet res = getData.select("select * from tbl_rented where ID = '" + request.getParameter("ID") + "'");

int user_id = 0;
String RegNo = "";
int Days = 0;
String Pickup_Date = "";
String Return_Date = "";
String Contact = "";
String Address = "";
String City = "";
int Payment = 0;
String note = "";
String status = "";

while (res.next()) {
	user_id = res.getInt(2);
	RegNo = res.getString(3);
	Days = res.getInt(4);
	Pickup_Date = res.getString(5);
	Return_Date = res.getString(6);
	Contact = res.getString(7);
	Address = res.getString(8);
	City = res.getString(9);
	Payment = res.getInt(10);
	note = res.getString(11);
	status = res.getString(12);
}

String u_name = "";

res = getData.select("select Name from tbl_users where ID = '" + user_id + "'");

while (res.next()) {
	u_name = res.getString(1);
}

int kms = 0;

res = getData.select("select KMS_Driven from tbl_cars where Reg_No = '" + RegNo + "'");

while (res.next()) {
	kms = res.getInt(1);
}

String head = "";
String text = "";

if (status.equals("Approved")) {
	head = "Final Renting Approval";
	text = "Final Approval";
} else {
	head = "View Request Details";
	text = "Approve Booking";
}

request.getSession().setAttribute("booking_id", Integer.parseInt(request.getParameter("ID")));
request.getSession().setAttribute("b_car_reg", RegNo);
request.getSession().setAttribute("status", status);
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
										<form action="../userBookings_controller" method="post">
											<div class="row mb-2">
												<div class="col-sm-12 text-dark">
													<h2 class="font-weight-bold ml-1 pb-1"><%=head%></h2>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Request ID</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="b_id"
														value="<%=request.getParameter("ID")%>" readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">
														<a href="Users_ViewDetails.jsp?ID=<%=user_id%>">User
															ID</a>
													</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtID"
														value="<%=user_id%>" readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">
														<a href="Users_ViewDetails.jsp?ID=<%=user_id%>">Username</a>
													</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtName"
														value="<%=u_name%>" readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">
														<a href="Cars_ViewDetails.jsp?RegNo=<%=RegNo%>">RegNo</a>
													</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtRegNo"
														placeholder="10 Digits Only" value="<%=RegNo%>" readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Days</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtDays"
														value="<%=Days%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Pickup Date</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="date" class="form-control"
														name="txtPickupDate" value="<%=Pickup_Date%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Return Date</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="date" class="form-control"
														value="<%=Return_Date%>" name="txtReturnDate">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">User Contact</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=Contact%>" name="txtContact">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">User Address</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=Address%>" name="txtAddress">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">City</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" value="<%=City%>"
														name="txtCity" readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Payment</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=Payment%>" name="txtPayment">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Note</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" value="<%=note%>"
														name="txtNote">
												</div>
											</div>
											<%
											if (note.equals("With Driver")) {
											%>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Driver ID</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<select name="txtDriverID" class="form-control">
														<%
														ResultSet driver = getData
																.select("select ID,Full_Name from tbl_driver where Status = 'AVAILABLE' and City = '" + City + "'");

														while (driver.next()) {
														%>
														<option value="<%=driver.getInt(1)%>"><%=driver.getInt(1)%>
															-
															<%=driver.getString(2)%></option>
														<%
														}
														%>
														<option value="0">None</option>
													</select>
												</div>
											</div>
											<%
											}
											%>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Kilometers Driven</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" value="<%=kms%>"
														name="txtKMS">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3"></div>
												<div class="col-sm-9">
												<%
													if(!status.equals("Canceled"))
													{
												%>
													<input type="submit" value="<%=text%>"
														name="btnUser_Book"
														class="form-control btn btn-primary mt-3 mr-3" /> 
												<%
													}
												%>
													<input
														type="submit" value="Decline Request" name="btnUser_Book"
														class="form-control btn btn-danger mt-3 mr-3" />
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

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