package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.DB_Connect;
import models.booking_model;
import models.getData;
import models.send_mail;

@WebServlet("/userBookings_controller")
public class userBookings_controller extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public userBookings_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("ID") != null && request.getParameter("OP") != null)
		{
			response.setContentType("text/html");
			
			PrintWriter out  = response.getWriter();
			
			if(request.getParameter("OP").equals("Delete"))
			{
				ResultSet rs = getData.select("select UID,Reg_No from tbl_rented where ID = '"+ request.getParameter("ID") +"'");
				
				String auth = "no";
				String Reg_No = "";
				
				try {
					while(rs.next())
					{
						if(rs.getString(1).equals(request.getSession().getAttribute("uid").toString()))
						{
							auth = "yes";
							Reg_No = rs.getString(2);
						}
					}
					

					ResultSet rs2 = getData.select("select Email from tbl_users where ID = '"+ request.getSession().getAttribute("uid").toString() +"'"); 
					
					String email = "";
					
					while(rs2.next())
					{
						email = rs2.getString(1);
					}
					
					
					if(auth.equals("yes"))
					{
						PreparedStatement st = DB_Connect.createConnection().prepareStatement("update tbl_cars set Status = 'Available' where Reg_No = '"+ Reg_No +"'");
					
						st.executeUpdate();
						
						st = DB_Connect.createConnection().prepareStatement("update tbl_rented set Status = 'Canceled' where ID = '"+ request.getParameter("ID") +"'");
						
						st.executeUpdate();
						
						String subject = "Booking Canceled";
						String text1 = "Your Booking For Car Reg_No : '"+ Reg_No +"' is Canceled.";
						String text2 = "\n\nYour Payment Will Be Refunded Soon.";
						String text3 = "\n\nContact on out toll free no 1234-123-12 for more information.";
	        			String text4 = "\n\nRegards, \nCRMS Team";
	    				String bodyText = text1 + text2 + text3 + text4;
	    				
	    				send_mail mail = new send_mail();
	    				
	    				mail.sendMail(email,subject,bodyText);	
	    				
	    				out.print("<script>alert('Request Marked As Canceled Check out your email for more information.')</script>");
						out.print("<script>window.location='User_Account.jsp'</script>");
					}
					else
					{
						out.print("<script>alert('Access Denied')</script>");
						out.print("<script>window.location='index.jsp'</script>");
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
					out.print("<script>alert('Something Went Wrong Please Contact On Our Toll Free No. : 1234-123-12 For More Infomation.')</script>");
					out.print("<script>window.location='index.jsp'</script>");
				}
			}
			else
			{
				response.sendRedirect("index.aspx");
			}
		}
		else
		{
			response.sendRedirect("index.aspx");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();

		try 
		{
			if(request.getParameter("btnUser_Book").equals("Payment Now"))
			{
				booking_model obj = new booking_model();

				int cid = (Integer)request.getSession().getAttribute("cid");
				int uid = (Integer)request.getSession().getAttribute("uid");
				String pickupDate = request.getParameter("txtPickDate");
				String returnDate = request.getParameter("txtReturnDate");
				String plan = request.getParameter("driver");
				String status = "Requested";
				
				out.println(pickupDate);
				out.println(returnDate);
				
				obj.setCID(cid);
				obj.setUID(uid);
				obj.setStatus(status);
				obj.setPickupDate(pickupDate);
				obj.setReturnDate(returnDate);
				obj.setPlan(plan);
				
				ResultSet rs = getData.select("select Name,Email from tbl_users where ID = "+ uid +"");
				
				String name = "";
				String email = "";
				
				while(rs.next())
				{
					name = rs.getString(1);
					email = rs.getString(2);
				}
				
				if(obj.bookCar())
				{
					String subject = "Request Submitted Successfully";
					String text1 = "Hello, " + name + " We Have Received Your Payment And Your Request Is Submitted Successfully";
					String text2 = "\n\nYour Request Will Be Answered Soon.";
        			String text3 = "\n\nRegards, \nCRMS Team";
    				String bodyText = text1 + text2 + text3;
    				
    				send_mail mail = new send_mail();
    				
    				mail.sendMail(email,subject,bodyText);	
    				
					request.getSession().removeAttribute("cid");
					out.print("<script>alert('Booking Requested Successfully')</script>");
					out.print("<script>window.location='index.jsp'</script>");
				}
				else
				{
					out.print("<script>alert('Something Went Wrong, Please Check The Details & Try Again')</script>");
					out.print("<script>window.location='BookCar_Form.jsp?ID="+ cid +"</script>");
				}
			}
			
			if(request.getParameter("btnUser_Book").equals("Approve Booking"))
			{
				int b_id = (Integer)request.getSession().getAttribute("booking_id");
				String c_id = (String)request.getSession().getAttribute("b_car_reg");
				
				System.out.println(b_id);
				System.out.println(c_id);
				
				String d_id = "0";
				
				if(request.getParameter("txtDriverID") != null)
				{
					d_id = request.getParameter("txtDriverID");
				}
				
				String query1 = "update tbl_rented set Status = 'Approved',Days='"+ request.getParameter("txtDays") +"',Pickup_Date='"+ request.getParameter("txtPickupDate") +"',Return_Date = '"+ request.getParameter("txtReturnDate") +"',Contact = '"+ request.getParameter("txtContact") +"',"
						+ "Address = '"+ request.getParameter("txtAddress") +"',Payment = '"+ request.getParameter("txtPayment") +"',Note = '"+ request.getParameter("txtNote") +"',Driver_ID = '"+ d_id +"',KMS_Driven = '"+ request.getParameter("txtKMS") +"' where ID = '"+ b_id  +"'";
				
				PreparedStatement st1 = DB_Connect.createConnection().prepareStatement(query1);
				
				if(st1.executeUpdate() > 0)
				{
					String query2 = "update tbl_cars set Status = 'Approved',KMS_Driven = '"+ request.getParameter("txtKMS") +"' where Reg_No = '"+ c_id  +"'";
					
					System.out.print(query2);
					
					PreparedStatement st2 = DB_Connect.createConnection().prepareStatement(query2);
					
					ResultSet rs = getData.select("select Name,Email from tbl_users where ID = "+ request.getParameter("txtID") +"");
					
					String name = "";
					String email = "";
					
					while(rs.next())
					{
						name = rs.getString(1);
						email = rs.getString(2);
					}
					
					if(st2.executeUpdate() > 0)
					{
						String subject = "Request Approved";
						String text0 = "Hello, " + name;
						String text1 = "\n\nYour Request For Car Reg No. : " + request.getParameter("txtRegNo") + " Is Approved.";
						String text2 = "\n\nPickup Date : " + request.getParameter("txtPickupDate");
						String text3 = "\n\nReturn Date : " + request.getParameter("txtReturnDate");
						String text4 = "\n\nNote : " + request.getParameter("txtNote");
						String text5 = "\n\nPayment Received Is " + request.getParameter("txtPayment") + " INR";
	        			String text6 = "\n\nRegards, \nCRMS Team";
	    				String bodyText = text0 + text1 + text2 + text3 + text4 + text5 + text6;
	    				
	    				send_mail mail = new send_mail();
	    				
	    				mail.sendMail(email,subject,bodyText);	
	    			
						request.getSession().removeAttribute("booking_id");
						request.getSession().removeAttribute("b_car_reg");
						out.print("<script>alert('Booking Approved Successfully')</script>");
						out.print("<script>window.location='CRMS_Admin/index.jsp'</script>");
					}
					else
					{
						request.getSession().removeAttribute("booking_id");
						request.getSession().removeAttribute("b_car_reg");
						out.print("<script>alert('Booking Appprove Failed')</script>");
						out.print("<script>window.location='CRMS_Admin/index.jsp'</script>");
					}
				}
				else
				{
					request.getSession().removeAttribute("booking_id");
					request.getSession().removeAttribute("b_car_reg");
					out.print("<script>alert('Booking Appprove Failed')</script>");
					out.print("<script>window.location='CRMS_Admin/index.jsp'</script>");
				}
			}
			
			
			if(request.getParameter("btnUser_Book").equals("Decline Request"))
			{
				int b_id = (Integer)request.getSession().getAttribute("booking_id");
				String c_id = (String)request.getSession().getAttribute("b_car_reg");
				
				String query = "Update tbl_cars set Status = 'Available' Where Reg_No = '"+ c_id +"'";
				
				PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
				
				st.executeUpdate();
				
				query = "delete from tbl_rented where ID = "+ b_id +"";
				
				st = DB_Connect.createConnection().prepareStatement(query);
				
				ResultSet rs = getData.select("select Name,Email from tbl_users where ID = "+ request.getParameter("txtID") +"");
				
				String name = "";
				String email = "";
				
				while(rs.next())
				{
					name = rs.getString(1);
					email = rs.getString(2);
				}
				
				if(st.executeUpdate() > 0)
				{	
					String subject = "Request Declined";
					String text0 = "Hello, " + name;
					String text1 = "\n\nWe Are Sorry But Your Request For Car Reg No. : " + request.getParameter("txtRegNo") + " Is Declined.";
					String text2 = "\n\nYour Payment of INR " + request.getParameter("txtPayment") + " Will Be Refunded Soon.";
        			String text6 = "\n\nRegards, \nCRMS Team";
    				String bodyText = text0 + text1 + text2 + text6;
    				
    				send_mail mail = new send_mail();
    				
    				mail.sendMail(email,subject,bodyText);	
    			
					request.getSession().removeAttribute("booking_id");
					request.getSession().removeAttribute("b_car_reg");
					out.print("<script>alert('Request Declined Successfully')</script>");
					out.print("<script>window.location='CRMS_Admin/Booking_Requests.jsp'</script>");
				}
				else
				{
					out.print("<script>alert('Record decline falied.')</script>");
					out.print("<script>window.location='CRMS_Admin/Booking_Requests.jsp'</script>");
				}
			}
			
			if(request.getParameter("btnUser_Book").equals("Final Approval"))
			{
				int b_id = (Integer)request.getSession().getAttribute("booking_id");
				String c_id = (String)request.getSession().getAttribute("b_car_reg");
				
				String status = (String) request.getSession().getAttribute("status");
				
				if(status.equals("Approved"))
				{
					String d_id = "0";
					
					if(request.getParameter("txtDriverID") != null)
					{
						d_id = request.getParameter("txtDriverID");
					}
					
					String query1 = "update tbl_rented set Status = 'Rented',Days='"+ request.getParameter("txtDays") +"',Pickup_Date='"+ request.getParameter("txtPickupDate") +"',Return_Date = '"+ request.getParameter("txtReturnDate") +"',Contact = '"+ request.getParameter("txtContact") +"',"
							+ "Address = '"+ request.getParameter("txtAddress") +"',Payment = '"+ request.getParameter("txtPayment") +"',Note = '"+ request.getParameter("txtNote") +"',Driver_ID = '"+ d_id +"',KMS_Driven = '"+ request.getParameter("txtKMS") +"' where ID = '"+ b_id  +"'";
					
					PreparedStatement st1 = DB_Connect.createConnection().prepareStatement(query1);
					

					ResultSet rs = getData.select("select Name,Email from tbl_users where ID = "+ request.getParameter("txtID") +"");
					
					String name = "";
					String email = "";
					
					while(rs.next())
					{
						name = rs.getString(1);
						email = rs.getString(2);
					}
					
					if(st1.executeUpdate() > 0)
					{
						String query2 = "update tbl_cars set Status = 'Rented',KMS_Driven = '"+ request.getParameter("txtKMS") +"' where Reg_No = '"+ c_id  +"'";
						
						PreparedStatement st2 = DB_Connect.createConnection().prepareStatement(query2);
						
						if(st2.executeUpdate() > 0)
						{
							query1 = "update tbl_driver set Status = 'On Trip', Current_Trip = '"+ b_id +"' where ID = '"+ request.getParameter("txtDriverID") +"'";
							
							st1 = DB_Connect.createConnection().prepareStatement(query1);
							
							if(st1.executeUpdate() > 0)
							{
								ResultSet rsd = getData.select("select Email,Full_Name from tbl_driver where ID = '"+ request.getParameter("txtDriverID") +"'");
								
								String mail = "";
								String Full_Name = "";
								
								while(rsd.next())
								{
									mail = rsd.getString(1);
									Full_Name = rsd.getString(2);
								}
								
								send_mail sm = new send_mail();
								
								String text1 = "Hello,\n";
								String text2 = ""+ Full_Name+" you have got a trip for '"+ request.getParameter("txtDays") +"' day.";
								String text3 = "\n\nPickup Date : '"+ request.getParameter("txtPickupDate") +"'";
								String text4 = "\n\nReturn Date : '"+ request.getParameter("txtReturnDate") +"'";
								String text5 = "\n\nFor More Info contact to office manager.";
								String text6 = "\n\nRegards,\nCRMS Team";
								
								String textMail = text1 + text2 + text3 + text4 + text5 + text6;
								
								sm.sendMail(mail, "New Trip allocated on "+ request.getParameter("txtPickupDate") +"", textMail);
								
								out.print("<script>alert('Driver Allocated Successfully')</script>");
							}
							
							String subject = "Car Rented : " + request.getParameter("txtRegNo");
							String text0 = "Hello, " + name;
							String text1 = "\n\nYour Requested Car Reg No. : " + request.getParameter("txtRegNo") + " Is Now Rented To You.";
							String text2 = "\n\nPickup Date : " + request.getParameter("txtPickupDate");
							String text3 = "\n\nReturn Date : " + request.getParameter("txtReturnDate");
							String text4 = "\n\nNote : " + request.getParameter("txtNote");
							String text5 = "\n\nPayment Received Is " + request.getParameter("txtPayment") + " INR";
							String text6 = "\n\nEnjoy Your Journey";
		        			String text7 = "\n\nRegards, \nCRMS Team";
		    				String bodyText = text0 + text1 + text2 + text3 + text4 + text5 + text6 + text7;
		    				
		    				send_mail mail = new send_mail();
		    				
		    				mail.sendMail(email,subject,bodyText);	
		    			
							request.getSession().removeAttribute("booking_id");
							request.getSession().removeAttribute("b_car_reg");
							request.getSession().removeAttribute("status");
							out.print("<script>alert('Booking Approved Successfully')</script>");
							out.print("<script>window.location='CRMS_Admin/index.jsp'</script>");
						}
						else
						{
							request.getSession().removeAttribute("booking_id");
							request.getSession().removeAttribute("b_car_reg");
							request.getSession().removeAttribute("status");
							out.print("<script>alert('Booking Appprove Failed')</script>");
							out.print("<script>window.location='CRMS_Admin/index.jsp'</script>");
						}
					}
					else
					{
						request.getSession().removeAttribute("booking_id");
						request.getSession().removeAttribute("b_car_reg");
						request.getSession().removeAttribute("status");
						out.print("<script>alert('Booking Appprove Failed')</script>");
						out.print("<script>window.location='CRMS_Admin/index.jsp'</script>");
					}
				}
				else
				{
					request.getSession().removeAttribute("booking_id");
					request.getSession().removeAttribute("b_car_reg");
					request.getSession().removeAttribute("status");
					out.print("<script>alert('Invalid Operation')</script>");
					out.print("<script>window.location='CRMS_Admin/index.jsp'</script>");
				}
			}
			
			if(request.getParameter("btnUser_Book").equals("Mark As Available"))
			{
				int b_id = (Integer)request.getSession().getAttribute("booking_id");
				String c_id = (String)request.getSession().getAttribute("b_car_reg");
				
				String query = "insert into tbl_oldbookings(UID,Reg_No,Contact,Pickup_Date,Return_Date,Days,Days_Late,City,Basic_Rent,Other_Fine,Extra_Charge,Final_Payment,Note)"
						+ "values('"+ request.getParameter("user_id") +"','"+ request.getParameter("txtRegNo") +"','"+ request.getParameter("user_contact") +"','"+ request.getParameter("txtPickUpDate") +"','"+ request.getParameter("txtReturnDate") +"',"
								+ "'"+ request.getParameter("txtDays") +"','"+ request.getParameter("txtLateDays") +"','"+ request.getParameter("txtCity")+"','"+ request.getParameter("txtBasicRent") +"','"+ request.getParameter("txtOtherFines") +"',"
										+ "'"+ request.getParameter("txtExtraCharge") +"','"+ request.getParameter("txtFinalPayment") +"','"+ request.getParameter("txtNote") +"')";
				
				out.print(query);
				
				PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
				
				if(st.executeUpdate() > 0)
				{
					query = "delete from tbl_rented where ID = '"+ b_id +"'";
					
					PreparedStatement st1 = DB_Connect.createConnection().prepareStatement(query);
					
					st1.executeUpdate();
					
					query = "Update tbl_cars set Status = 'Available', KMS_Driven = '"+ request.getParameter("txtKMS") +"' Where Reg_No = '"+ request.getParameter("txtRegNo") +"'";
					
					System.out.println(query);
					
					PreparedStatement st2 = DB_Connect.createConnection().prepareStatement(query);
					
					st2.executeUpdate();

					String query3 = "update tbl_driver set Status='AVAILABLE',Current_Trip='0' where ID = '"+ request.getParameter("txtDriverID") +"'";
					
					PreparedStatement st3 = DB_Connect.createConnection().prepareStatement(query3);
					
					if(st3.executeUpdate() > 0)
					{
						out.println("<script>alert('Driver Deallocated Successfully')</script>");
					}
					
					ResultSet rs = getData.select("select Name,Email from tbl_users where ID = "+ request.getParameter("user_id") +"");
					
					String name = "";
					String email = "";
					
					while(rs.next())
					{
						name = rs.getString(1);
						email = rs.getString(2);
					}
					
					if(st2.executeUpdate() > 0)
					{
						String subject = "Car Renturned : " + request.getParameter("txtRegNo");
						String text0 = "Hello, " + name;
						String text1 = "\n\nCar Reg No. : " + request.getParameter("txtRegNo") + " Is Returned Successfully.";
						String text2 = "\n\nWe Hope Your Journey Was Amazing, Thanks For Choosing Us.";
						String text3 = "\n\nRegards, \nCRMS Team";
	    				String bodyText = text0 + text1 + text2 + text3;
	    				
	    				send_mail mail = new send_mail();
	    				
	    				mail.sendMail(email,subject,bodyText);	
	    			
						request.getSession().removeAttribute("booking_id");
						request.getSession().removeAttribute("b_car_reg");
						request.getSession().removeAttribute("status");
						out.println("<script>alert('Car Returned Successfully')</script>");
						out.println("<script>window.location='CRMS_Admin/index.jsp'</script>");
					}
				}
				else
				{
					request.getSession().removeAttribute("booking_id");
					request.getSession().removeAttribute("b_car_reg");
					request.getSession().removeAttribute("status");
					
					out.println("<script>alert('Something Went Wrong')</script>");
					out.println("<script>window.location='CRMS_Admin/index.jsp'</script>");	
				}	
			}
			
			if(request.getParameter("btnUser_Book").equals("Edit Record"))
			{
				String query = "update tbl_oldbookings Set Reg_No = '"+ request.getParameter("txtRegNo") +"',Contact = '"+ request.getParameter("user_contact") +"',Pickup_Date = '"+ request.getParameter("txtPickUpDate") +"',"
						+ "Return_Date = '"+ request.getParameter("txtReturnDate") +"',Days = '"+ request.getParameter("txtDays") +"',Days_Late = '"+ request.getParameter("txtLateDays") +"',Basic_Rent = '"+ request.getParameter("txtBasicRent") +"',"
								+ "Other_Fine = '"+ request.getParameter("txtOtherFines") +"',Extra_Charge = '"+ request.getParameter("txtExtraCharge") +"',Final_Payment = '"+ request.getParameter("txtFinalPayment") +"',Note = '"+ request.getParameter("txtNote") +"'"
										+ "Where ID = '"+ (Integer)request.getSession().getAttribute("record_id") +"'";
				
				PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
				
				if(st.executeUpdate() > 0)
				{
					request.getSession().removeAttribute("record_id");
					out.print("<script>alert('Record Updated Successfully')</script>");
					out.print("<script>window.location='CRMS_Admin/Booking_History.jsp'</script>");
				}
				else
				{
					request.getSession().removeAttribute("record_id");
					out.print("<script>alert('Something Went Wrong')</script>");
					out.print("<script>window.location='CRMS_Admin/Booking_History.jsp'</script>");
				}
			}
			
			if(request.getParameter("btnUser_Book").equals("Delete Record"))
			{
				String query = "delete from tbl_oldbookings where ID = '"+ (Integer)request.getSession().getAttribute("record_id") +"'";
				
				PreparedStatement st = DB_Connect.createConnection().prepareStatement(query);
				
				if(st.executeUpdate() > 0)
				{
					request.getSession().removeAttribute("record_id");
					out.print("<script>alert('Record Deleted Successfully')</script>");
					out.print("<script>window.location='CRMS_Admin/Booking_History.jsp'</script>");
				}
				else
				{
					request.getSession().removeAttribute("record_id");
					out.print("<script>alert('Record Deletion Failed')</script>");
					out.print("<script>window.location='CRMS_Admin/Booking_History.jsp'</script>");
				}
			}
		}
		catch (Exception e) 
		{
			out.print(e);
			e.printStackTrace();
		}
	}

}
