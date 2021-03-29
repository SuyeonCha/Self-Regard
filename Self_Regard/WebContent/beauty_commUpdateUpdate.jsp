<%@page import="All_diary.Beauty_DiaryDAO"%>
<%@page import="All_diary.Diary"%>
<%@page import="All_comment.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/comm_css.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="commForm_div">
		<form method="post" action="beauty_commUpdateProc.jsp?ID">
			<table class="coment_t">
				<thead>
					<tr>
						<th class="view_name"> 댓글 수정 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="coment_tt2"> 
							<textarea placeholder="댓글 내용" name="Comment">내용수정</textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="수정" class="btn">
		</form>
	</div>
</html>