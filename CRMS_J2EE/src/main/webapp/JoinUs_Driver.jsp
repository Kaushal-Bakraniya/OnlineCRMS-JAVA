<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Careers - CRMS</title>
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
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
									<h2 class="font-weight-bold ml-1 pb-1">Join Us - Become A
										Driver</h2>
									<p style="font-size: 15px" class="mt-3">
										Fill Out All The Details Carefully </br> We Will Contact You If
										Your Skills Match Our Requirements
									</p>
								</div>
							</div>
							<form action="Driver_Manager" method="post"
								enctype="multipart/form-data">
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Full Name (According To Documents)</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control mt-2"
											name="txtFullName">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Gender</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<select class="form-control" name="txtGen">
											<option value="Male">Male</option>
											<option value="Female">Female</option>
										</select>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Email</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="email" class="form-control" name="txtEmail">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Contact No.</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control" name="txtContactNo">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Address</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control" name="txtAddress">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">City</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<select name="txtCity" class="form-control">
											<%
											ResultSet ct = getData.select("select Access from tbl_admin where ID != 1 ORDER BY ID ASC");

											while (ct.next()) {
											%>
											<option value="<%=ct.getString(1)%>">
												<%=ct.getString(1)%>
											</option>
											<%
											}
											%>
										</select>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-2">
											Experience <br>(In Years)
										</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="number" class="form-control" name="txtExperience">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-2">
											Aadhar Card <br> (JPG/PNG)
										</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="file" class="form-control" name="txtAadharCard"
											accept="image/*">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-2">
											Driving License <br> (JPG/PNG)
										</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="file" class="form-control"
											name="txtDrivingLicense" accept="image/*">
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-sm-3">
										<h6 class="mt-3">Date Of Birth</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="date" class="form-control" name="txtDOB" id="datePickerId1">
									</div>
								</div>
								<div class="row mb-0">
									<div class="col-sm-3"></div>
									<div class="col-sm-9">
										<input type="submit" name="btnDriver"
											class="btn btn-primary mt-3 mr-3" value="Apply For This Job" />
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
		datePickerId1.max = new Date().toISOString().split("T")[1];
	</script>
</body>

</html>