package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.DB_Connect;
import models.getData;
import models.send_mail;

@WebServlet("/recovery_controller")
public class recovery_controller extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public recovery_controller() 
	{
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		try
		{
			if(request.getParameter("btnVerify").equals("Verify Email"))
			{
				String query = "select ID from tbl_users where Email = '"+ request.getParameter("txtEmail") +"'";
				
				ResultSet rs = getData.select(query);
				
				int id = 0;
				
				while(rs.next())
				{
					id = Integer.parseInt(rs.getString(1));
				}	
				
				if(id != 0)
				{
					request.getSession().setAttribute("userid", id);
					
					send_mail mail = new send_mail();
					
					String subject = "Account Recovery";
					
					int min = 100000;
					int max = 999999;
					int otp = (int)Math.floor(Math.random() * (max - min) + min);
					
					String txt1 = "You Account Recovery OTP Is " + otp + ".";
					String txt2 = "\n\nRegards,\nCRMS Team";
					String bodyText = txt1 + txt2;
					
					request.getSession().setAttribute("otp", otp);
					
					mail.sendMail(request.getParameter("txtEmail"), subject, bodyText);
					
					response.sendRedirect("Account_VerifyOTP.jsp");
				}
				else
				{
					out.print("<script>alert('No Registered Email Found.')</script>");
					out.print("<script>window.location='Login.jsp'</script>");
				}
			}
			
			if(request.getParameter("btnVerify").equals("Verify OTP"))
			{
				int id = (Integer)request.getSession().getAttribute("userid");
				int otp = (Integer)request.getSession().getAttribute("otp");
				
				int user_input = Integer.parseInt(request.getParameter("txtOTP"));
				
				if(user_input == otp)
				{
					request.getSession().removeAttribute("otp");
					
					out.print("<script>alert('OTP Verified Successfully')</script>");
					out.print("<script>window.location='Account_ChangePassword.jsp'</script>");
				}
				else
				{
					request.getSession().removeAttribute("userid");
					request.getSession().removeAttribute("otp");
					
					out.print("<script>alert('OTP Doesnt Match Please Try Again')</script>");
					out.print("<script>window.location='Account_VerifyEmail.jsp'</script>");
				}
			}
			
			if(request.getParameter("btnVerify").equals("Setup Password"))
			{
				if(request.getParameter("txtPwd").equals(request.getParameter("txtConfPwd")))
				{
					int id = (Integer)request.getSession().getAttribute("userid");
					
					String query = "update tbl_users set Password = '"+ request.getParameter("txtPwd") +"' where ID = '"+ id +"'";
					
					PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
					
					if(st.executeUpdate() > 0)
					{
						request.getSession().removeAttribute("userid");
						request.getSession().removeAttribute("otp");
						
						out.print("<script>alert('Password Setuped Successfully')</script>");
						out.print("<script>window.location='Login.jsp'</script>");
					}
					else
					{
						out.print("<script>alert('Password Setup Failed Please Try Again')</script>");
						out.print("<script>window.location='Account_ChangePassword.jsp'</script>");
					}
				}
				else
				{
					out.print("<script>alert('Passwords Doesnt Matches')</script>");
					out.print("<script>window.location='Account_ChangePassword.jsp'</script>");
				}
			}
		}
		catch(Exception e)
		{
			request.getSession().removeAttribute("userid");
			request.getSession().removeAttribute("otp");
			out.println(e);
			out.print("<script>alert('Something Went Wrong Please Try Again')</script>");
			out.print("<script>window.location='Login.jsp'</script>");
		}
	}
}
