<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="joinForm_div">
		<form method="post" action="loginProc.jsp"> <!-- submit 클릭 시 loginAction.jsp로 가거라 -->
			<h3 style="text-align: center;">로그인 화면</h3>
			<div class="form-group">
				<input type="text" placeholder="아이디" name="userID" maxlength="20">
			</div>
			<div class="form-group">
				<input type="password" placeholder="비밀번호" name="userPassword" maxlength="20">
			</div>
			<input type="submit" value="로그인">
		</form>
	</div>
</html>