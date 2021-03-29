<%@page import="All_diary.Beauty_DiaryDAO"%>
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
	<div class="joinForm_div">
		<form method="post" action="beauty_diaryUpdateProc.jsp">
			<table class="write_content">
				<thead>
					<tr>
						<th> 게시판 글 수정 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td> <input type="text" placeholder="글 제목" name="title" maxlength="50" class="write_tt" value="a"></td>
					</tr>
					<tr>
						<td> 
							<textarea placeholder="글 내용" name="Content" class="write_con"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="수정" class="btn">
		</form>
	</div>
</html>