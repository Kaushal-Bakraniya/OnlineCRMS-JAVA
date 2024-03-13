<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Car Update - CRMS Admin</title>

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
				
				<div class="container">
					<div class="row">
						<div class="col-lg-6  mt-3 mb-4">
							<h2 class="text-secondary ml-2">Edit & Delete Car Details</h2>
						</div>
						<div class="col-lg-6 mt-3 mb-4 text-right">
							<input type="text" id="srch" onkeyup="search()"
								class="form-control w-50 d-inline border-secondary"
								placeholder="Search Car By Reg No." />
						</div>
					</div>
				</div>
				
				
				<div class="table-responsive" style="width: 95%; margin-left: 2%">
					<table class="table text-center">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Reg_No.</th>
								<th scope="col">Model_Name</th>
								<th scope="col">Category</th>
								<th scope="col">Rent_PerDay</th>
								<th scope="col">Rent_PerKM</th>
								<th scope="col">Image</th>
								<th scope="col">Edit</th>
								<th scope="col">Delete</th>
							</tr>
						</thead>
						<tbody id="tbl">
							<%
							String selectQuery = "select * from tbl_cars";

							if (session.getAttribute("access") != null) {
								if (!session.getAttribute("access").equals("ALL")) {
									selectQuery = "select * from tbl_cars where city = '" + session.getAttribute("access") + "'";
								}
							}

							ResultSet res = getData.select(selectQuery);

							int i = 1;

							while (res.next()) {
							%>
							<tr id="myTr">
								<th scope="row"><%=res.getInt(1)%></th>
								<td><%=res.getString(2)%></td>
								<td><%=res.getString(3)%></td>
								<td><%=res.getString(4)%></td>
								<td><%=res.getString(9)%></td>
								<td><%=res.getString(10)%></td>
								<td><img src="../<%=res.getString(12)%>"
									style="width: 125px; height: 75px"></td>
								<td><a
									href="Cars_UpdateForm.jsp?ID=<%=res.getInt(1)%>&OP=edit">Edit</a></td>
								<td><a
									href="Cars_UpdateForm.jsp?ID=<%=res.getInt(1)%>&OP=delete">Delete</a></td>
							</tr>
							<%
							}
							%>
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

	<!-- Search Script -->
	<script src="vendor/search.js"></script>
	
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