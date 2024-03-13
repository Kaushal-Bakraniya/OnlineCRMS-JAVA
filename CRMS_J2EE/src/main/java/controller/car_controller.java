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

import models.car_model;
import models.user_model;

@WebServlet("/car_controller")
@MultipartConfig
public class car_controller extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public car_controller() {
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
			//Add Car Operation
			if (request.getParameter("btnSubmit_Car").equals("Add A Car")) 
			{
				car_model car = new car_model();
				
				car.setRegNo(request.getParameter("txtRegNo"));
				car.setModel_Name(request.getParameter("txtModelName"));
				car.setCity(request.getParameter("city"));
				car.setFuel_Type(request.getParameter("txtFuelType"));
				car.setAirbags(Integer.parseInt(request.getParameter("txtAirbags")));
				car.setSeatingCapacity(Integer.parseInt(request.getParameter("txtSeatingCapacity")));
				car.setRentPerDay(Integer.parseInt(request.getParameter("txtRentPerDay")));
				car.setRentPerKM(Integer.parseInt(request.getParameter("txtRentPerKM")));
				car.setLimitPerDay(Integer.parseInt(request.getParameter("txtLimitPerDay")));
				
				//Upload Image
				String fileUploadPath = "D:/J2EE/6BCA_CRMS/CRMS_J2EE/src/main/webapp/Images/Uploads/Car_Images/";
				
				Part img1 = request.getPart("Img1");
				Part img2 = request.getPart("Img2");
		
				car.setImage_1("Images/Uploads/Car_Images/" + request.getParameter("txtRegNo") + "_1_" + img1.getSubmittedFileName());
				car.setImage_2("Images/Uploads/Car_Images/" + request.getParameter("txtRegNo") + "_2_" + img2.getSubmittedFileName());
				
				FileOutputStream fos1 = new FileOutputStream(fileUploadPath + request.getParameter("txtRegNo") + "_1_" + img1.getSubmittedFileName());
				FileOutputStream fos2 = new FileOutputStream(fileUploadPath + request.getParameter("txtRegNo") + "_2_" + img2.getSubmittedFileName());
				
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
				
				if(car.addCar())
				{
					out.print("<script>alert('Details Added Successfully')</script>");
					out.print("<script>window.location='CRMS_Admin/Cars_Details.jsp'</script>");
				}
				else
				{
					out.print("<script>alert('Something Went Wrong, Please Check The Details & Try Again')</script>");
					out.print("<script>window.location='CRMS_Admin/Cars_Add.jsp'</script>");					
				}
				
			}
			
			//Edit Car Details Operation
			if (request.getParameter("btnSubmit_Car").equals("Update Car Details")) 
			{
				car_model car = new car_model();

				car.setRegNo(request.getParameter("txtRegNo"));
				car.setModel_Name(request.getParameter("txtModelName"));
				car.setCity(request.getParameter("city"));
				car.setFuel_Type(request.getParameter("txtFuelType"));
				car.setAirbags(Integer.parseInt(request.getParameter("txtAirbags")));
				car.setSeatingCapacity(Integer.parseInt(request.getParameter("txtSeatingCapacity")));
				car.setRentPerDay(Integer.parseInt(request.getParameter("txtRentPerDay")));
				car.setRentPerKM(Integer.parseInt(request.getParameter("txtRentPerKM")));
				car.setLimitPerDay(Integer.parseInt(request.getParameter("txtLimitPerDay")));
				//car.setImage_1("Img 1");
				//car.setImage_2("Img 2");
				
				if(car.updateCar(Integer.parseInt(request.getParameter("txtID"))))
				{
					out.print("<script>alert('Details Updated Successfully')</script>");
					out.print("<script>window.location='CRMS_Admin/Cars_Update.jsp'</script>");
				}
				else
				{
					out.print("<script>alert('Something Went Wrong, Please Check The Details & Try Again')</script>");
					out.print("<script>window.location='CRMS_Admin/Cars_UpdateForm.jsp?ID="+ request.getParameter("txtID") +"&OP=edit'</script>");					
				}
			}
			
			//Edit Car Details Operation
			if (request.getParameter("btnSubmit_Car").equals("Permenantly Delete Record")) 
			{
				car_model car = new car_model();
				
				if(car.deleteCar(Integer.parseInt(request.getParameter("txtID"))))
				{
					out.print("<script>alert('Record Deleted Successfully')</script>");
					out.print("<script>window.location='CRMS_Admin/Cars_Update.jsp'</script>");
				}
				else
				{
					out.print("<script>alert('Something Went Wrong, Please Try Again')</script>");
					out.print("<script>CRMS_Admin/Cars_UpdateForm.jsp?ID="+ request.getParameter("txtID") +"&OP=delete</script>");					
				}
			}
			
		} 
		catch (Exception e) 
		{
			out.print(e);
		}	
	}
}
