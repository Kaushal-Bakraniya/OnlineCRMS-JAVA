<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us - CRMS</title>

<!-- Stylesheets -->
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">

<%
	ResultSet res = getData.select("select Email from tbl_users where ID = '"+ (Integer)session.getAttribute("uid") +"'");
	
	String Email = "";

	while(res.next())
	{
		Email = res.getString(1);
	}
	
%>

</head>
<body>
	<!-- Header Section Starts -->
	<%@ include file="Includes/Header.jsp"%>
	<!-- Header Section Ends -->

	<!-- About Us Section Starts -->
	<section class="about-section">
		<div class="contact-form">
			<div>
				<h1>About Us</h1>
				<p>As a car renting agency, our business plays a critical role in providing transportation solutions for individuals and organizations alike. our agency offers customers the flexibility to rent a vehicle for a specified period of time, whether it be for a few weeks or several days, without the commitment and financial burden of owning a car.</p>
				<p>Our agency likely provides a wide range of vehicles to meet the v
				
				arying needs and preferences of our customers. From small, fuel-efficient cars for city driving to larger vehicles for family trips or moving purposes, our agency has something for everyone.</p>
				<p>
Overall, as a car renting agency, our business plays a vital role in meeting the transportation needs of individuals and organizations. By prioritizing customer service and staying on top of industry trends, our agency will continue to provide valuable services to customers for years to come.
				</p>
			</div>
			<div>
				<img src="Images/about-png.png" alt="">
			</div>
		</div>
	</section>
	<!-- About Us Section Ends -->

	<!-- Contact Us Section Starts -->
	<section class="contact-section">
		<div class="contact-body">
			<div class="contact-info">
				<div>
					<span><i class="fas fa-mobile-alt"></i></span> <span>Phone
						No.</span> <span class="text">+91 1234567890</span>
				</div>
				<div>
					<span><i class="fas fa-envelope-open"></i></span> <span>E-mail</span>
					<span class="text">hello@carrental.com</span>
				</div>
				<div>
					<span><i class="fas fa-map-marker-alt"></i></span> <span>Address</span>
					<span class="text">2939 Marine Drive, Mumbai MH, India</span>
				</div>
				<div>
					<span><i class="fas fa-clock"></i></span> <span>Opening
						Hours</span> <span class="text">Monday - Friday (9:00 AM to 5:00
						PM)</span>
				</div>
			</div>
			<div class="contact-form">
				<div>
					<img src="Images/contact-png.png" alt="">
				</div>
				<form method="post" action="feedback_controller">
					<h1>Give us feedback</h1>
					<br> <input type="email" value="<%= Email %>"
						class="form-control mt-2 mb-4 bg-white" readonly>
					<textarea rows="7" placeholder="Message" name="txtFeedback"
						class="form-control mb-4"></textarea>
					<input type="submit" class="send-btn" name="btnFeedback"
						value="Send Feedback">
				</form>
			</div>
		</div>
	</section>
	<!-- Contact Section Ends -->


	<!-- Footer Start -->
	<%@ include file="Includes/Footer.jsp"%>
	<!-- Footer End -->

	<!-- Scripts -->
	<script src="JS/script.js"></script>
</body>
</html>