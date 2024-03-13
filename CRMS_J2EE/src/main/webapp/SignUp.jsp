
<!DOCTYPE html>
<%@page import="models.getData"%>
<%@page import="java.sql.ResultSet"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Account - CRMS</title>
<link rel="stylesheet" href="CSS/form.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
</head>
<body>
	<div class="wrapper">
		<div class="form-container">
			<form action="user_controller" method="post"
				enctype="multipart/form-data">
				<div class="form">
					<div class="heading">
						<h2>Registration Form</h2>
					</div>
					<div class="form-wrap fullname">
						<div class="form-item">
							<label>Enter Name</label> <input type="text" name="txtName"
								required>
						</div>
						<div class="form-item">
							<label>Email Address</label> <input type="email" name="txtEmail"
								required>
						</div>
					</div>
					<div class="form-wrap fullname">
						<div class="form-item">
							<label>Contact No.</label> <input type="text" name="txtContact"
								required>
						</div>
						<div class="form-item">
							<label>Gender</label> <select name="gender">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</div>
					</div>
					<div class="form-wrap">
						<div class="form-item">
							<label>Address</label> <input type="text" name="txtAddress"
								required>
						</div>
					</div>
					<div class="form-wrap select-box">
						<div class="form-item">
							<label>City</label> <select name="city">
								<%
									ResultSet ct = getData.select("select Access from tbl_admin where ID != 1 ORDER BY ID ASC");

									while(ct.next())
									{
								%>
								<option value="<%= ct.getString(1) %>">
									<%= ct.getString(1) %>
								</option>
								<%
									}
								%>
							</select>
						</div>
						<div class="form-item">
							<label>Profile Picture</label> <input type="file"
								name="fileProfilePic" id="#">
						</div>
					</div>
					<div class="form-wrap fullname">
						<div class="form-item">
							<label>Password</label> <input type="password" name="txtPassword"
								required>
						</div>
						<div class="form-item">
							<label>Confirm Password</label> <input type="password"
								name="txtConfPassword" required>
						</div>
					</div>
					<div class="btn">
						<input type="submit" name="btnSubmit_User" id="#"
							value="Get Started">
					</div>
				</div>
				<p>
					Already have a account ? <a href="Login.jsp">Login Here</a>
				</p>
			</form>
		</div>
	</div>

	<!-- Footer Start -->
	<%@ include file="Includes/Footer.jsp"%>
	<!-- Footer End -->
</body>
</html>