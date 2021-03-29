<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/view_css.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="joinForm_div">
		<table class="table table-striped" id="table_content">
			<thead>
				<tr>
					<th colspan="3" class="view_name"> 게시판 제목임. </th>
				</tr>
			</thead>
			<tbody>
				<tr class="ttt">
					<td class="tt1"> 작성자 </td>
					<td class="tt1_1">차수연</td>
					<td class="tt2">23시 11분</td>
				</tr>
				<tr>
					<td colspan="3" class="t_content" style="min-height: 200px; text-align: left;">
                   		 내용넣는곳이래용
                    </td>
				</tr>
			</tbody>
		</table>
		
	<div class="m">
		<a class="m_a" href="beauty_diary.jsp">목록</a>
		<a class="m_a" href="beauty_diaryUpdate.jsp">수정</a>
		<a class="m_a" onclick="return confirm('정말로 삭제하시겠습니까?')" href="beauty_diaryDelete.jsp">삭제</a>
		<a class="m_a" href="beauty_diaryWrite.jsp">글쓰기</a>
	</div>
		
		<table class="coment_t2">
			<tbody>
				<tr>
					<td class="coment_writer">작성자</td>
					<td class="coment_all"><pre>내용</pre></td>
					<td class="coment_date">24시 00분</td>
				</tr>
				<tr>
					<td colspan=3 class="coment_md">
					<a class="c_a" onclick="location.href='beauty_commUpdateUpdate.jsp'">수정</a>
					<a class="c_a" onclick="return confirm('정말로 삭제하시겠습니까?')" href='beauty_commDelete.jsp>'>삭제</a>
					</td>
				</tr>
			</tbody>
		</table>
		
	<form method="post" action="beauty_commProc.jsp">
		<table class="coment_t">
		<tr>
		<td class="coment_tt1">아이디에옹<input type="hidden" name="diary_ID" value="아이디에옹"></td>
		<td class="coment_tt2">
		<textarea placeholder="댓글 내용" name="comment"></textarea>
		</td>
		<td class="coment_tt3"><input type="submit" value="댓글쓰기" class="btn"></td>
		</tr>
		</table>
	</form>
	
	</div>
</body>
</html>