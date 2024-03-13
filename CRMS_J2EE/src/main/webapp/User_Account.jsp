<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Account - CRMS</title>
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">

<%
String gen = "";
String contact = "";
String email = "";
String address = "";
String city = "";
String profilepic = "";

ResultSet res = getData.select("Select * from tbl_users where ID = '" + (Integer) session.getAttribute("uid") + "'");

while (res.next()) {
	gen = res.getString(5);
	email = res.getString(3);
	contact = res.getString(4);
	address = res.getString(6);
	city = res.getString(7);
	profilepic = res.getString(8);
}
%>

</head>

<body class="user_account">
	<!-- Header Section Starts -->
	<%@ include file="Includes/Header.jsp"%>
	<!-- Header Section Ends -->

	<!-- User Account Start -->
	<div class="container mb-5 fix-container">
		<div class="main-body">
			<div class="row">
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center mt-3">
								<img src="<%=profilepic%>" width="169" height="169" alt="Admin"
									class="rounded-circle p-1 bg-primary" width="170">
								<div class="mt-5">
									<h4><%=name%></h4>
									<p class="text-secondary mt-4"><%=email%></p>
									<p class="text-secondary mt-4"><%=address%>,
										<%=city%></p>
									<a href="Logout.jsp" class="text-white"><button
											class="btn btn-primary mt-3 mb-3">Logout</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8 fix-details">
					<div class="card">
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-sm-3">
									<h6 class="mt-3">Registration ID</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control bg-white"
										value="CR_2023_<%=(Integer) session.getAttribute("uid")%>"
										readonly>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col-sm-3">
									<h6 class="mt-3">Name</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control bg-white"
										value="<%=name%>" readonly>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col-sm-3">
									<h6 class="mt-3">Gender</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control bg-white"
										value="<%=gen%>" readonly>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col-sm-3">
									<h6 class="mt-3">Phone</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control bg-white"
										value="+91 <%=contact%>" readonly>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col-sm-3">
									<h6 class="mt-3">Email</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control bg-white"
										value="<%=email%>" readonly>
								</div>
							</div>
							<div class="row mb-2">
								<div class="col-sm-3">
									<h6 class="mt-3">City</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control bg-white"
										value="<%=city%>" readonly>
								</div>
							</div>
							<div class="row mb-0">
								<div class="col-sm-3">
									<h6 class="mt-3">Address</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control bg-white"
										value="<%=address%>" readonly>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 mt-4">
					<div class="card">
						<div class="card-body">
							<p class="mb-0">
								<i class="fa fa-cog"></i>&emsp;<a href="User_Edit.jsp"
									style="color: black;">Edit Profile</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-8 mt-4">
					<div class="card">
						<div class="card-body">
							<p class="mb-0">
								<i class="fa fa-car"></i>&emsp;<a href="BookedCar_Details.jsp"
									style="color: black;">View Cars Rented By You</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col mt-4">
					<div class="card">
						<div class="card-body">
							<p class="mb-0">
								<i class="fa fa-car"></i>&emsp;<a href="User_BookingHistory.jsp"
									style="color: black;">Cars Renting History</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col mt-4">
					<div class="card">
						<div class="card-body">
							<p class="mb-0">
								<i class="fa fa-message"></i>&emsp;<a href="User_Feedback.jsp"
									style="color: black;">Give Us Feedback</a>
							</p>
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

</body>

</html>