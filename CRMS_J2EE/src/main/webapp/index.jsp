<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home - CRMS</title>

<!-- Stylesheets -->
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
</head>

<body>
	<!-- Header Section Starts -->
	<%@ include file="Includes/Header.jsp"%>
	<!-- Header Section Ends -->./;

	<!-- Home Section Start -->
	<section class="home" id="home">
		<h1>Find Your Car</h1>
		<img src="Images/home-img.png" alt="Loading..">
	</section>
	<!-- Home Section Ends -->

	<!-- Search Start -->
	<div class="container">
		<form class="row" action="Search.jsp" method="post">
			<div class="col-lg px-2">
				<label>Location (City)</label> <select name="txtSearchCity"
					class="custom-select px-4 mb-3 ipheight">
					<%
					ResultSet city = getData.select("select Access from tbl_admin where ID != 1 ORDER BY ID ASC");

					while (city.next()) {
					%>
					<option value="<%=city.getString(1)%>"
						<%if (u_city.equals(city.getString(1))) {%> selected <%}%>>
						<%=city.getString(1)%>
					</option>
					<%
					}
					%>
				</select>
			</div>
			<div class="col-lg px-2">
				<label>Pickup Date</label>
				<div class="date mb-3" id="date" data-target-input="nearest">
					<input type="date" name="p_date" id="datePickerId1"
						class="custom-select px-4 mb-3 ipheight" placeholder="Pickup Date"
						data-target="#date" data-toggle="datetimepicker" required />
				</div>
			</div>
			<div class="col-lg px-2 fix-ip">
				<label>Return Date</label>
				<div class="date mb-3" id="date" data-target-input="nearest">
					<input type="date" name="r_date" id="datePickerId2"
						class="custom-select px-4 mb-3 ipheight" placeholder="Pickup Date"
						data-target="#date" data-toggle="datetimepicker" required />
				</div>
			</div>
			<div class="col-lg px-2">
				<label class="temp-label">..</label>
				<button class="btn btn-primary btn-block" type="submit">Search</button>
			</div>
		</form>
	</div>
	<!-- Booking Section Ends -->

	<br>
	<hr>
	<!-- Top Choices Starts -->
	<div class="container mt-5">
		<p class="h2 mt-5 mb-5 font-weight-bold">Find Your Favourite</p>

		<div class="row">

			<%
			ResultSet res = getData.select("select * from tbl_cars where status='Available'");

			int i = 1;

			while (res.next()) {
			%>
			<div class="col-md-4">
				<div class="product-item">
					<a href="BookCar_Info.jsp?ID=<%=res.getInt(1)%>"><img
						src="<%=res.getString(12)%>" alt="" style="height: 225px"></a>
					<div class="down-content">
						<h4><%=res.getString(3)%></h4>
						<a href="BookCar_Info.jsp?ID=<%=res.getInt(1)%>"><span>View
								Details</span></a>
						<h6><%=res.getString(11)%>INR/Day
						</h6>
					</div>
				</div>
			</div>
			<%
			i++;

			if (i > 6) {
				break;
			}
			}
			%>

		</div>

		<div class="col text-center mt-4 mb-5">
			<a href="Search.jsp?txtSearchCity=<%= u_city %>" style="color: white;"><button
					type="button" class="btn btn-primary shadow">Find More
					Cars</button></a>
		</div>

	</div>
	<!-- Top Choices Ends -->
	<!-- Why Choose Us ? Starts -->
	<section class="contact-section mt-5 mb-5 border">
		<div class="contact-body">
			<h1 class="mt-3 font-weight-bold">Why Choose Us ?</h1>
			<div class="contact-info border-0 p-0">
				<div class="bdr mt-5">
					<span><img src="Images/Ratings.png"
						style="width: 150px; height: 150px"></span> <span
						style="font-size: 25px; font-weight: bold;" class="mt-4">
						4.7 Star Ratings </span>
				</div>
				<div class="bdr mt-5">
					<span><img src="Images/Award_Icon.png"
						style="width: 150px; height: 150px"></span> <span
						style="font-size: 25px; font-weight: bold;" class="mt-4">
						Best Car Rentals Winner 2023 </span>
				</div>
				<div class="bdr mt-5">
					<span><img src="Images/ISO_Certified.png"
						style="width: 150px; height: 150px"></span> <span
						style="font-size: 25px; font-weight: bold;" class="mt-4">
						ISO Certified </span>
				</div>
				<div class="bdr mt-5">
					<span><img src="Images/Driver_Icon.png"
						style="width: 150px; height: 150px"></span> <span
						style="font-size: 25px; font-weight: bold;" class="mt-4">
						IDO Certified Drivers </span>
				</div>
			</div>
		</div>
	</section>
	<!-- Why Choose Us ? Ends -->


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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
