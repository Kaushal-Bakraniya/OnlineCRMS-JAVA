<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - CRMS</title>
<link rel="stylesheet" href="CSS/form.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
</head>
<body>
	<div class="wrapper login">
		<div class="form-container">
			<form action="user_controller" method="post">
				<div class="form">
					<div class="heading">
						<h2>Login Form - CRMS</h2>
					</div>
					<div class="form-wrap fit">
						<div class="form-item ">
							<img src="Images/User_Icon.png" class="userIcon">
						</div>
					</div>
					<div class="form-wrap">
						<div class="form-item">
							<label>Email Address</label> <input type="email" name="txtEmail"
								required>
						</div>
					</div>
					<div class="form-wrap">
						<div class="form-item">
							<label>Password</label> <input type="password" name="txtPassword"
								required>
						</div>
					</div>
					<div class="btn">
						<input type="submit" name="btnSubmit_User" id="#" value="Log In">
					</div>
				</div>
				<p>
					Dont have a account ? <a href="SignUp.jsp">Create Account</a>
				</p>
				<p>
					Forgot Password ? <a href="Account_VerifyEmail.jsp" target="_blank">Click Here</a>
				</p>
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
</body>
</html>