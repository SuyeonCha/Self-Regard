<%@page import="All_diary.*"%>
<%@page import="All_comment.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/view_css.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}else{
			//댓글을 남길 수 없습니다.
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
		int pageNumber = 1;
		
		if(request.getParameter("pageNumber")!= null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		int commNum = 1; //댓글 10개씩 하나 생기는 페이지 수,
		
		if(request.getParameter("commNum")!= null){
			pageNumber = Integer.parseInt(request.getParameter("commNum"));
		}
		Diary diary = new Love_DiaryDAO().getDiary(ID, userID);
	%>

	<div class="joinForm_div">
		<table class="table table-striped" id="table_content">
			<thead>
				<tr>
					<th colspan="3" class="view_name"><%= diary.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></th>
				</tr>
			</thead>
			<tbody>
				<tr class="ttt">
					<td class="tt1"> 작성자 </td>
					<td class="tt1_1"><%= diary.getWriter() %></td>
					<td class="tt2"><%= diary.getDate().substring(0, 11) + diary.getDate().substring(11, 13) + "시 " + diary.getDate().substring(14, 16) + "분" %></td>
				</tr>
				<tr>
					<td colspan="3" class="t_content" style="min-height: 200px; text-align: left;">
					<%= diary.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="m">
			<a class="m_a" href="love_diary.jsp">목록</a>
		<%
			if(userID != null){
		%>
			<a class="m_a" href="love_diaryUpdate.jsp?ID=<%= ID %>">수정</a>
			<a class="m_a" onclick="return confirm('정말로 삭제하시겠습니까?')" href="love_diaryDelete.jsp?ID=<%= ID %>">삭제</a>
		<%
			}
		%>
		<a class="m_a"href="love_diaryWrite.jsp">글쓰기</a>
		</div>
		
		<table class="coment_t2">
			<tbody>
				<% //댓글!!!
					Love_CommDAO love_commDAO = new Love_CommDAO();
					ArrayList<Comment> list = love_commDAO.getList(commNum, diary.getID());
					
					for(int i = 0; i < list.size(); i++){
						out.print("<script>console.log("+list.get(i).getID()+")</script>");	
				%>
				<tr>
					<td class="coment_writer"><%= list.get(i).getCommenter() %></td>
					<td class="coment_all"><%=list.get(i).getComment()%> </td>
					<td class="coment_date"><%= list.get(i).getDate().substring(0, 11) + list.get(i).getDate().substring(11, 13) + "시 " + list.get(i).getDate().substring(14, 16) + "분" %></td>
				</tr>
				<tr>
					<td colspan=3 class="coment_md"><a onclick="location.href='love_commUpdateForm.jsp?ID=<%=list.get(i).getID() %>'">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href='love_commDelete.jsp?ID=<%=list.get(i).getID() %>'>삭제</a>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
				
		<form method="post" action="love_commProc.jsp">
		<table class="coment_t">
		<tr>
		<td class="coment_tt1"><%=userID%><input type="hidden" name="diary_ID" value="<%=diary.getID()%>"></td>
		<td class="coment_tt2">
		<textarea placeholder="댓글 내용" name="comment"></textarea>
		</td>
		<td class="coment_tt3"><input type="submit" value="댓글쓰기" class="btn"></td>
		</tr>
		</table>
		</form>
	</div>
</html>