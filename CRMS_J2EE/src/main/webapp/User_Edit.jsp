<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile - CRMS</title>
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
String pwd = "";

ResultSet res = getData.select("Select * from tbl_users where ID = '" + (Integer) session.getAttribute("uid") + "'");

while (res.next()) {
	gen = res.getString(5);
	email = res.getString(3);
	contact = res.getString(4);
	address = res.getString(6);
	city = res.getString(7);
	profilepic = res.getString(9);
	pwd = res.getString(9);
}

request.getSession().setAttribute("ueid", (Integer) session.getAttribute("uid"));
%>

</head>

<body class="user_account">
	<!-- Header Section Starts -->
	<%@ include file="Includes/Header.jsp"%>
	<!-- Header Section Ends -->
	<!-- User Account Start -->
	<div class="container mb-5 fix-container fix-2">
		<div class="main-body">
			<div class="row d-flex justify-content-center align-items-center">
				<div class="col-lg-8 fix-details">
					<div class="card">
						<div class="card-body">
							<form action="user_controller" method="post"
								enctype="multipart/form-data">
								<div class="row mb-2">
									<div class="col-sm-12 text-dark">
										<h2 class="font-weight-bold ml-1 pb-1">Account Settings</h2>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Registration ID</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control"
											value="CR_2023_<%=(Integer) session.getAttribute("uid")%>"
											readonly>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Name</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control" name="txtName"
											value="<%=name%>">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Gender</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<select name="gender" class="form-control">
											<option value="Male" <%if (gen.equals("Male")) {%> selected
												<%}%>>Male</option>
											<option value="Female" <%if (gen.equals("Female")) {%>
												selected <%}%>>Female</option>
										</select>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Phone</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control" name="txtContact"
											placeholder="10 Digits Only" value="<%=contact%>">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Email</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control" name="txtEmail"
											value="<%=email%>">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">City</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<select name="city" class="form-control">
											<%
											ResultSet ct = getData.select("select Access from tbl_admin where ID != 1 ORDER BY ID ASC");

											while (ct.next()) {
											%>
											<option value="<%=ct.getString(1)%>"
												<%if (city.equals(ct.getString(1))) {%> selected <%}%>>
												<%=ct.getString(1)%>
											</option>
											<%
											}
											%>
										</select>
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3">
										<h6 class="mt-3">Address</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control" value="<%=address%>"
											name="txtAddress">
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3">
										<h6 class="mt-3">Password</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="password" class="form-control" value="<%=pwd%>"
											name="txtPassword">
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3"></div>
									<div class="col-sm-9">
										<input type="submit" value="Save Details"
											class="btn btn-primary mt-3 mr-3" name="btnSubmit_User">
										<input type="submit" value="Permenantly Delete Account"
											class="btn btn-danger mt-3" name="btnSubmit_User">
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

</body>

</html>