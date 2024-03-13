package generators;


import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import models.getData;

@WebServlet("/pdf_receipt_2")
public class pdf_receipt_2 extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public pdf_receipt_2() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("application/pdf");
	    response.setHeader("Content-disposition","attachment;filename="+ "Receipt.pdf");
	    
		try {

			int id = Integer.parseInt(request.getParameter("ID"));
			
			Document doc = new Document();
			
			PdfWriter.getInstance(doc, response.getOutputStream());
			
			doc.open();
			
			PdfPTable tbl = new PdfPTable(2); 
			
			Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
			
			ResultSet res = getData.select("select * from tbl_rented where ID = '"+ id +"'ORDER BY ID ASC");
		
			Paragraph para = new Paragraph("Receipt No. : " + id);
			para.setAlignment(Element.ALIGN_CENTER);
			para.setSpacingAfter(15.5f);
			para.setFont(boldFont);
			doc.add(para);
			
			try
			{
				while(res.next())
				{
					tbl.addCell("ID");
					tbl.addCell(res.getString("ID"));
					tbl.addCell("User ID");
					tbl.addCell(res.getString("UID"));

					ResultSet res1 = getData.select("select Name from tbl_users where ID = "+ res.getString("UID") +"");
					
					String name = "";
					
					while(res1.next())
					{
						name = res1.getString(1);
					}
					
					tbl.addCell("User Name");
					tbl.addCell(name);

					tbl.addCell("Reg_No");
					tbl.addCell(res.getString("Reg_No"));
					tbl.addCell("Contact");
					tbl.addCell(res.getString("Contact"));
					tbl.addCell("Address");
					tbl.addCell(res.getString("Address"));
					tbl.addCell("City");
					tbl.addCell(res.getString("City"));
					tbl.addCell("Driver ID");
					tbl.addCell(res.getString("Driver_ID"));
					tbl.addCell("Note");
					tbl.addCell(res.getString("Note"));
					tbl.addCell("KMS Driven");
					tbl.addCell(res.getString("KMS_Driven"));
					tbl.addCell("Pickup_Date");
					tbl.addCell(res.getString("Pickup_Date"));
					tbl.addCell("Return_Date");
					tbl.addCell(res.getString("Return_Date"));
					tbl.addCell("Days");
					tbl.addCell(res.getString("Days"));
					tbl.addCell("Payment");
					tbl.addCell(res.getString("Payment"));	
					tbl.addCell("Status");
					tbl.addCell(res.getString("Status"));
					doc.add(tbl);
				}	
			}
			catch(Exception x)
			{
				System.out.print(x);
				response.sendRedirect(request.getHeader("referer"));
			}
			
			doc.close();
			
		} catch (DocumentException e) {
			System.out.print(e);
			response.sendRedirect(request.getHeader("referer"));
		}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
