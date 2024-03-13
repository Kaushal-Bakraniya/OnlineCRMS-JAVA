<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Feedback - CRMS</title>
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<%
ResultSet res = getData
		.select("select Email from tbl_users where ID = '" + (Integer) session.getAttribute("uid") + "'");

String Email = "";

while (res.next()) {
	Email = res.getString(1);
}
%>

</head>

<body class="user_account">
	<!-- Header Section Starts -->
	<%@ include file="Includes/Header.jsp"%>
	<!-- Header Section Ends -->
	<!-- User Account Start -->
	<div class="container fix-container fix-2 p-3">

		<div class="card mb-3">
			<div class="card-body p-1">
				<h5 class="m-2">
					<i class="fa fa-message mr-3"></i>Give Us Feedback
				</h5>
			</div>
		</div>

		<p class="mb-3">Let us know how we can improve your experience.</p>

		<div class="row d-flex justify-content-left">
			<div class="col-lg-8">
				<div class="card mb-3 bdr">
					<div class="card-body p-3">
						<form method="post" action="feedback_controller" class="m-0 p-0">
							<div class="form-group">
								<label>Your Email Address</label> <input type="email"
									class="form-control" value="<%=Email%>" readonly>
							</div>
							<div class="form-group">
								<label>Your Feedback</label>
								<textarea class="form-control rounded-0" name="txtFeedback"
									rows="7" required></textarea>
							</div>
							<input type="submit" name="btnFeedback"
								class="form-control btn btn-primary" value="Send Feedback">
						</form>
					</div>
				</div>
			</div>
		</div>

		<p class="m-0">Thanks for taking the time to give us feedback.</p>
		<p>We review ideas and suggestions that people send to us and use
			them to improve the experience for everyone.</p>

	</div>
	<!-- User Account End -->


	<!-- Footer Start -->
	<%@ include file="Includes/Footer.jsp"%>
	<!-- Footer End -->

	<!-- Scripts -->
	<script src="JS/script.js"></script>

</body>

</html>