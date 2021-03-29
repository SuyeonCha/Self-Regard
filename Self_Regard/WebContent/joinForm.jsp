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
		<form method="post" action="joinProc.jsp">
			<h3 style="text-align: center;">회원가입 화면</h3>
			<div>
				<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
			</div>
			<div>
				<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
			</div>
			<div>
				<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
			</div>
			<div>
				<input type="text" class="form-control" placeholder="닉네임" name="userNickname" maxlength="20">
			</div>
			<div>
				<div>
					<label>
						<input type="radio" name="userGender" autocomplete="off" value="남자" checked> 남자
					</label>
					<label>
						<input type="radio" name="userGender" autocomplete="off" value="여자" checked> 여자
					</label>
				</div>	
			</div>
			<div>
				<input type="date" placeholder="생년월일" name="userBirth">
			</div>
			<input type="submit" value="회원가입">
		</form>
	</div>
</html>