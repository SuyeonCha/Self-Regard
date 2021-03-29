package diary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DiaryDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DiaryDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/selfregard_user";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return ""; // 데이터베이스 오류
	}
	
	public int getNext(String userID) {
		String SQL = "SELECT ID FROM " + userID + " ORDER BY ID DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			
			return 1; //첫 번째 게시글인 경우
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	
	public int write(String Title, String userID, String Content) {
		String SQL = "INSERT INTO " + userID +" (Title, Content) VALUES (?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, Title);
			pstmt.setString(2, Content);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Diary> getList(int pageNumber, String userID){
		String SQL = "SELECT * FROM " + userID + " WHERE ID < ? AND Available = 1 ORDER BY ID DESC LIMIT 10"; // 페이지 당 10개 씩 표시
		ArrayList<Diary> list = new ArrayList<Diary>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext(userID) - (pageNumber - 1) * 10);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Diary diary = new Diary();
				diary.setID(rs.getInt(1));
				diary.setTitle(rs.getString(2));
				diary.setDate(rs.getString(3));
				diary.setContent(rs.getString(4));
				diary.setAvailalbe(rs.getInt(5));
				
				list.add(diary); 
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean nextPage(String userID, int pageNumber) {
		String SQL = "SELECT * FROM " + userID + " WHERE ID < ? AND Available = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext(userID) - (pageNumber -1) * 10);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public Diary getDiary(int ID, String userID) {
		String SQL = "SELECT * FROM " + userID + " WHERE ID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Diary diary = new Diary();

				diary.setID(rs.getInt(1));
				diary.setTitle(rs.getString(2));
				diary.setDate(rs.getString(3));
				diary.setContent(rs.getString(4));
				diary.setAvailalbe(rs.getInt(5));
				
				return diary;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int update(String userID, int ID, String Title, String Content) {
		String SQL = "UPDATE " + userID + " SET Title = ?, Content = ? WHERE ID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, Title);
			pstmt.setString(2, Content);
			pstmt.setInt(3, ID);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; //데이터베이스 오류
	}
	
	public int delete(String userID, int ID) {
		String SQL = "UPDATE " + userID + " SET Available = 0 WHERE ID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ID);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; //데이터베이스 오류
	}
}


