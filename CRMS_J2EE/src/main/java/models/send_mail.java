package models;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class send_mail {
	
	public void sendMail(String toID,String subject, String bodyText)
	{ 
		//Sender's email ID:
		String fromID = "#";

		//Sender's Email Password:
		String password = "#";

		/*Change the location of the required attachment file, the format can by anything like jpg, png, pdf etc:
		String attachmentLocation = "D:\\Hare_Krishna.pdf";*/

		// Host is Gmail's SMTP
		String host = "smtp.gmail.com";

		//Getting system properties
		Properties pr = System.getProperties();

		//Setting up Email server
		pr.put("mail.smtp.host", host);
		pr.put("mail.smtp.port", "465");
		pr.put("mail.smtp.ssl.enable", "true");
		pr.put("mail.smtp.auth", "true");
			
		//pass the Email and password to the session object
		Session ss = Session.getInstance(pr, new javax.mail.Authenticator() 
		{
		    protected PasswordAuthentication getPasswordAuthentication() 
		    {
		        return new PasswordAuthentication(fromID, password);
		    }
		});

			try 
			{
		    	MimeMessage mm = new MimeMessage(ss);
		    
		    	//Set the 'From:' header field
		    	mm.setFrom(new InternetAddress(fromID));
		    
		    	//Set the 'To:' header field
		    	mm.addRecipient(Message.RecipientType.TO, new InternetAddress(toID));
		    
		    	//Set the 'Subject:' header field
		    	mm.setSubject(subject);
		    	//MimeBodyPart attachment = new MimeBodyPart();
		    	MimeBodyPart text = new MimeBodyPart();
		    
		    	/*Change the location of the attachment file:
		    	File file = new File(attachmentLocation);
		    	attachment.attachFile(file);*/
		    
		    	//Set the actual message of the Email:
		    	text.setText(bodyText);
		    	Multipart mp = new MimeMultipart();
		    	mp.addBodyPart(text);
		    	//mp.addBodyPart(attachment);
		    
		    	mm.setContent(mp);
		    
		    	System.out.println("sending the Email...");
		    
		    	//send the mail:
		    	Transport.send(mm);
		    	System.out.println("\nEmail sent successfully!!");
			} 
			catch (MessagingException e) 
			{
		    	e.printStackTrace();
			}
	}	
}
