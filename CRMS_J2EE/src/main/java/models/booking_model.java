package models;

import java.sql.Connection;
import java.util.Date;
import java.util.Locale;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import connect.DB_Connect;

public class booking_model {

	private int cid = 0;
	private int uid = 0;
	private String status = "";
	private String pickupDate = "";
	private String returnDate = "";
	private String plan = "";

	public void setCID(int cid) {
		this.cid = cid;
	}

	public void setUID(int uid) {
		this.uid = uid;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setPickupDate(String pickupDate) {
		this.pickupDate = pickupDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}

	// Book Car Method User
	public Boolean bookCar() {
		try {
			Connection con = DB_Connect.createConnection();

			int user_id = 0;
			String user_contactNo = "";
			String user_address = "";

			ResultSet rs1 = getData.select("select * from tbl_users where ID = '" + uid + "'");

			while (rs1.next()) {
				user_id = rs1.getInt(1);
				user_contactNo = rs1.getString(4);
				user_address = rs1.getString(6);
			}

			String car_regNo = "";
			String car_city = "";
			int car_RentPerDay = 0;
			int car_RentPerKm = 0;
			int car_LimitPerDay = 0;

			ResultSet rs2 = getData.select("select * from tbl_cars where ID = '" + cid + "'");

			while (rs2.next()) {
				car_regNo = rs2.getString(2);
				car_city = rs2.getString(5);
				car_RentPerDay = rs2.getInt(9);
				car_RentPerKm = rs2.getInt(10);
				car_LimitPerDay = rs2.getInt(11);
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Date date1 = sdf.parse(pickupDate);
			Date date2 = sdf.parse(returnDate);

			long time_difference = date2.getTime() - date1.getTime();

			int days = (int) ((time_difference / (1000 * 60 * 60 * 24)) % 365) + 1;

			int Payment = car_RentPerDay * days;

			String query = "insert into tbl_rented(UID,Reg_No,Days,Pickup_Date,Return_Date,Contact,Address,City,Payment,Note,Status)"
					+ "values('" + uid + "','" + car_regNo + "','" + days + "','" + pickupDate + "','" + returnDate
					+ "','" + user_contactNo + "','" + user_address + "','" + car_city + "','" + Payment + "','" + plan
					+ "','Requested')";

			PreparedStatement st = con.prepareStatement(query);

			int RowsInserted = st.executeUpdate();

			if (RowsInserted > 0) {
				String query2 = "update tbl_cars set Status='Requested' where ID = '" + cid + "'";

				PreparedStatement st2 = con.prepareStatement(query2);

				st2.executeUpdate();

				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
