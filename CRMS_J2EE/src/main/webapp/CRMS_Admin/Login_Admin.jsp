<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - CRMS Admin</title>
<link rel="stylesheet" href="../CSS/form.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">
<style>
.bg {
	background-image: url("img/bg-img/login-bg.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}

@media only screen and (max-width:900px) {
	.bg {
		background-image: none;
		background-color: skyblue;
	}
}
</style>
</head>
<body class="bg">
	<div class="wrapper login">
		<div class="form-container">
			<form action="../admin_controller" method="post">
				<div class="form">
					<div class="heading">
						<h2>CRMS - Admin Panel</h2>
					</div>
					<div class="form-wrap fit">
						<div class="form-item ">
							<img src="img/Icons/Admin_Icon.png" class="userIcon">
						</div>
					</div>
					<div class="form-wrap">
						<div class="form-item">
							<label>Username</label> <input type="text" name="txtUnm" required>
						</div>
					</div>
					<div class="form-wrap">
						<div class="form-item">
							<label>Password</label> <input type="password" name="txtPassword"
								required>
						</div>
					</div>
					<div class="btn">
						<input type="submit" name="btnSubmit_Admin" id="#" value="Log In">
					</div>
				</div>
				<br />
				<br />
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