<%@page import="All_diary.Diary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="All_diary.Love_DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/write_form_css.css">
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
		<form method="post" action="love_diaryWriteProc.jsp">
			<table class="write_content">
				<thead>
					<tr>
						<th> 게시판 글쓰기 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" placeholder="글 제목" name="title" maxlength="50" class="write_tt"></td>
					</tr>
					<tr>
						<td> 
							<textarea placeholder="글 내용" name="content" class="write_con"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="등록"  class="btn">
		</form>
	</div>

</body>
</html>