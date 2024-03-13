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

<title>Return Car - CRMS Admin</title>

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
int driver_id = 0;
int total_days = 0;
int days_late = 0;
int PerDayRent = 0;
int Extra_Charge = 0;
int FinalPayment = 0;
String u_name = "";
int kms = 0;

try {

	ResultSet res = getData.select("select * from tbl_rented where ID = '" + request.getParameter("ID") + "'");

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
		driver_id = res.getInt(13);
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	Date date1 = sdf.parse(Pickup_Date);
	Date date2 = sdf.parse(Return_Date);

	Date dt = new Date();

	String current_date = dt.toString();

	long time_difference = dt.getTime() - date2.getTime();

	total_days = Days + (int) ((time_difference / (1000 * 60 * 60 * 24)) % 365);

	days_late = (int) ((time_difference / (1000 * 60 * 60 * 24)) % 365);

	PerDayRent = Payment / Days;

	Extra_Charge = PerDayRent * days_late;

	FinalPayment = Payment + Extra_Charge;

	ResultSet resName = getData.select("select Name from tbl_users where ID = '" + user_id + "'");

	while (resName.next()) {
		u_name = resName.getString(1);
	}

	res = getData.select("select KMS_Driven from tbl_cars where Reg_No = '" + RegNo + "'");

	while (res.next()) {
		kms = res.getInt(1);
	}

	request.getSession().setAttribute("booking_id", Integer.parseInt(request.getParameter("ID")));
	request.getSession().setAttribute("b_car_ref", RegNo);
	request.getSession().setAttribute("status", status);

} 
catch (Exception e) 
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
										<form action="../userBookings_controller" method="post">
											<div class="row mb-2">
												<div class="col-sm-12 text-dark">
													<h2 class="font-weight-bold ml-1 pb-1">Return This Car</h2>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Request ID</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control bg-white"
														name="r_id" value="<%=request.getParameter("ID")%>"
														readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">User ID</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="user_id"
														value="<%=user_id%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Username</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" name="user_name"
														value="<%=u_name%>">
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
													<h6 class="mt-3">City</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" value="<%=City%>"
														name="txtCity">
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
														value="<%=days_late%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Pickup Date</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="date" class="form-control"
														name="txtPickUpDate" value="<%=Pickup_Date%>">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Return Date</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="date" class="form-control"
														placeholder="yyyy-mm-dd" name="txtReturnDate" value=""
														id="date">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Basic Rent</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=Payment%>" name="txtBasicRent"  id="my_input1" onfocusout="doMath()">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Extra Charge</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=Extra_Charge%>" name="txtExtraCharge" id="my_input2" onfocusout="doMath()">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Other Fines</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" value="0"
														name="txtOtherFines"  id="my_input3" onfocusout="doMath()">
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Final Payments</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=FinalPayment%>" name="txtFinalPayment"  id="final">
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
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">
														<a href="Drivers_Details.jsp?ID=<%=driver_id%>">Driver
															Info</a>
													</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=driver_id%>" name="txtDriverID">
												</div>
											</div>
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
													<input type="submit" value="Mark As Available"
														name="btnUser_Book" class="btn btn-primary mt-3 mr-3" />
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
	
	<script type="text/javascript">
    	function doMath()
    	{
        	var my_input1 = document.getElementById('my_input1').value;
        	var my_input2 = document.getElementById('my_input2').value;
        	var my_input3 = document.getElementById('my_input3').value;

        	var sum = parseInt(my_input1) + parseInt(my_input2) + parseInt(my_input3);
        	
        	document.getElementById('final').value = sum;
    	}
	</script>
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