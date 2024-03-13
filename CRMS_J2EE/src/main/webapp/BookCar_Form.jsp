<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Car Form - CRMS</title>
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">

<%
ResultSet res = getData
		.select("select * from tbl_cars where ID = '" + request.getParameter("ID") + "' and Status = 'Available'");

String RegNo = "";
String Model_Name = "";
String Status = "";
String City = "";
int RentPerDay = 0;
int RentPerKM = 0;
int LimitPerDay = 0;
int id = 0;

while (res.next()) {
	RegNo = res.getString(2);
	Model_Name = res.getString(3);
	Status = res.getString(4);
	City = res.getString(5);
	RentPerDay = res.getInt(9);
	RentPerKM = res.getInt(10);
	LimitPerDay = res.getInt(11);
	id = res.getInt(1);
}

String Email = "";

res = getData
		.select("select Email from tbl_users where ID = '" + (Integer) request.getSession().getAttribute("uid") + "'");

while (res.next()) {
	Email = res.getString(1);
}

if (!Status.equals("Available")) {
	out.println("<script>alert('Sorry This Car Is Just Booked Few Minutes Ago')</script>");
	out.println("<script>windwo.location='index.jsp'</script>");
}

request.getSession().setAttribute("cid", id);
%>


</head>

<body>
	<!-- Header Section Starts -->
	<%@ include file="Includes/Header.jsp"%>
	<!-- Header Section Ends -->

	<!-- User Account Start -->
	<div class="container mb-5 fix-container fix-2">
		<div class="main-body">
			<div class="row d-flex justify-content-center align-items-center">
				<div class="col-lg-7 fix-details">
					<div class="card">
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-sm-12 text-dark">
									<h2 class="font-weight-bold ml-1 pb-1">Book a car</h2>
								</div>
							</div>
							<!-- <form action="userBookings_controller" method="post"> -->
							<form action="BookCar_Payment.jsp" method="post">
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">User ID</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control"
											value="CR_2023_<%=(Integer) session.getAttribute("uid")%>"
											readonly>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Email</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control" value="<%=Email%>"
											readonly>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Car</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control"
											value="<%=Model_Name%>" readonly>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Car Reg. No</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control" value="<%=RegNo%>"
											name="txtRegNo" readonly>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">City</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control" value="<%=City%>"
											readonly>
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3">
										<h6 class="mt-3">Pickup Date</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="date" class="form-control" name="txtPickDate"
											id="datePickerId1" required>
										<p>Counting from 9:00 AM</p>
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3">
										<h6 class="mt-3">Return Date</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="date" class="form-control" name="txtReturnDate"
											id="datePickerId2" required>
										<p>Counting from 9:00 AM</p>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Driver</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<select name="driver" class="form-control"
											aria-label="Default select example">
											<option value="Without Driver">Without Driver</option>
											<option value="With Driver">With Driver</option>
										</select>
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3">
										<h6 class="mt-3">Price</h6>
									</div>
									<div class="col-sm-9 mt-3 text-secondary">
										<p>
											Rent Per Day :
											<%=RentPerDay%>
											INR
										</p>
										<p>
											Rent Per KM :
											<%=RentPerKM%>
											INR (Applied If Limit Per Day Is Exceeded)
										</p>
										<p>
											Limit Per Day :
											<%=LimitPerDay%>
											KM
										</p>
										<p>Driver : 750/Day</p>
										<input type="hidden" name="c_id"
											value="<%=request.getParameter("ID")%>">
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3"></div>
									<div class="col-sm-9">
										<input type="submit" name="btnUser_Book"
											class="btn btn-primary mt-3 mr-3" value="Book This Car Now" />
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

	<!-- Footer Start -->
	<%@ include file="Includes/Footer.jsp"%>
	<!-- Footer End -->

	<!-- Scripts -->
	<script src="JS/script.js"></script>
	<script>
		datePickerId1.min = new Date().toISOString().split("T")[0];
		datePickerId2.min = new Date().toISOString().split("T")[0];
	</script>
</body>

</html>