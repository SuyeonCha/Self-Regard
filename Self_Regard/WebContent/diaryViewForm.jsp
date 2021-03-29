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
	%>

	<div class="joinForm_div">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3" style="background-color:#eeeeee; text-align: center;"> 게시판 글 보기 </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;"> 글 제목 </td>
					<td colspan="2"><%= diary.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
				</tr>
				<tr>
					<td> 작성자 </td>
					<td colspan="2"><%= userID %></td>
				</tr>
				<tr>
					<td> 작성일자 </td>
					<td colspan="2"><%= diary.getDate().substring(0, 11) + diary.getDate().substring(11, 13) + "시 " + diary.getDate().substring(14, 16) + "분" %></td>
				</tr>
				<tr>
					<td> 내용 </td>
					<td colspan="2" style="min-height: 200px; text-align: left;"><%= diary.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
				</tr>
			</tbody>
		</table>
		
		<a href="diary.jsp">목록</a>
		<%
			if(userID != null){
		%>
			<a href="diaryUpdate.jsp?ID=<%= ID %>">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="diaryDelete.jsp?ID=<%= ID %>">삭제</a>
		<%
			}
		%>
		<a href="diaryWrite.jsp">글쓰기</a>
	</div>
</html>