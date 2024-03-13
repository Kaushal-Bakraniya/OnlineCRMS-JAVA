<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book a car - CRMS</title>
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
</head>

<body>
	<!-- Header Section Starts -->
	<%@ include file="Includes/Header.jsp"%>
	<!-- Header Section Ends -->

	<!-- Search Bar Start -->
	<div class="height d-flex justify-content-center align-items-center">
		<div class="col-md-6">
			<div class="form">
				<i class="fa fa-search"></i> <input type="text"
					class="form-control form-input" id="srch" onkeyup="searchCar()"
					placeholder="Search anything..."> <span class="left-pan"><i
					class="fa fa-microphone ml-3"></i></span>
			</div>
		</div>
	</div>
	<!-- Seach Bar End-->

	<!-- Book a car Section Starts -->
	<div class="container ">
		<p class="mt-2 mb-5 h2 font-weight-bold" style="text-align: left;">
			Find Cars In
			<%= u_city %></p>

		<div class="row">

			<%
        	ResultSet res = getData.select("select * from tbl_cars where Status = 'Available' and city = '"+ u_city +"'");
        	
    		while(res.next())
    		{
        %>
			<div class="col-md-4 car_box filterDiv <%= res.getString(4) %> ">
				<div class="product-item">
					<a href="#"><img src="<%= res.getString(12) %>" alt=""
						style="height: 225px"></a>
					<div class="down-content">
						<h4><%= res.getString(3) %></h4>
						<a href="BookCar_Info.jsp?ID=<%= res.getInt("ID") %>"><span>View
								Details</span></a>
						<h6><%= res.getString(9) %>INR/Day
						</h6>
					</div>
				</div>
			</div>
			<%
        	}
		%>
		</div>
	</div>
	<!-- Book a car Section End -->
	<br>


	<!-- Footer Start -->
	<%@ include file="Includes/Footer.jsp"%>
	<!-- Footer End -->

	<!-- Scripts -->
	<script src="JS/script.js"></script>
	<script src="JS/filterDiv.js"></script>

</body>

</html>