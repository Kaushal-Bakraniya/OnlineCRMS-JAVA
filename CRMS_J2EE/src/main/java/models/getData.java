package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import connect.DB_Connect;

public class getData {
	
	public static ResultSet select(String query)
	{
		ResultSet rs = null;
		
		try
		{
			Connection con = DB_Connect.createConnection();
		
			Statement st = con.createStatement();
		
			rs = st.executeQuery(query);
		
			return rs;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return rs;
		}
	}
	
}
