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
<%
    	String searchCity = "";
    	searchCity = request.getParameter("txtSearchCity");
    %>
</head>

<body>
	<!-- Header Section Starts -->
	<%@ include file="Includes/Header.jsp"%>
	<!-- Header Section Ends -->
	<!-- Search Start -->
	<div class="container mb-4 height_2">
		<form class="row" action="Search.jsp" method="post">
			<div class="col-lg px-2">
				<label>Location (City)</label> <select name="txtSearchCity"
					class="custom-select px-4 mb-3 ipheight">
					<%
					ResultSet city = getData.select("select Access from tbl_admin where ID != 1 ORDER BY ID ASC");

					while (city.next()) {
					%>
					<option value="<%=city.getString(1)%>"
						<%if (searchCity.equals(city.getString(1))) {%> selected <%}%>>
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
					<input type="date" name="p_date"
						class="custom-select px-4 mb-3 ipheight" placeholder="Pickup Date"
						data-target="#date" data-toggle="datetimepicker"
						value="<%= request.getParameter("p_date") %>" />
				</div>
			</div>
			<div class="col-lg px-2 fix-ip">
				<label>Return Date</label>
				<div class="date mb-3" id="date" data-target-input="nearest">
					<input type="date" name="p_date"
						class="custom-select px-4 mb-3 ipheight" placeholder="Pickup Date"
						data-target="#date" data-toggle="datetimepicker"
						value="<%= request.getParameter("r_date") %>" />
				</div>
			</div>
			<div class="col-lg px-2">
				<label class="temp-label">..</label>
				<button class="btn btn-primary btn-block" type="submit">Search</button>
			</div>
		</form>
	</div>
	<!-- Search End -->

	<!-- Book a car Section Starts -->
	<div class="container mt-4">
		<p class="mt-2 mb-5 h2 font-weight-bold" style="text-align: left;">
			Find Cars In
			<%= searchCity %></p>

		<div class="row">

			<%
        	ResultSet res = getData.select("select * from tbl_cars where Status = 'Available' and city = '"+ searchCity +"'");
        	
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
</body>

</html>