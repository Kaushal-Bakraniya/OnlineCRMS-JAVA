<!DOCTYPE html>
<%@page import="java.util.Formatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Booking Edit - CRMS Admin</title>

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

ResultSet res = getData.select("select * from tbl_oldbookings where ID = '" + request.getParameter("ID") + "'");

int UID = 0;
String RegNo = "";
String Contact = "";
String PickupDate = "";
String ReturnDate = "";
int Days = 0;
int Days_Late = 0;
int Basic_Rent = 0;
int Other_Fine = 0;
int Extra_Charge = 0;
int Final_Payment = 0;
String Note = "";

while (res.next()) {
	UID = res.getInt(2);
	RegNo = res.getString(3);
	Contact = res.getString(4);
	PickupDate = res.getString(5);
	ReturnDate = res.getString(6);
	Days = res.getInt(7);
	Days_Late = res.getInt(8);
	Basic_Rent = res.getInt(10);
	Other_Fine = res.getInt(11);
	Extra_Charge = res.getInt(12);
	Final_Payment = res.getInt(13);
	Note = res.getString(14);
}

request.getSession().setAttribute("record_id", Integer.parseInt(request.getParameter("ID")));
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
													<h2 class="font-weight-bold ml-1 pb-1">Update Record</h2>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">User ID</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="user_name"
														value="<%=UID%>" readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">User Contact</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=Contact%>" name="user_contact">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">RegNo</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtRegNo"
														placeholder="10 Digits Only" value="<%=RegNo%>">
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
													<h6 class="mt-3">Late Days</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="txtLateDays"
														value="<%=Days_Late%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Pickup Date</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="date" class="form-control"
														name="txtPickUpDate" value="<%=PickupDate%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Return Date</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="date" class="form-control"
														placeholder="yyyy-mm-dd" name="txtReturnDate"
														value="<%=ReturnDate%>" id="date">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Basic Rent</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=Basic_Rent%>" name="txtBasicRent">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Extra Charge</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=Extra_Charge%>" name="txtExtraCharge">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Other Fines</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=Other_Fine%>" name="txtOtherFines">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Final Payments</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=Final_Payment%>" name="txtFinalPayment">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Note</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" value="<%=Note%>"
														name="txtNote">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3"></div>
												<div class="col-sm-9">
													<input type="submit" value="Edit Record"
														name="btnUser_Book"
														class="form-control btn btn-primary mt-3 mr-3" /> <input
														type="submit" value="Delete Record" name="btnUser_Book"
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