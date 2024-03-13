<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booked Car Info - CRMS</title>

<!-- Stylesheets -->
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">

<%
ResultSet chk = getData
		.select("select UID from tbl_rented where UID = '" + (Integer) session.getAttribute("uid") + "'");

int id = 0;

while (chk.next()) {
	id = chk.getInt(1);
}

if (id <= 0) {
	out.println("<script>alert('Access Denied')</script>");
	out.println("<script>window.location='BookedCars_Details.jsp'</script>");
}

ResultSet res = getData.select("select * from tbl_cars where Reg_No = '" + request.getParameter("RegNo") + "'");

String RegNo = "";
String Model_Name = "";
String Status = "";
String City = "";
String FuelType = "";
int Airbags = 0;
int SeatingCapacity = 0;
int Rent_PerDay = 0;
int Rent_PerKM = 0;
int Limit_PerDay = 0;
String img1 = "";
String img2 = "";

while (res.next()) {
	Model_Name = res.getString(3);
	Status = res.getString(4);
	City = res.getString(5);
	FuelType = res.getString(6);
	Airbags = res.getInt(7);
	SeatingCapacity = res.getInt(8);
	Rent_PerDay = res.getInt(9);
	Rent_PerKM = res.getInt(10);
	Limit_PerDay = res.getInt(11);
	img1 = res.getString(12);
	img2 = res.getString(13);
}
%>

</head>

<body>
	<!-- Header Section Starts -->
	<%@ include file="Includes/Header.jsp"%>
	<!-- Header Section Ends -->

	<!-- Car Preview Section Starts -->
	<section class="JoinUs mt-5" id="cardetails"
		style="margin-bottom: 0; padding-bottom: 0;">
		<h1 class="mt-5 mb-2">
			<b><%=Model_Name%></b>
		</h1>
		<div class="JoinUsInfo">
			<div>
				<img src="<%=img1%>" id="img1">
			</div>
			<div>
				<img src="<%=img2%>" id="img2">
			</div>
		</div>
		<br>
	</section>
	<!-- Car Preview Section Ends -->

	<!-- Car Information Section Starts -->
	<section class="row m-0 mb-5" id="info">
		<div class="col-sm">
			<p>
				Registration No. :
				<%=request.getParameter("RegNo")%></p>
			<p>
				Model Name :
				<%=Model_Name%></p>
			<p>
				Fuel Type :
				<%=FuelType%></p>
			<p>
				Status :
				<%=Status%></p>
			<p>
				Rent Per Day :
				<%=Rent_PerDay%>/Day
			</p>
			<p>Limit Per Day : <%= Limit_PerDay %> KM</p>
			<p>Driver : 750/Day</p>
		</div>
		<div class="col-sm">
			<p>
				Rent Per Kilometer :
				<%=Rent_PerKM%></p>
			<p>
				Limit Per Day :
				<%=Limit_PerDay%>
				KM
			</p>
			<p>
				City Available :
				<%=City%></p>
			<p>
				Airbags :
				<%=Airbags%></p>
			<p>
				Seating Capacity :
				<%=SeatingCapacity%></p>
		</div>
	</section>
	<!-- Car Information Section Ends -->

	<!-- Footer Start -->
	<%@ include file="Includes/Footer.jsp"%>
	<!-- Footer End -->

	<!-- Scripts -->
	<script src="JS/script.js"></script>
</body>

</html>