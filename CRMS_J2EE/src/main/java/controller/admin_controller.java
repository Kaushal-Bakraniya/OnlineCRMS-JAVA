package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.DB_Connect;
import models.getData;

@WebServlet("/admin_controller")
public class admin_controller extends HttpServlet {
	public admin_controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();

		try {
			if (request.getParameter("btnSubmit_Admin").equals("Log In")) {
				String unm = request.getParameter("txtUnm");
				String pwd = request.getParameter("txtPassword");

				boolean chkData = false;
				int id = 0;
				String access = "";

				String query = "Select * from tbl_admin where UserName = '" + unm + "' and Password = '" + pwd + "'";

				ResultSet rs = getData.select(query);

				while (rs.next()) {
					if (rs.getString(2).equals(unm) && rs.getString(3).equals(pwd)) {
						chkData = true;
						id = rs.getInt(1);
						access = rs.getString(4);
					}
				}

				if (chkData) {
					request.getSession().setAttribute("aid", id);
					request.getSession().setAttribute("access", access);
					out.print("<script>alert('Welcome, Admin')</script>");
					out.print("<script>window.location='CRMS_Admin/index.jsp'</script>");
				} else {
					out.print("<script>alert('Access Denied')</script>");
					out.print("<script>window.location='CRMS_Admin/Login_Admin.jsp'</script>");
				}

			}

			if (request.getParameter("btnSubmit_Admin").equals("Create Account")) {
				if (request.getSession().getAttribute("access") != null) {
					if (request.getSession().getAttribute("access").equals("ALL")) {

						String query = "insert into tbl_admin(UserName,Access,Password) value('"+ request.getParameter("txtUsername") +"','"+ request.getParameter("txtCityAccess") +"','"+ request.getParameter("txtPassword") +"')";
						
						PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
						
						if(st.executeUpdate() > 0)
						{
							out.print("<script>alert('Account Created Successfully')</script>");
							out.print("<script>window.location='CRMS_Admin/Accounts_Manager.jsp'</script>");
						}
						else
						{
							out.print("<script>alert('Account Creation Failed')</script>");
							out.print("<script>window.location='CRMS_Admin/Accounts_Manager.jsp'</script>");
						}
					}
				}
			}
			
			if (request.getParameter("btnSubmit_Admin").equals("Save Details")) {
				if (request.getSession().getAttribute("access") != null) {
					if (request.getSession().getAttribute("access").equals("ALL")) {
						
						int id = Integer.parseInt(request.getSession().getAttribute("u_id").toString());
						
						String query = "update tbl_admin set UserName = '"+ request.getParameter("txtUsername") +"', Password = '"+ request.getParameter("txtPassword") +"', Access = '"+ request.getParameter("txtCityAccess") +"' where ID = '"+ id +"'";
						
						PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
						
						if(st.executeUpdate() > 0)
						{
							request.getSession().removeAttribute("u_id");
							out.print("<script>alert('Details Updated Successfully')</script>");
							out.print("<script>window.location='CRMS_Admin/Accounts_Manager.jsp'</script>");
						}
						else
						{
							request.getSession().removeAttribute("u_id");
							out.print("<script>alert('Operation Failed Please Try Again')</script>");
							out.print("<script>window.location='CRMS_Admin/Accounts_Manager.jsp'</script>");
						}
					}
				}
			}
			
			if (request.getParameter("btnSubmit_Admin").equals("Delete Account")) {
				if (request.getSession().getAttribute("access") != null) {
					if (request.getSession().getAttribute("access").equals("ALL")) {
						
						int id = Integer.parseInt(request.getSession().getAttribute("u_id").toString());
						
						String query = "delete from tbl_admin where ID = '"+ id +"'";
						
						PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
						
						if(st.executeUpdate() > 0)
						{
							request.getSession().removeAttribute("u_id");
							out.print("<script>alert('Account Deleted Successfully')</script>");
							out.print("<script>window.location='CRMS_Admin/Accounts_Manager.jsp'</script>");
						}
						else
						{
							request.getSession().removeAttribute("u_id");
							out.print("<script>alert('Operation Failed Please Try Again')</script>");
							out.print("<script>window.location='CRMS_Admin/Accounts_Manager.jsp'</script>");
						}
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("<script>alert('Server Error : Please Try Again')</script>");
			out.print("<script>window.location='CRMS_Admin/Login_Admin.jsp'</script>");
		}

	}
}
