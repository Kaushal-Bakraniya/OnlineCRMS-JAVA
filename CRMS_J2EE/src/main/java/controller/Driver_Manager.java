package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.jdbc.PreparedStatement;

import connect.DB_Connect;
import models.send_mail;

@WebServlet("/Driver_Manager")
@MultipartConfig
public class Driver_Manager extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public Driver_Manager() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		try
		{
			String btn = "";
			
			btn = request.getParameter("btnDriver");
			
			if(btn.equals("Apply For This Job"))
			{
				
				
				String FullName = request.getParameter("txtFullName");
				String Gender = request.getParameter("txtGen");
				String Email = request.getParameter("txtEmail");
				String Contact = request.getParameter("txtContactNo");
				String Address = request.getParameter("txtAddress");
				String City = request.getParameter("txtCity");
				int Experience = Integer.parseInt(request.getParameter("txtExperience"));
				String AadharCard = request.getParameter("txtAadharCar");
				String DrivingLicense = request.getParameter("txtDrivingLicense");
				String DOB = request.getParameter("txtDOB");
				
				
				LocalDate dDate = LocalDate.parse(DOB);
				LocalDate curDate = LocalDate.now();
				
				if((dDate != null) && (curDate != null))
				{
					int year = Period.between(dDate, curDate).getYears();
					
					System.out.println("Years : " + year);
					
					if(year >= 18)
					{
						
					}
					else
					{
						out.println("<script>alert('Age Must Be Greater Than 18')</script>");
						out.println("<script>window.location='JoinUs_Driver.jsp'</script>");	
					}
					
				}
				
				//Upload Image
				String fileUploadPath = "D:/J2EE/6BCA_CRMS/CRMS_J2EE/src/main/webapp/Images/Uploads/Drivers_Documents/";
				
				Part img1 = request.getPart("txtAadharCard");
				Part img2 = request.getPart("txtDrivingLicense");
		
				int u_id = (Integer)request.getSession().getAttribute("uid");
				
				AadharCard = "Images/Uploads/Drivers_Documents/" + Email + "_" + u_id + "_1_AadharCard_" + img1.getSubmittedFileName();
				DrivingLicense = "Images/Uploads/Drivers_Documents/" + Email + "_" + u_id + "_2_DrivingLicense_" + img2.getSubmittedFileName();
				
				FileOutputStream fos1 = new FileOutputStream(fileUploadPath + Email + "_" + u_id  + "_1_AadharCard_" + img1.getSubmittedFileName());
				FileOutputStream fos2 = new FileOutputStream(fileUploadPath + Email + "_" + u_id  + "_2_DrivingLicense_" + img2.getSubmittedFileName());
				
				InputStream ips1 = img1.getInputStream();
				InputStream ips2 = img2.getInputStream();
				
				byte[] data1 = new byte[ips1.available()];
				byte[] data2 = new byte[ips2.available()];
				
				ips1.read(data1);
				ips2.read(data2);
				
				fos1.write(data1);
				fos2.write(data2);
				
				fos1.close();
				fos2.close();
				
				ips1.close();
				ips2.close();
				
				String query = "insert into tbl_driver(Full_Name,Gender,Email,Contact_No,Address,City,Experience_Years,Aadhar_Card,Driving_License,DOB,Status,Salary,Current_Trip)"
						+ "values('"+ FullName +"','"+ Gender +"','"+ Email +"','"+ Contact +"','"+ Address +"','"+ City +"','"+ Experience +"','"+ AadharCard +"','"+ DrivingLicense +"','"+ DOB +"','REQUESTED',0,0)";
				
				java.sql.PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
				
				if(st.executeUpdate() > 0)
				{
					send_mail sm = new send_mail();
					
					String text1 = "Hello,\n"+FullName+" your application for the job of driver at car rentals "+ City +" is submitted successfully.";
					String text2 = "\n\nOur team will contact you soon.";
					String text3 = "\n\nRegards,\nCRMS Team";
					
					String mail = text1 + text2 + text3;
					
					sm.sendMail(Email, "Application Submitted Successfully", mail);
					out.println("<script>alert('Thanks For Applying, Our Team Will Contact You Soon')</script>");
					out.println("<script>window.location='Join_Us.jsp'</script>");
				}
				else
				{
					out.println("<script>alert('Something Went Wrong Please Try Again')</script>");
					out.println("<script>window.location='Join_Us.jsp'</script>");	
				}
			}
			
			if(btn.equals("Approve Request") || btn.equals("Save Details"))
			{
				int d_id = (Integer)request.getSession().getAttribute("did");
				
				String FullName = request.getParameter("txtFullName");
				String Gender = request.getParameter("txtGen");
				String Email = request.getParameter("txtEmail");
				String Contact = request.getParameter("txtContactNo");
				String Address = request.getParameter("txtAddress");
				String City = request.getParameter("txtCity");
				int Experience = Integer.parseInt(request.getParameter("txtExperience"));
				//String AadharCard = request.getParameter("txtAadharCar");
				//String DrivingLicense = request.getParameter("txtDrivingLicense");
				String DOB = request.getParameter("txtDOB");
				String JoinDate = request.getParameter("txtJoinDate");
				int Salary = Integer.parseInt(request.getParameter("txtSalary"));
				String Status = request.getParameter("txtStatus");
				
				String query = "update tbl_driver set Full_Name = '"+ FullName +"',Gender = '"+ Gender +"',Email = '"+ Email +"',Contact_No = '"+ Contact +"',Address = '"+ Address +"',City = '"+ City +"',Experience_Years = '"+ Experience +"',DOB = '"+ DOB +"',Join_Date = '"+ JoinDate +"',Status = '"+ Status +"',Salary = '"+ Salary +"' where ID = '"+ d_id +"'";
				
				java.sql.PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
				
				if(st.executeUpdate() > 0)
				{
					send_mail sm = new send_mail();
					
					String text1 = "Congratulations,\n"+ FullName +" your application for the job is approved by our team and you have to join from "+  JoinDate  +".";
					String text2 = "\n\nWelcome to Car Rentals Team..";
					String text3 = "\n\nRegards,\nCRMS Team";
					
					String mail = text1 + text2 + text3;
					
					sm.sendMail(Email, "Congratulations", mail);
					
					out.println("<script>alert('Record Updated Successfully')</script>");
					out.println("<script>window.location='CRMS_Admin/Drivers_Manage.jsp'</script>");
				}
				else
				{
					out.println("<script>alert('Something Went Wrong Please Try Again')</script>");
					out.println("<script>window.location='CRMS_Admin/Drivers_Manage.jsp'</script>");	
				}
			}
			
			if(btn.equals("Decline Request") || btn.equals("Delete Profile"))
			{
				int d_id = (Integer)request.getSession().getAttribute("did");
				
				String query = "delete from tbl_driver where ID = '"+ d_id +"'";
				
				java.sql.PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
				
				if(st.executeUpdate() > 0)
				{
					request.getSession().removeAttribute("did");
					out.print("<script>alert('Record Deleted Successfully')</script>");
					out.print("<script>window.location='CRMS_Admin/Drivers_Manage.jsp'</script>");
				}
				else
				{
					request.getSession().removeAttribute("did");
					out.print("<script>alert('Record Deletion Failed Please Try Again')</script>");
					out.print("<script>window.location='CRMS_Admin/Drivers_Manage.jsp'</script>");	
				}
			}
		}
		catch(Exception e)
		{
			out.println("<h1>"+ e +"</h1>");
		}
	}
}
