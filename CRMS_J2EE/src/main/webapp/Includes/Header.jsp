<!-- Header Section Starts -->
<!-- Header Section Starts -->
<%@page import="java.sql.ResultSet"
		import="models.getData"%>
<%
	
	if(session.getAttribute("uid") == null)
	{
		response.sendRedirect("Login.jsp");
	}

	ResultSet rs = getData.select("Select Name,City From tbl_Users Where ID = '"+ (Integer)session.getAttribute("uid") +"'");

	String name = "";
	String u_city = "";
	
	String pageName = request.getServletPath();
	
	while(rs.next())
	{
		name = rs.getString(1);
		u_city = rs.getString(2);
	}
	
%>
<header class="fix">
	<div class="logo">Car Rentals</div>
	<div class="hamburger" id="ham">
		<div class="line"></div>
		<div class="line"></div>
		<div class="line"></div>
	</div>
	<div class="nav-bar">
		<ul>
			<li><a href="index.jsp" <% if(pageName.equals("/index.jsp")){ %> class="active" <% } %>><i class="fa-solid fa-house"></i>&ensp;Home</a></li>
			<li><a href="Search.jsp?txtSearchCity=<%= u_city %>" <% if(pageName.equals("/Book_a_car.jsp")){ %> class="active" <% } %>><i class="fa-solid fa-car"></i>&ensp;Book a car</a></li>
			<li><a href="Join_Us.jsp" <% if(pageName.equals("/Join_Us.jsp")){ %> class="active" <% } %>><i class="fa-solid fa-handshake"></i>&ensp;Join us</a></li>
			<li><a href="About_Us.jsp" <% if(pageName.equals("/About_Us.jsp")){ %> class="active" <% } %>><i class="fa-solid fa-circle-info"></i>&ensp;About Us</a></li>
			<li><a href="User_Account.jsp" <% if(pageName.equals("/User_Account.jsp")){ %> class="active" <% } %>><i class="fa-solid fa-user"></i>&ensp;<%=name%></a>
			</li>
		</ul>
	</div>
</header>
<!-- Header Section Ends -->
