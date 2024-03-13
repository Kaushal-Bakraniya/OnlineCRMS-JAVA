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

@WebServlet("/pdf_receipt")
public class pdf_receipt extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public pdf_receipt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("application/pdf");
	    response.setHeader("Content-disposition","attachment;filename="+ "Receipt.pdf");
	    
		try {

			int id = Integer.parseInt(request.getParameter("ID"));
			
			Document doc = new Document();

			PdfWriter.getInstance(doc, response.getOutputStream());
			
			doc.open();
			
			PdfPTable tbl = new PdfPTable(2); 
			
			ResultSet res = getData.select("select * from tbl_oldbookings where ID = '"+ id +"'ORDER BY ID ASC");
			
			Paragraph para = new Paragraph("Receipt No. : " + id);
			para.setAlignment(Element.ALIGN_CENTER);
			para.setSpacingAfter(15.5f);
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
					tbl.addCell("Days");
					tbl.addCell(res.getString("Days"));
					tbl.addCell("Pickup_Date");
					tbl.addCell(res.getString("Pickup_Date"));
					tbl.addCell("Return_Date");
					tbl.addCell(res.getString("Return_Date"));
					tbl.addCell("Days");
					tbl.addCell(res.getString("Days"));
					tbl.addCell("Day_Late");
					tbl.addCell(res.getString("Days_Late"));
					tbl.addCell("City");
					tbl.addCell(res.getString("City"));
					tbl.addCell("Note");
					tbl.addCell(res.getString("Note"));
					tbl.addCell("Driver_ID");
					tbl.addCell(res.getString("Driver_ID"));
					tbl.addCell("Basic_Rent");
					tbl.addCell(res.getString("Basic_Rent"));
					tbl.addCell("Other_Fine");
					tbl.addCell(res.getString("Other_Fine"));
					tbl.addCell("Extra_Charge");
					tbl.addCell(res.getString("Extra_Charge"));
					tbl.addCell("Final_Payment");
					tbl.addCell(res.getString("Final_Payment"));
					doc.add(tbl);
				}	
			}
			catch(Exception x)
			{
				response.sendRedirect(request.getHeader("referer"));
			}
			
			doc.close();
			
		} catch (DocumentException e) {
			e.printStackTrace();
			response.sendRedirect(request.getHeader("referer"));
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
