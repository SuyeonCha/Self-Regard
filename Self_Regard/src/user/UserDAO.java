package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/selfregard";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일치
				}
			} 
			
			return -1; // 아이디 존재 X
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // DB 오류
	}
	
	public int selectNickname(String nickname) {
		String SQL = "SELECT userPassword FROM USER WHERE userNickname = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 1; // 닉네임 존재
			} 
			
			return -1; // 닉네임 존재 X
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // DB 오류
	}
	
	public int join(User user) {
		if(login(user.getUserID(), user.getUserPassword()) != -1) {
			return -1;
		}
		if(selectNickname(user.getUserNickname()) == 1) {
			return -2;
		}
		
		String SQL = "INSERT INTO user (userID, userPassword, userName, userNickname, userGender, userBirth) VALUES (?, ?, ?, ?, ?, ?);";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserNickname());
			pstmt.setString(5, user.getUserGender());
			pstmt.setString(6, user.getUserBirth());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // DB 오류
	}
}
