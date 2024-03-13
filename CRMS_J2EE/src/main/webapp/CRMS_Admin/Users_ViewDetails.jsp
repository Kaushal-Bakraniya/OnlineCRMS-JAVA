<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Users View Details - CRMS Admin</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<%
String nm = "";
String gen = "";
String contact = "";
String email = "";
String address = "";
String city = "";
String profilepic = "";
String pic = "";

ResultSet res = getData.select("Select * from tbl_users where ID = '" + request.getParameter("ID") + "'");

while (res.next()) {
	nm = res.getString(2);
	gen = res.getString(5);
	email = res.getString(3);
	contact = res.getString(4);
	address = res.getString(6);
	city = res.getString(7);
	profilepic = res.getString(9);
	pic = res.getString(8);
}
%>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- SideBar Starts -->
		<%@ include file="includes/sidebar.jsp"%>
		<!-- SideBar Ends -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<%@ include file="includes/topbar.jsp"%>

				<!-- /.container-fluid -->
				<div class="table-responsive" style="width: 95%; margin-left: 2%">
					<p class="h3 mb-2">
						About
						<%=nm%>
					</p>
					<br />
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Column Name</th>
								<th scope="col">Details</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>User ID</td>
								<td><%=request.getParameter("ID")%></td>
							</tr>
							<tr>
								<td>Full Name</td>
								<td><%=nm%></td>
							</tr>
							<tr>
								<td>Gender</td>
								<td><%=gen%></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><%=email%></td>
							</tr>
							<tr>
								<td>Contact</td>
								<td><%=contact%></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><%=address%></td>
							</tr>
							<tr>
								<td>City</td>
								<td><%=city%></td>
							</tr>
							<tr>
								<td>Profile Picture</td>
								<td><a href="../<%=pic%>"><img src="../<%=pic%>"
										style="width: 30%; height: 200px"></a></td>
							</tr>
							<tr>
								<td>Edit Record</td>
								<td><a
									href="Users_UpdateForm.jsp?ID=<%=request.getParameter("ID")%>&OP=edit"
									class="w-50 btn btn-primary">Edit</a></td>
							</tr>
							<tr>
								<td>Delete Record</td>
								<td><a
									href="Users_UpdateForm.jsp?ID=<%=request.getParameter("ID")%>&OP=delete"
									class="w-50 btn btn-danger">Delete</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- End of Main Content -->


			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

</body>

</html>