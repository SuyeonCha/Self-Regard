<%@page import="diary.Diary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="diary.DiaryDAO"%>
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
	%>

	<div class="joinForm_div">
		<form method="post" action="diaryWriteProc.jsp">
			<table style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align: center;"> 게시판 글쓰기 양식 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> <input type="text" placeholder="글 제목" name="title" maxlength="50"> </td>
					</tr>
					<tr>
						<td> 
							<textarea placeholder="글 내용" name="content" style="height: 350px"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="글쓰기">
		</form>
	</div>
</html>