
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center my-2"
		href="index.jsp">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-car"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			Car Rentals</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider mb-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active">
		<a class="nav-link" href="index.jsp">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
		</a>
	</li>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item mt-1"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapsePages"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-book"></i> <span>Manage Bookings</span>
	</a>
		<div id="collapsePages" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Booking Options</h6>
				<a class="collapse-item" href="Booking_Requests.jsp">Booking requests</a> 
				<a class="collapse-item" href="Booking_RentedCars.jsp">Rented Cars</a>  
				<a class="collapse-item" href="Booking_CanceledCars.jsp">Canceled Requests</a> 
				<a class="collapse-item" href="Booking_History.jsp">Bookings History</a>
			</div>
		</div></li>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item mt-2"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fas fa-fw fa-car"></i> <span>Manage
				Cars</span>
		</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Cars Options</h6>
				<a class="collapse-item" href="Cars_Details.jsp">View Car Details</a> <a
					class="collapse-item" href="Cars_Add.jsp">Add New Cars</a> <a
					class="collapse-item" href="Cars_Update.jsp">Edit & Delete Car Details</a>
			</div>
		</div></li>

	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item mt-2">
	<a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseUtilities"
		aria-expanded="true" aria-controls="collapseUtilities"> 
		<i class="fas fa-fw fa-user"></i> <span>Manage Users</span>
	</a>
		<div id="collapseUtilities" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">User Options</h6>
				<a class="collapse-item" href="Users_Details.jsp">View Users
					Details</a> <a class="collapse-item" href="Users_Add.jsp">Add
					New User</a> <a class="collapse-item" href="Users_Update.jsp">Edit & Delete
					User Details</a>
			</div>
		</div></li>

	<!-- Nav Item - Charts -->
	<li class="nav-item mt-2"><a class="nav-link" href="Drivers_Manage.jsp"> <i
			class="fas fa-fw fa-id-card"></i> <span>Manage Drivers</span></a></li>

	<%
	if(session.getAttribute("access")!= null)
	{
		if(session.getAttribute("access").equals("ALL"))
		{
	%>
	<!-- Nav Item - Tables -->
	<li class="nav-item mt-2"><a class="nav-link" href="Feedbacks_Manager.jsp"> 
	<i class="fas fa-solid fa-message fa-fw"></i> <span>User
				Feedbacks</span></a></li>
	
	<li class="nav-item mt-2">
		<a class="nav-link" href="Accounts_Manager.jsp"> 
			<i class="fas fa-fw fa-user"></i> 
			<span>Accounts Manager</span>
		</a>
	</li>
	
	<%
		}
	}
	%>
	
	</br>
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline mt-3">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->
