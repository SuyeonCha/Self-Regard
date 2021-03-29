<%@page import="All_diary.Love_DiaryDAO"%>
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
		//Diary diary = new Love_DiaryDAO().getDiary(ID, userID);
		Comment comm = new Love_CommDAO().getComment(ID);
	%>

	<div class="commForm_div">
		<form method="post" action="love_commUpdateProc.jsp?ID=<%= ID %>">
			<table class="coment_t">
				<thead>
					<tr>
						<th class="view_name"> 댓글 수정 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="coment_tt2"> 
							<textarea placeholder="댓글 내용" name="Comment"><%= comm.getComment() %></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="수정" class="btn">
		</form>
	</div>
</html>