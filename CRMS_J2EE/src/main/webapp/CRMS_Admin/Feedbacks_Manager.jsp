<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Feedback Manager - CRMS Admin</title>

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
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

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
			<div id="content p-3">

				<%@ include file="includes/topbar.jsp"%>

				<!-- /.container-fluid -->
				<div class="table-responsive" style="width: 95%; margin-left: 2%">
					<h2>Feedbacks</h2>
					<br />
					<table class="table">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">User_Name</th>
								<th scope="col">User_Email</th>
								<th scope="col">Feedback</th>
								<th scope="col">Status</th>
								<th scope="col">View Details</th>
							</tr>
						</thead>
						<tbody>
							<%
							ResultSet res2 = getData.select("select * from tbl_feedback where Status = 'Not Readed'");

							while (res2.next()) {
							%>
							<tr>
								<th scope="row"><%=res2.getInt(1)%></th>
								<td scope="row"><%=res2.getString(2)%></td>
								<td scope="row"><%=res2.getString(4)%></td>
								<td scope="row"><%=res2.getString(5)%></td>
								<td scope="row"><%=res2.getString(6)%></td>
								<td scope="row"><a
									href="Feedback_Details.jsp?ID=<%=res2.getInt(1)%>">View
										Details</a></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
				<!-- End of Main Content -->

				<div class="table-responsive" style="width: 95%; margin-left: 2%">
					<h2>Reviewed Feedbacks</h2>
					<br />
					<table class="table">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">User_Name</th>
								<th scope="col">User_Email</th>
								<th scope="col">Feedback</th>
								<th scope="col">Status</th>
								<th scope="col">View Details</th>
							</tr>
						</thead>
						<tbody>
							<%
							ResultSet res = getData.select("select * from tbl_feedback where Status = 'Reviewed' or Status = 'Replied'");

							while (res.next()) {
							%>
							<tr>
								<th scope="row"><%=res.getInt(1)%></th>
								<td scope="row"><%=res.getString(2)%></td>
								<td scope="row"><%=res.getString(4)%></td>
								<td scope="row"><%=res.getString(5)%></td>
								<td scope="row"><%=res.getString(6)%></td>
								<td scope="row"><a
									href="Feedback_Details.jsp?ID=<%=res.getInt(1)%>">View
										Details</a></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

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