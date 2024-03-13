<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Car View Details - Tables</title>

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
<%
ResultSet res1 = getData.select("Select * from tbl_cars where Reg_No = '" + request.getParameter("RegNo") + "'");

int id = 0;
String regNo = "";
String modelName = "";
String Status = "";
String City = "";
String Fuel_Type = "";
int airbags = 0;
int seats = 0;
int rentPerDay = 0;
int rentPerKM = 0;
int LimitPerDay = 0;
String Image1 = "";
String Image2 = "";

while (res1.next()) {
	id = res1.getInt(1);
	regNo = res1.getString(2);
	modelName = res1.getString(3);
	Status = res1.getString(4);
	City = res1.getString(5);
	Fuel_Type = res1.getString(6);
	airbags = res1.getInt(7);
	seats = res1.getInt(8);
	rentPerDay = res1.getInt(9);
	rentPerKM = res1.getInt(10);
	LimitPerDay = res1.getInt(11);
	Image1 = res1.getString(12);
	Image2 = res1.getString(13);
}

int u_id = 0;
String u_name = "";

if (!Status.equals("Available")) {
	res1 = getData.select("Select UID from tbl_rented where Reg_No = '" + regNo + "'");

	while (res1.next()) {
		u_id = res1.getInt(1);
	}

	res1 = getData.select("Select Name from tbl_users where ID = '" + u_id + "'");

	while (res1.next()) {
		u_name = res1.getString(1);
	}
}
%>
<style>
td {
	width: 50%;
}
</style>
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
					<p class="h3 mb-2">
						About
						<%=modelName%>
						(<%=regNo%>)
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
								<td>Car ID</td>
								<td><%=id%></td>
							</tr>
							<tr>
								<td>Registration No.</td>
								<td><%=regNo%></td>
							</tr>
							<tr>
								<td>Model Name</td>
								<td><%=modelName%></td>
							</tr>
							<tr>
								<td>Status</td>
								<td><%=Status%></td>
							</tr>
							<tr>
								<td>Currently Rented To</td>
								<td>
									<%
									if (Status.equals("Available")) {
										out.print("None");
									} else {
									%> <a href="Users_ViewDetails.jsp?ID=<%=u_id%>">ID : <%=u_id%>
										- <%=u_name%></a> <%
 }
 %>
								</td>
							</tr>
							<tr>
								<td>City</td>
								<td><%=City%></td>
							</tr>
							<tr>
								<td>Fuel Type</td>
								<td><%=Fuel_Type%></td>
							</tr>
							<tr>
								<td>Airbags</td>
								<td><%=airbags%></td>
							</tr>
							<tr>
								<td>Seating Capacity</td>
								<td><%=seats%></td>
							</tr>
							<tr>
								<td>Rent Per Day</td>
								<td><%=rentPerDay%></td>
							</tr>
							<tr>
								<td>Charge Per KM</td>
								<td><%=rentPerKM%></td>
							</tr>
							<tr>
								<td>Limit Per Day</td>
								<td><%=LimitPerDay%></td>
							</tr>
							<tr>
								<td>Image 1</td>
								<td><a href="../<%=Image1%>"><img
										src="../<%=Image1%>" style="width: 50%; height: 175px"></a></td>
							</tr>
							<tr>
								<td>Image 2</td>
								<td><a href="../<%=Image2%>"><img
										src="../<%=Image2%>" style="width: 50%; height: 175px"></a></td>
							</tr>
							<tr>
								<td>Edit Record</td>
								<td><a href="Cars_UpdateForm.jsp?ID=<%=id%>&OP=edit"
									class="w-50 btn btn-primary">Edit</a></td>
							</tr>
							<tr>
								<td>Delete Record</td>
								<td><a href="Cars_UpdateForm.jsp?ID=<%=id%>&OP=delete"
									class="w-50 btn btn-danger">Delete</a></td>
							</tr>
						</tbody>
					</table>
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