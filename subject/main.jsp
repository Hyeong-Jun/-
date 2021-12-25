<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>자전거 커뮤니티</title>
<link rel="stylesheet" href="main_css.css" />

</head>

<body style="center">
	<!-- container -->
	<header class="navbar">
		<!-- top_menu -->
		<ul class="home">
			<li><a href="#">Home</a></li>
		</ul>
		<ul class="navbar_menu">
			<li><a href="memberboard.jsp">회원관리</a></li>
			<li><a href="listboard.jsp">게시판</a></li>
		</ul>
	<% 
	if(session.getAttribute("user") == null)
	{
	%>
		<ul class="navbar_log">
			<li><a href="Login.jsp">로그인</a></li>
			<li><a href="MemberRegister.jsp">회원가입</a></li>
		</ul>
	<%
	}
	else if(session.getAttribute("user") != null)
	{
	%>
		<ul class="navbar_log">
			<li><a href="Logout.jsp">로그아웃</a></li>
		</ul>
	<%
	}
	%>
	</header>
	
	<!-- main section -->
	<div style="overflow: hidden">
		<ul class="container">
			<li class="inner">
				<img src="./mainImage/EmondaSL6Disc_21_32561_A_Primary.webp">
			</li>
			<li class="inner">
				<img src="./mainImage/EmondaSL7Disc_21_32563_A_Primary.webp">
			</li>
			<li class="inner">
				<img src="./mainImage/DomaneSLR9eTap_21_33300_A_Primary.webp">
			</li>
		</ul>
	</div>
	
	<button class="버튼1">1</button>
	<button class="버튼2">2</button>
	<button class="버튼3">3</button>
	
	<script>
		document.querySelector('.버튼1').addEventListener('click', function(){
			document.querySelector('.container').style.transform = 'translate(0vw)'
		});
		
		document.querySelector('.버튼2').addEventListener('click', function(){
			document.querySelector('.container').style.transform = 'translate(-100vw)'
		});
		
		document.querySelector('.버튼3').addEventListener('click', function(){
			document.querySelector('.container').style.transform = 'translate(-200vw)'
		});
		
	</script>
	
	<footer id="bottom">
			<font>Copyright 소프트웨어학과 2016114413 이형준</font>
	 </footer>
</body>

</html>