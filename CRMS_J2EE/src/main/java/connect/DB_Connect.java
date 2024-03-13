package connect;
import java.sql.Connection;
import java.sql.DriverManager;

public class DB_Connect {
	
	public static Connection createConnection()
	{
		Connection con = null;
		
		String URL = "jdbc:mysql://localhost:3306/crms_db";
		String Username = "root";
		String Password = "";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL,Username,Password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		System.out.println(con);
		
		return con;
	}
	
}
