<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cars Info - CRMS</title>

<!-- Stylesheets -->
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">

<%
ResultSet res = getData.select("select * from tbl_cars where ID = '" + request.getParameter("ID") + "'");

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
	RegNo = res.getString(2);
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
	<section class="row m-0" id="info">
		<div class="col-sm">
			<p>
				Registration No. :
				<%=RegNo%></p>
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

	<!-- Book Your Car Button Starts -->
	<section class="row m-0 mb-4">
		<div class="col-sm text-center">
			<a href="BookCar_Form.jsp?ID=<%=request.getParameter("ID")%>">
				<button type="button" class="btn btn-primary shadow p-2"
					style="font-size: larger;">
					Book This
					<%=Model_Name%>
					Now
				</button>
			</a>
		</div>
	</section>
	<!-- Book Your Car Button Starts -->


	<!-- Footer Start -->
	<%@ include file="Includes/Footer.jsp"%>
	<!-- Footer End -->

	<!-- Scripts -->
	<script src="JS/script.js"></script>
</body>

</html>