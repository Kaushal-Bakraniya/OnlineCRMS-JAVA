package models;

import java.sql.*;

import connect.DB_Connect;

public class user_model {

	// Declare Properties
	private String name;
	private String email;
	private String contact;
	private String gen;
	private String address;
	private String city;
	private String profilepicture;
	private String password;

	// Setter Methods for Properties
	public void setName(String name) {
		this.name = name;
	}

	public void setGender(String gen) {
		this.gen = gen;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setProfilePicture(String profilepicture) {
		this.profilepicture = profilepicture;
	}

	//Login Method
	public int Login()
	{
		try
		{	
			String query = "Select Email,Password,ID from tbl_users where Email = '"+ email +"' and Password = '"+ password + "'";
			
			ResultSet rs = getData.select(query);
			
			while(rs.next())
			{
				if(rs.getString(1).equals(email) && rs.getString(2).equals(password))
				{
					return rs.getInt(3);
				}
			}
			
			return 0;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	// Insert Into Database through Function
	public Boolean createUser() 
	{
		try {
			Connection con = DB_Connect.createConnection();

			String query = "insert into tbl_users(Name,Email,Contact_No,Gender,Address,City,Profile_Picture,Password)"
					+ "values('" + name + "','" + email + "','" + contact + "','" + gen + "','" + address + "','" + city
					+ "','" + profilepicture + "','" + password + "')";

			PreparedStatement st = con.prepareStatement(query);

			int rowsInserted = st.executeUpdate();

			if (rowsInserted > 0) 
			{
				return true;
			} 
			else 
			{
				return false;
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
	}
	
	//Update User Details Through Function
	public Boolean updateUser(int id) 
	{
		try 
		{
			Connection con = DB_Connect.createConnection();

			String query = "update tbl_users set Name='"+ name +"',Email = '"+ email +"',Contact_No = '"+ contact +"',Gender = '"+ gen +"',"
					+ "Address = '"+ address +"',City = '"+ city +"',Password = '"+ password +"'"
							+ "where ID = '"+ id +"' ";

			PreparedStatement st = con.prepareStatement(query);

			int rowsUpdated = st.executeUpdate();

			if (rowsUpdated > 0) 
			{
				return true;
			} 
			else 
			{
				return false;
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
	}
	
	
	//Delete User Account Through Function
	public Boolean deleteUser(int id) 
	{
		try 
		{
			Connection con = DB_Connect.createConnection();

			String query = "delete from tbl_users where ID = '"+ id +"' ";

			PreparedStatement st = con.prepareStatement(query);

			int rowsDeleted = st.executeUpdate();

			if (rowsDeleted > 0) 
			{
				return true;
			} 
			else 
			{
				return false;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
	}

}
