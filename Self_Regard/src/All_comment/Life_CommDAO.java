package All_comment;

import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Life_CommDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Life_CommDAO() {
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
	
	public int getNext(int userID) {
		String SQL = "SELECT ID FROM life_comment ORDER BY ID DESC";
		
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
	
	public int write(int diary_id, String userID, String Comment) {
		String SQL = "INSERT INTO life_comment (Diary_id, Commenter, Comment) VALUES (?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, diary_id); //게시물 글 번호
			pstmt.setString(2, userID);
			pstmt.setString(3, Comment);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	public ArrayList<Comment> getList(int commNum, int diary_id){
		String SQL = "SELECT * FROM life_comment WHERE Diary_ID = ? AND Available = 1 ORDER BY ID DESC LIMIT 10"; // �럹�씠吏� �떦 10媛� �뵫 �몴�떆
		ArrayList<Comment> list = new ArrayList<Comment>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,diary_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Comment comm = new Comment();
				comm.setID(rs.getInt(1));
				comm.setDiaryID(rs.getInt(2));
				comm.setCommenter(rs.getString(3));
				comm.setDate(rs.getString(4));
				comm.setComment(rs.getString(5));
				comm.setAvailalbe(rs.getInt(6));
				
				list.add(comm); 
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	/*
	public boolean nextPage(int diary_id, int pageNumber) {
		String SQL = "SELECT * FROM love_comment WHERE ID < ? AND Available = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext(diary_id) - (pageNumber -1) * 10);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	*/
	public Comment getComment(int ID) {
		String SQL = "SELECT * FROM life_comment WHERE id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
//Diary_id, Commenter, Comment
				Comment comm = new Comment();
				comm.setID(rs.getInt(1));
				comm.setDiaryID(rs.getInt(2));
				comm.setCommenter(rs.getString(3));
				comm.setDate(rs.getString(4));
				comm.setComment(rs.getString(5));
				comm.setAvailalbe(rs.getInt(6));
				
				return comm; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int update(int ID, String Comment) {
		String SQL = "UPDATE life_comment SET Comment = ? WHERE ID = ?";
		//Diary_id, Commenter, Comment
		String comm = Comment;
		byte[] byteText = comm.getBytes(Charset.forName("UTF-8"));
		//To get original string from byte.
		
		try {
			String originalString= new String(byteText , "UTF-8");
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, originalString);
			pstmt.setInt(2, ID);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	public int delete(int ID) {
		String SQL = "UPDATE life_comment SET Available = 0 WHERE ID = ?";
		
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


