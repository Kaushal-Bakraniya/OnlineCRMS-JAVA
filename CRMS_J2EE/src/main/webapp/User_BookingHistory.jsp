<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking History - CRMS</title>
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
		<h2 class="mb-3 font-weight-bold">Renting History</h2>
		</br>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Download Receipt</th>
						<th scope="col">UID</th>
						<th scope="col">Reg_No</th>
						<th scope="col">Pickup_Date</th>
						<th scope="col">Return_Date</th>
						<th scope="col">Days</th>
						<th scope="col">Days_Late</th>
						<th scope="col">Final_Payment</th>
						<th scope="col">Note</th>
					</tr>
				</thead>
				<tbody>
					<%
					ResultSet res = getData.select(
							"select * from tbl_oldbookings where UID = '" + (Integer) session.getAttribute("uid") + "'ORDER BY ID ASC");

					while (res.next()) {
					%>
					<tr>
						<th scope="row"><%=res.getInt(1)%></th>
						<td><a href="pdf_receipt?ID=<%=res.getInt(1)%>">Download
								Receipt</a></td>
						<td><%=res.getInt(2)%></td>
						<td><%=res.getString(3)%></td>
						<td><%=res.getString(5)%></td>
						<td><%=res.getString(6)%></td>
						<td><%=res.getString(7)%></td>
						<td><%=res.getString(8)%></td>
						<td><%=res.getString(13)%></td>
						<td><%=res.getString(14)%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			</table>
		</div>

	</div>
	<!-- Book a car Section End -->
	<br>

	<!-- Scripts -->
	<script src="JS/script.js"></script>
</body>

</html>