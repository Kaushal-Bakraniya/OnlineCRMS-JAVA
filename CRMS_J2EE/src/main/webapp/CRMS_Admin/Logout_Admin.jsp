
<%
request.getSession().removeAttribute("aid");
response.sendRedirect("Login_Admin.jsp");
%>