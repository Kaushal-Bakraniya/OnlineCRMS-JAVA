<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Car Details - CRMS</title>
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="CSS/FontAwesome/css/all.min.css">

</head>

<body>
	<!-- Header Section Starts -->
	<%@ include file="Includes/Header.jsp"%>
	<!-- Header Section Ends -->

	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- Book a car Section Starts -->
	<div class="container ">
		<h2 class="mb-3 font-weight-bold">
			Cars Rented By
			<%=name%></h2>
		<p style="font-size: 2vh">- Request Will Only Be Considered If
			Status Is Approved Or Rented</p>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Car RegNo</th>
					<th scope="col">Pickup Date</th>
					<th scope="col">Return Date</th>
					<th scope="col">Advance Payment</th>
					<th scope="col">Status</th>
					<th scope="col">Download Receipt</th>
					<th scope="col">View Details</th>
					<th scope="col" style="color:brown">Cancel Request</th>
				</tr>
			</thead>
			<tbody>
				<%
				ResultSet res2 = getData.select("select * from tbl_rented Where UID = '" + (Integer) session.getAttribute("uid") + "'");

				while (res2.next()) {
				%>
				<tr>
					<th scope="row"><%=res2.getInt(1)%></th>
					<td scope="row"><%=res2.getString(3)%></td>
					<td scope="row"><%=res2.getString(5)%></td>
					<td scope="row"><%=res2.getString(6)%></td>
					<td scope="row"><%=res2.getString(10)%></td>
					<td scope="row"><%=res2.getString(12)%></td>
					<td scope="row"><a
						href="pdf_receipt_2?ID=<%=res2.getString(1)%>">Download
							Receipt</a></td>
					<td scope="row"><a
						href="BookedCar_Info.jsp?RegNo=<%=res2.getString(3)%>">View
							Details</a></td>
					<td scope="row">
						<a href="userBookings_controller?ID=<%=res2.getInt(1)%>&OP=Delete" style="color:brown">Cancel Request</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>


		</table>

	</div>
	<!-- Book a car Section End -->
	<br>

	<!-- Scripts -->
	<script src="JS/script.js"></script>
</body>

</html>