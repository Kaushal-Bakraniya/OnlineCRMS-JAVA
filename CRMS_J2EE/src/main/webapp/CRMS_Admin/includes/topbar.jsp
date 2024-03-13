<%@page import="java.sql.ResultSet"
		import="models.getData"%>
<%
	
	if(session.getAttribute("aid") == null || session.getAttribute("access") == null)
	{
		response.sendRedirect("Login_Admin.jsp");
	}

	ResultSet rs = getData.select("Select UserName From tbl_admin Where ID = '"+ (Integer)session.getAttribute("aid") +"'");

	String name = "";
	
	String pageName = request.getServletPath();
	
	while(rs.next())
	{
		name = rs.getString(1);
	}
	
%>
<!-- Topbar -->
<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">

		<!-- Nav Item - Search Dropdown (Visible Only XS) -->
		<li class="nav-item dropdown no-arrow d-sm-none"><a
			class="nav-link dropdown-toggle" href="#" id="searchDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
		</a> 
				
		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span
				class="mr-2 d-none d-lg-inline text-gray-600 small">CRMS Admin</span> <img class="img-profile rounded-circle"
				src="img/undraw_profile.svg">
		</a> <!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="Admin_Profile.jsp"> <i
					class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> <%= name %></a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="Logout_Admin.jsp"> <i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					Logout
				</a>
			</div></li>

	</ul>

</nav>
<!-- End of Topbar -->
