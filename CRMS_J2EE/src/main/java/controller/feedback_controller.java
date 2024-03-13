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
import models.send_mail;

@WebServlet("/feedback_controller")
public class feedback_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public feedback_controller() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	response.setContentType("text/html");
    	
    	PrintWriter out = response.getWriter();
    	
    	try
    	{
    		if(request.getParameter("btnFeedback").equals("Send Feedback"))
    		{
    			String Username = "";
    			String Email = "";
    			
    			ResultSet rs = getData.select("select Name,Email from tbl_users where ID = '"+ (Integer)request.getSession().getAttribute("uid") +"'");
    			
    			while(rs.next())
    			{
    				Username = rs.getString(1);
    				Email = rs.getString(2);
    			}
    			
    			String query = "insert into tbl_feedback(Username,UID,User_Email,Feedback,Status) values('"+ Username +"','"+ (Integer)request.getSession().getAttribute("uid") +"','"+ Email +"',"
    					+ "'"+ request.getParameter("txtFeedback") +"','Not Readed')";
    			
    			PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
    			
    			if(st.executeUpdate() > 0)
    			{
    				out.print("<script>alert('Feedback Sended Successfully')</script>");
    				out.print("<script>window.location='User_Account.jsp'</script>");
    			}
    			else
    			{
    				out.print("<script>alert('Something Went Wrong')</script>");
    				out.print("<script>window.location='User_Account.jsp'</script>");
    			}
    		}
    		
    		if(request.getParameter("btnFeedback").equals("Mark As Reviewed"))
    		{
    			String query = "update tbl_feedback set Status = 'Reviewed' Where ID = '"+ request.getParameter("txtID") +"'";
    			
    			PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
    			
    			if(st.executeUpdate() > 0)
    			{
    				out.println("<script>alert('Feedback Reviewed Successfully')</script>");
    				out.println("<script>window.location='CRMS_Admin/Feedbacks_Manager.jsp'</script>");
    			}
    			else
    			{
    				out.println("<script>alert('Feedback Reviewed Failed')</script>");
    				out.println("<script>window.location='CRMS_Admin/Feedbacks_Manager.jsp'</script>");
    			}
    		}
    		
    		if(request.getParameter("btnFeedback").equals("Reply to Feedback"))
    		{
    			try
    			{
        			String subject = "In Reply To Feedback.";
        			String text1 = request.getParameter("txtFeedback");
        			String text2 = "\n\nRegards, \nCRMS Team";
    				String bodyText = text1 + text2;
    				
    				send_mail mail = new send_mail();
    				
    				mail.sendMail(request.getParameter("txtEmail"),subject,bodyText);	
    				
    				String query = "update tbl_feedback set Status = 'Replied' Where ID = '"+ request.getParameter("txtID") +"'";
        			
        			PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
        			
        			if(st.executeUpdate() > 0)
        			{
        				out.println("<script>alert('Replied To Feedback Successfully')</script>");
        				out.println("<script>window.location='CRMS_Admin/Feedbacks_Manager.jsp'</script>");		
        			}
        			else
        			{
        				out.println("<script>alert('Soemthing Went Wrong Please Try Again')</script>");
        				out.println("<script>window.location='CRMS_Admin/Feedbacks_Manager.jsp'</script>");			
        			}
    				
    			}
    			catch(Exception x)
    			{
    				out.println("<script>alert('Soemthing Went Wrong Please Try Again')</script>");
    				out.println("<script>window.location='CRMS_Admin/Feedbacks_Manager.jsp'</script>");
    			}
    			
				
    		}
    		
    		if(request.getParameter("btnFeedback").equals("Delete Feedback"))
    		{
    			String query = "delete from tbl_feedback Where ID = '"+ request.getParameter("txtID") +"'";
    			
    			PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
    			
    			if(st.executeUpdate() > 0)
    			{
    				out.println("<script>alert('Feedback Deleted Successfully')</script>");
    				out.println("<script>window.location='CRMS_Admin/Feedbacks_Manager.jsp'</script>");
    			}
    			else
    			{
    				out.println("<script>alert('Feedback Deletion Failed')</script>");
    				out.println("<script>window.location='CRMS_Admin/Feedbacks_Manager.jsp'</script>");
    			}
    		}
    		
    	}
    	catch(Exception e)
    	{
    		out.println(e);
    	}
	}
    
    
}
