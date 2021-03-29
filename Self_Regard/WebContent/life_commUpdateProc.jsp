<%@page import="All_diary.*"%>
<%@page import="All_comment.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="diary" class="diary.Diary" scope="page" />
<jsp:setProperty name="diary" property="title" />
<jsp:setProperty name="diary" property="content" />

<jsp:useBean id="comm" class="All_comment.Comment" scope="page" />
<jsp:setProperty name="comm" property="comment" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 

		int ID = 0; //commID
		if(request.getParameter("ID") != null){
			ID = Integer.parseInt(request.getParameter("ID"));
		}
		
		if(ID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 댓글입니다.')");
			script.println("location.href = 'love_diary.jsp'");
			script.println("</script>");
		}
		int commID = ID;
		//out.print(id);
	
		Life_CommDAO life_commDAO = new Life_CommDAO();
		String comment = request.getParameter("Comment");
		if(comment.equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("location.href = 'life_diary.jsp?'");
			script.println("</script>");
		} else {
			int result = life_commDAO.update(commID, comment);
			/////////////////////////////
			if(result == -1) { 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('댓글 수정에 실패하였습니다.')"); // 데이터베이스 오류
				script.println("history.back()");
				script.println("</script>");
			} 
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('댓글 수정 하였습니다.')"); 
				script.println("location.href = 'life_diary.jsp?'");
				script.println("</script>");
			}
		}
/*
		
*/
	%>
</body>
</html>