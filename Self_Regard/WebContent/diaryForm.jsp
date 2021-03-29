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
		
		int pageNumber = 1;
		
		if(request.getParameter("pageNumber")!= null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<div class="joinForm_div">
		<table style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color:#eeeeee; text-align: center;"> 번호 </th>
					<th style="background-color:#eeeeee; text-align: center;"> 제목 </th>
					<th style="background-color:#eeeeee; text-align: center;"> 작성자 </th>
					<th style="background-color:#eeeeee; text-align: center;"> 작성일 </th>
				</tr>
			</thead>
			<tbody>
				<%
					DiaryDAO diaryDAO = new DiaryDAO();
					ArrayList<Diary> list = diaryDAO.getList(pageNumber, userID);
					
					for(int i = 0; i < list.size(); i++){
				%>
						<tr>
							<td><%= list.get(i).getID() %></td>
							<td><a href="diaryView.jsp?ID=<%= list.get(i).getID() %>"><%= list.get(i).getTitle() %></a></td>
							<td><%= list.get(i).getDate().substring(0, 11) + list.get(i).getDate().substring(11, 13) + "시 " + list.get(i).getDate().substring(14, 16) + "분" %></td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			if(pageNumber != 1){
		%>
				<a href="diary.jsp?pageNumber=<%= pageNumber - 1 %>"> 이전 </a>
		<%
			} if(diaryDAO.nextPage(userID ,pageNumber + 1)){
		%>
			<a href="diary.jsp?pageNumber=<%= pageNumber + 1 %>"> 다음 </a>
		<%
			}
		%>
		
		<a href="diaryWrite.jsp">글쓰기</a>
	</div>
</html>