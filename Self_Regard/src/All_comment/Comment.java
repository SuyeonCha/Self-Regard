package All_comment;

public class Comment {
	private int ID;
	private int DiaryID; //일기장 id
	private String Commenter; //댓글쓴이
	private String Date;
	private String Comment; 
	private int Availalbe;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getDiaryID() {
		return DiaryID;
	}
	public void setDiaryID(int diaryID) {
		DiaryID = diaryID;
	}
	public String getCommenter() {
		return Commenter;
	}
	public void setCommenter(String commenter) {
		Commenter = commenter;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getComment() {
		return Comment;
	}
	public void setComment(String comment) {
		Comment = comment;
	}
	public int getAvailalbe() {
		return Availalbe;
	}
	public void setAvailalbe(int availalbe) {
		Availalbe = availalbe;
	}
	
	
}
