<%@page import="diary.DiaryDAO"%>
<%@page import="diary.Diary"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		int ID = 0;
		if(request.getParameter("ID") != null){
			ID = Integer.parseInt(request.getParameter("ID"));
		}
		
		if(ID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		Diary diary = new DiaryDAO().getDiary(ID, userID);
		
		if(request.getParameter("Title") == null || request.getParameter("Content") == null
				|| request.getParameter("Title").equals("") || request.getParameter("Content").equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			DiaryDAO diaryDAO = new DiaryDAO();
			int result = diaryDAO.update(userID ,ID, request.getParameter("Title"), request.getParameter("Content"));
			
			if(result == -1) { 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정에 실패하였습니다.')"); // 데이터베이스 오류
				script.println("history.back()");
				script.println("</script>");
			} 
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'diary.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>