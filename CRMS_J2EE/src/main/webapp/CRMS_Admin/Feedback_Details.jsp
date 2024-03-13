<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Feedback Details - CRMS Admin</title>

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
ResultSet res = getData.select("select * from tbl_Feedback where ID = '" + request.getParameter("ID") + "'");

int uid = 0;
String uname = "";
String uemail = "";
String feedback = "";

while (res.next()) {
	uid = res.getInt(1);
	uname = res.getString(2);
	uemail = res.getString(4);
	feedback = res.getString(5);
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

				<div class="container mb-5 fix-container fix-2">
					<div class="main-body">
						<div class="row d-flex justify-content-center align-items-center">
							<div class="col-lg-8 fix-details">
								<div class="card">
									<div class="card-body">
										<form action="../feedback_controller" method="post">
											<div class="row mb-2">
												<div class="col-sm-12 text-dark">
													<h2 class="font-weight-bold ml-1 pb-1">Review Feedback</h2>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Feedback ID</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														value="<%=request.getParameter("ID")%>" name="txtID"
														readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">User ID</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" value="<%=uid%>"
														name="txtName" readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">Username</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" value="<%=uname%>"
														name="txtName" readonly>
												</div>
											</div>
											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">User Email</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control" value="<%=uemail%>"
														name="txtName" readonly>
												</div>
											</div>

											<div class="row mb-2">
												<div class="col-sm-3">
													<h6 class="mt-3">User Feedback</h6>
												</div>
												<div class="col-sm-9 text-secondary">
													<textarea class="form-control rounded-0" name="txtFeedback"
														rows="7" readonly><%=feedback%></textarea>
												</div>
											</div>
											<div class="row mb-0">
												<div class="col-sm-3"></div>
												<div class="col-sm-9">
													<input type="submit" name="btnFeedback"
														value="Mark As Reviewed"
														class="form-control btn btn-primary mt-3 mr-3" /> <a
														href="Feedback_Reply.jsp?ID=<%=request.getParameter("ID")%>"
														class="form-control btn btn-primary mt-3 mr-3">Reply
														To Feedback</a> <input type="submit" name="btnFeedback"
														value="Delete Feedback"
														class="form-control btn btn-danger mt-3 mr-3" />
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- User Account End -->


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