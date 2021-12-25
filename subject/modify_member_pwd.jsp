<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<HTML>
<HEAD>
<TITLE>게시판 수정</TITLE>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<style type='text/css'>
<!--
a:link {
	font-family: "";
	color: black;
	text-decoration: none;
}

a:visited {
	font-family: "";
	color: black;
	text-decoration: none;
}

a:hover {
	font-family: "";
	color: black;
	text-decoration: underline;
}
-->
</style>
<link rel="stylesheet" href="main_css.css" />
</head>

<body>
	<!-- container -->
	<header class="navbar">
		<!-- top_menu -->
		<ul class="home">
			<li><a href="main.jsp">Home</a></li>
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

	<%
	String num = request.getParameter("num");
	%>

	<center style="margin:30px">
		<font size='3'><b>비밀번호 확인</b></font>

		<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>

		<Form Action='modify_member_input.jsp' Method='post'>
			<input type='hidden' name='num' value='<%=num%>'>

			<TABLE border='0' width='300' align='center'>
				<TR>
					<TD align='center'><font size=2><B>비밀번호</B></font></TD>
					<TD><input type='password' name='pwd' size=20 maxlength=20>
						<input type='submit' value=' 확 인 '
						style='background-color: cccccc; font-weight: bolder'></TD>
				</TR>
			</TABLE>

			<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
				<TR>
					<TD><hr size='1' noshade></TD>
				</TR>
			</TABLE>

			<a href='memberboard.jsp'>[목록 보기]</a>

		</FORM>
</BODY>
</HTML>