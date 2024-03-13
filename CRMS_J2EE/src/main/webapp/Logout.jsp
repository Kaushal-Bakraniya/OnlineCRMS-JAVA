
<%
request.getSession().removeAttribute("uid");
response.sendRedirect("Login.jsp");
%>