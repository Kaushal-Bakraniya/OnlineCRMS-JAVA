package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import models.user_model;

@WebServlet("/userController_Admin")
@MultipartConfig
public class userController_Admin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public userController_Admin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		try 
		{
			//Registration Operation
			if (request.getParameter("btnSubmitAdmin_User").equals("Add New User")) 
			{
				if (!request.getParameter("txtPassword").equals(request.getParameter("txtConfPassword"))) 
				{
					out.print("<script>alert('Passwords Doesnt Match')</script>");
					out.print("<script>window.location='SignUp.jsp'</script>");
				} 
				else 
				{
					user_model objUser = new user_model();

					Part file = request.getPart("fileProfilePic");
					
					objUser.setName(request.getParameter("txtName"));
					objUser.setEmail(request.getParameter("txtEmail"));
					objUser.setContact(request.getParameter("txtContact"));
					objUser.setGender(request.getParameter("gender"));
					objUser.setAddress(request.getParameter("txtAddress"));
					objUser.setCity(request.getParameter("city"));
					objUser.setPassword(request.getParameter("txtPassword"));
					objUser.setProfilePicture("Images/Uploads/ProfilePictures/" + file.getSubmittedFileName());
					
					//Upload File Path
					
					String fileUploadPath = "D:/J2EE/6BCA_CRMS/CRMS_J2EE/src/main/webapp/Images/Uploads/ProfilePictures/";
					
					FileOutputStream fos = new FileOutputStream(fileUploadPath + file.getSubmittedFileName());
					
					InputStream ips = file.getInputStream();
					
					byte[] data = new byte[ips.available()];
					
					ips.read(data);
					
					fos.write(data);
					
					ips.close();
					
					fos.close();
					
					if (objUser.createUser()) {
						out.print("<script>alert('Account Created Successfully Please Login')</script>");
						out.print("<script>window.location='CRMS_Admin/Users_View.jsp'</script>");
					} else {
						out.print("<script>alert('Something Went Wrong, Please Try Again')</script>");
						out.print("<script>window.location='CRMS_Admin/Users_Add.jsp'</script>");
					}
				}
			}
			
			//Update Operation
			if (request.getParameter("btnSubmitAdmin_User").equals("Save Details")) 
			{
				user_model objUser = new user_model();
				
				objUser.setName(request.getParameter("txtName"));
				objUser.setEmail(request.getParameter("txtEmail"));
				objUser.setContact(request.getParameter("txtContact"));
				objUser.setGender(request.getParameter("gender"));
				objUser.setAddress(request.getParameter("txtAddress"));
				objUser.setCity(request.getParameter("city"));
				objUser.setPassword(request.getParameter("txtPassword"));

				int id = (Integer)request.getSession().getAttribute("ueid");
				
				if (objUser.updateUser(id)) 
				{
					request.getSession().removeAttribute("ueid");
					out.print("<script>alert('Details Updated Successfully')</script>");
					out.print("<script>window.location='CRMS_Admin/Users_Update.jsp'</script>");
				} 
				else 
				{
					out.print("<script>alert('Something Went Wrong, Please Check The Details & Try Again')</script>");
					out.print("<script>window.location='CRMS_Admin/Users_EditForm.jsp?ID="+ id +"&OP=edit'</script>");
				}
			}
			
			// Delete Operation
			if(request.getParameter("btnSubmitAdmin_User").equals("Permenantly Delete Account"))
			{
				user_model objUser = new user_model();

				int id = (Integer)request.getSession().getAttribute("ueid");
				
				if (objUser.deleteUser(id)) 
				{
					request.getSession().removeAttribute("ueid");
					out.print("<script>alert('Account Deleted Successfully')</script>");
					out.print("<script>window.location='CRMS_Admin/Users_Update.jsp'</script>");
				} 
				else 
				{
					out.print("<script>alert('Error : Something Went Wrong')</script>");
					out.print("<script>window.location='CRMS_Admin/Users_DeleteForm.jsp?ID="+ id +"&OP=delete'</script>");
				}
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			out.print("<script>alert('Something Went Wrong, Please Try Again')</script>");
			out.print("<script>window.history.go(-1)</script>");
		}	
	}
}
