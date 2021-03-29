<%@page import="All_diary.Travel_DiaryDAO"%>
<%@page import="All_diary.Diary"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/update_css.css">
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
			script.println("alert('로그인을 하세요.')");
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
			script.println("location.href = 'travel_diary.jsp'");
			script.println("</script>");
		}
		
		Diary diary = new Travel_DiaryDAO().getDiary(ID, userID);
	%>

	<div class="joinForm_div">
		<form method="post" action="travel_diaryUpdateProc.jsp?ID=<%= ID %>">
			<table class="write_content">
				<thead>
					<tr>
						<th> 게시판 글 수정 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> <input type="text" placeholder="글 제목" name="Title" maxlength="50" class="write_tt" value="<%= diary.getTitle() %>"> </td>
					</tr>
					<tr>
						<td> 
							<textarea placeholder="글 내용" name="Content" class="write_con"><%= diary.getContent() %></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="수정" class="btn">
		</form>
	</div>
</html>