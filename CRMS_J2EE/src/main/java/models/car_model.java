package models;

import java.sql.*;

import connect.DB_Connect;

public class car_model {

	// Declare Properties
	private String RegNo;
	private String Model_Name;
	private String City;
	private String Fuel_Type;
	private int Airbags;
	private int Seating_Capacity;
	private int RentPerDay;
	private int RentPerKM;
	private int LimitPerDay;
	private String Image_1;
	private String Image_2;
	
	
	// Setter Methods for Properties
	public void setRegNo(String RegNo) {
		this.RegNo = RegNo;
	}

	public void setModel_Name(String Model_Name) {
		this.Model_Name = Model_Name;
	}

	public void setCity(String City) {
		this.City = City;
	}

	public void setFuel_Type(String Fuel_Type) {
		this.Fuel_Type = Fuel_Type;
	}

	public void setAirbags(int Airbags) {
		this.Airbags = Airbags;
	}

	public void setSeatingCapacity(int Seating_Capacity) {
		this.Seating_Capacity = Seating_Capacity;
	}

	public void setRentPerDay(int RentPerDay) {
		this.RentPerDay = RentPerDay;
	}
	
	public void setRentPerKM(int RentPerKM) {
		this.RentPerKM = RentPerKM;
	}
	
	public void setLimitPerDay(int LimitPerDay) {
		this.LimitPerDay = LimitPerDay;
	}
	
	public void setImage_1(String Image_1) {
		this.Image_1 = Image_1;
	}
	
	public void setImage_2(String Image_2) {
		this.Image_2 = Image_2;
	}

	//Add Car Method
	public Boolean addCar() 
	{
		try 
		{
			Connection con = DB_Connect.createConnection();

			String query = "insert into tbl_cars(Reg_No,Model_Name,Status,City,Fuel_Type,Airbags,Seating_Capacity,Rent_PerDay,"
					+ "Rent_PerKM,Limit_PerDay,Image_1,Image_2) values('"+ RegNo +"','"+ Model_Name +"','Available','"+ City +"','"+ Fuel_Type +"',"
							+ "'"+ Airbags +"','"+ Seating_Capacity +"','"+ RentPerDay +"','"+ RentPerKM +"','"+ LimitPerDay +"',"
									+ "'"+ Image_1 +"','"+ Image_2 +"')";
			
			System.out.println(query);
			
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
	
	//Update Car Details Method
	public Boolean updateCar(int id) 
	{
		try 
		{
			Connection con = DB_Connect.createConnection();

			String query = "update tbl_cars set Reg_No = '"+ RegNo +"',Model_Name='"+ Model_Name +"',Status='Available',City='"+ City +"',Fuel_Type='"+ Fuel_Type +"',Airbags='"+ Airbags +"',"
					+ "Seating_Capacity='"+ Seating_Capacity +"',Rent_PerDay='"+ RentPerDay +"',Rent_PerKM='"+ RentPerKM +"',Limit_PerDay='"+ LimitPerDay +"'"
							+ " where ID = '"+ id +"'";
			
			System.out.println(query);
			
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
	
	//Delete Car Method
	public Boolean deleteCar(int id) 
	{
		try 
		{
			Connection con = DB_Connect.createConnection();

			String query = "delete from tbl_cars where ID = '"+ id +"'";
			
			System.out.println(query);
			
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
