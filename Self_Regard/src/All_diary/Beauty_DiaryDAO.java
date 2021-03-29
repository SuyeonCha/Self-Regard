package All_diary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Beauty_DiaryDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Beauty_DiaryDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/selfregard_diary";
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
		
		return ""; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	public int getNext(String userID) {
		String SQL = "SELECT ID FROM beauty ORDER BY ID DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			
			return 1; //泥� 踰덉㎏ 寃뚯떆湲��씤 寃쎌슦
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	
	public int write(String Title, String userID, String Content) {
		String SQL = "INSERT INTO beauty (Writer,Title, Content) VALUES (?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);
			pstmt.setString(2, Title);
			pstmt.setString(3, Content);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	public ArrayList<Diary> getList(int pageNumber, String userID){
		String SQL = "SELECT * FROM beauty WHERE ID < ? AND Available = 1 ORDER BY ID DESC LIMIT 10"; // �럹�씠吏� �떦 10媛� �뵫 �몴�떆
		ArrayList<Diary> list = new ArrayList<Diary>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext(userID) - (pageNumber - 1) * 10);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Diary diary = new Diary();
				diary.setID(rs.getInt(1));
				diary.setWriter(rs.getString(2));
				diary.setTitle(rs.getString(3));
				diary.setDate(rs.getString(4));
				diary.setContent(rs.getString(5));
				diary.setAvailalbe(rs.getInt(6));
				
				list.add(diary); 
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean nextPage(String userID, int pageNumber) {
		String SQL = "SELECT * FROM beauty WHERE ID < ? AND Available = 1";
		
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
		String SQL = "SELECT * FROM beauty WHERE ID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Diary diary = new Diary();

				diary.setID(rs.getInt(1));
				diary.setWriter(rs.getString(2));
				diary.setTitle(rs.getString(3));
				diary.setDate(rs.getString(4));
				diary.setContent(rs.getString(5));
				diary.setAvailalbe(rs.getInt(6));
				
				return diary;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int update(String userID, int ID, String Title, String Content) {
		String SQL = "UPDATE beauty SET Title = ?, Content = ? WHERE ID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, Title);
			pstmt.setString(2, Content);
			pstmt.setInt(3, ID);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	public int delete(String userID, int ID) {
		String SQL = "UPDATE beauty SET Available = 0 WHERE ID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ID);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
}


