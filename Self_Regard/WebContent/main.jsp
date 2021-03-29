<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Self-Regard</title>
<link type="text/css" rel="stylesheet" href="css/home_css.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String contentPage = request.getParameter("CONTENTPAGE");
		
		String userID = null;
		
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
  <!--위에 고정 메뉴바 -->
  <header class="sidebar">
	<div>
     <center>
		<a href="index.jsp" target="_self"><img class="logo_img" src="images/LOGO.png"></img></a>
	 </center>
	</div>
	<nav>
		<% if(userID == null){ %>
        <ul>
            <li><a href="login.jsp">PERSONAL DIATY</a></li>
			<li><a href="login.jsp">LOGIN</a></li>
            <li><a href="join.jsp">JOIN US</a></li>
        </ul>   
        <% } else { %>
        <ul>
           	<li><a href="diary.jsp">PERSONAL DIATY</a></li>
			<li><a href="logout.jsp">LOGOUT</a></li>
        </ul> 
        <% } %> 
    </nav>   
	</header>
	<!-- 대나무숲 메뉴들-->
	<section class="content">
		<jsp:include page="<%= contentPage %>" flush="false" />
	</section>
</body>
</html>