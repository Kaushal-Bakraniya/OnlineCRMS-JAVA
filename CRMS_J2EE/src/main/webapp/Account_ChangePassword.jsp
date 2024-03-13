<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Setup New Password - CRMS</title>
<link rel="stylesheet" href="CSS/form.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
<%
	if(request.getSession().getAttribute("userid") == null)
	{
		response.sendRedirect("Login.jsp");	
	}
%>
</head>
<body>
	<div class="wrapper login">
		<div class="form-container">
			<form action="recovery_controller" method="post">
				<div class="form">
					<div class="heading">
						<h2>Add New Password</h2>
					</div>
					<br />
					<div class="form-wrap">
						<div class="form-item">
							<label><b>Enter Password</b></label> <br /> <input
								type="password" name="txtPwd" required>
						</div>
					</div>
					<div class="form-wrap">
						<div class="form-item">
							<label><b>Confirm Password</b></label> <br /> <input
								type="password" name="txtConfPwd" required>
						</div>
					</div>
					<br />
					<div class="btn">
						<input type="submit" name="btnVerify" id="#"
							value="Setup Password">
					</div>
					<br />
				</div>
			</form>
		</div>
	</div>
	<footer>
		<p>
			Copyright &copy;
			<script>document.write(new Date().getFullYear())</script>
			- Car Rental Services
		</p>
	</footer>
	<script type="text/javascript">
		function preventBack() {
			window.history.forward();
		}
		setTimeout("preventBack()", 0);
		window.onunload = function() {
			null
		};
	</script>
</body>
</html>