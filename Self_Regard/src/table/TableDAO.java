package table;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TableDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public TableDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/selfregard_user";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int create(String userID) {
		
		//String command = "CREATE TABLE Employees (ID INTEGER, Name CHAR(50));";
	
		String SQL = "CREATE TABLE " + userID + " (ID int primary key auto_increment, "
				+ "Title text not null, Date timestamp default current_timestamp, "
				+ "Content text not null, Available int default 1);";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // DB실패
	}
}
