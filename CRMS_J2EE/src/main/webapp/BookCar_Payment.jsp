<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="models.getData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment - CRMS</title>
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<%
ResultSet info = getData
		.select("select * from tbl_cars where ID = '" + request.getParameter("c_id") + "' and Status = 'Available'");

int RentPerDay = 0;
int RentPerKM = 0;
int LimitPerDay = 0;

while (info.next()) {
	RentPerDay = info.getInt(9);
	RentPerKM = info.getInt(10);
	LimitPerDay = info.getInt(11);
}

String pickupDate = request.getParameter("txtPickDate");
String returnDate = request.getParameter("txtReturnDate");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

Date date1 = sdf.parse(pickupDate);
Date date2 = sdf.parse(returnDate);

long time_difference = date2.getTime() - date1.getTime();

int days = (int) ((time_difference / (1000 * 60 * 60 * 24)) % 365) + 1;

int Payment = RentPerDay * days;
%>
</head>
<body>
	<div class="container mb-5 mt-5">
		<div class="main-body">
			<div class="row d-flex justify-content-center align-items-center">
				<div class="col-lg-7 fix-details">
					<div class="card">
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-sm-12 text-dark">
									<h2 class="font-weight-bold ml-1 pb-1">Payments</h2>
								</div>
							</div>
							<form action="userBookings_controller" method="post">
								<div class="row mb-0">
									<div class="col-sm-3">
										<h6 class="mt-3">Pickup Date</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="date" class="form-control" name="txtPickDate"
											value="<%=request.getParameter("txtPickDate")%>" readonly>
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3">
										<h6 class="mt-3">Return Date</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="date" class="form-control" name="txtReturnDate"
											value="<%=request.getParameter("txtReturnDate")%>" readonly>
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3">
										<h6 class="mt-3">Driver</h6>
									</div>
									<div class="col-sm-9">
										<input type=text " class="form-control"
											value="<%=request.getParameter("driver")%>" name="driver"
											readonly />
										<%
										if (request.getParameter("driver").equals("With Driver")) {
										%>
										<p style="font-size: 12px">You Have To Pay Extra Charges
											For Driver When You Get Car</p>
										<%
										}
										%>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mt-3">Current Payment</h6>
									</div>
									<div class="col-sm-9">
										<p style="margin-top: 12px; font-size: 20px">
											<b><%=Payment%> INR For <%=days%> Day<%
											if (days > 0) {
											%>s<%
											}
											%></b>
										</p>
										<%
										if (request.getParameter("driver").equals("With Driver")) {
										%>
										<p style="font-size: 14px; font-size: 14px">For Driver :
											750 INR Per Day (You Have To Pay When You Get Car)</p>
										<%
										}
										%>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mt-3">Enter Card No.</h6>
									</div>
									<div class="col-sm-9">
										<input type="hidden" name="txtPayment" value="<%=Payment%>" />
										<input type="password" class="form-control" name="txtCardNo"
											placeholder="Enter Credit/Debit Card No">
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3"></div>
									<div class="col-sm-9">
										<input type="submit" name="btnUser_Book"
											class="btn btn-primary mt-3 mr-3" value="Payment Now" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>