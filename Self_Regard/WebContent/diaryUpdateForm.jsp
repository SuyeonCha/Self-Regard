<%@page import="diary.DiaryDAO"%>
<%@page import="diary.Diary"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
			script.println("location.href = 'diary.jsp'");
			script.println("</script>");
		}
		
		Diary diary = new DiaryDAO().getDiary(ID, userID);
	%>

	<div class="joinForm_div">
		<form method="post" action="diaryUpdateProc.jsp?ID=<%= ID %>">
			<table style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align: center;"> 게시판 글 수정 양식 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> <input type="text" placeholder="글 제목" name="Title" maxlength="50" value="<%= diary.getTitle() %>"> </td>
					</tr>
					<tr>
						<td> 
							<textarea placeholder="글 내용" name="Content" style="height: 350px"><%= diary.getContent() %></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="수정">
		</form>
	</div>
</html>