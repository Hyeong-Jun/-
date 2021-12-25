<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>회원등록</title>
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
<SCRIPT language="JavaScript">
	function Check() {
		if (MemberRegister.id.value.length < 1) {
			alert("아이디를 입력하세요.");
			MemberRegister.id.focus();
			return false;
		}

		if (MemberRegister.pwd.value.length < 1) {
			alert("비밀번호를 입력하세요.");
			MemberRegister.pwd.focus();
			return false;
		}

		if (MemberRegister.name.value.length < 1) {
			alert("이름을 입력하세요.");
			MemberRegister.name.focus();
			return false;
		}
		
		if (MemberRegister.email.value.indexOf("@") + "" == "-1"
				|| MemberRegister.email.value.indexOf(".") + "" == "-1"
				|| MemberRegister.email.value == "") {
			alert("E-mail을 입력하세요.");
			MemberRegister.email.focus();
			return false;
		}

		if (MemberRegister.phone.value.length < 1) {
			alert("전화번호를 입력하세요.");
			MemberRegister.phone.focus();
			return false;
		}

		//MemberRegister.submit();
		return true;
	}
	
	function Check_id() 
	{
	browsing_window = window.open("checkid.jsp?id="+MemberRegister.id.value, "_idcheck","height=200,width=300, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
	browsing_window.focus();
	}
</SCRIPT>
</head>

<body>
	<center style="margin:30px">
		<h3>회원등록</h3>
		<form name='MemberRegister' Action='MemberRegister_input.jsp'
			method='post' OnSubmit='return Check()'>


			<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
				<TR>
					<TD width='100' bgcolor='cccccc'><font size='2'><center>
								<b>아이디</b>
							</center></font></TD>
					<TD>
						<input type='text' maxLength='10' size='10' name='id'>
						<input type='button' OnClick='Check_id()' value='ID 중복체크'>
						* 필수
					</TD>
				</TR>

				<TR>
					<TD width='100' bgcolor='cccccc'><font size='2'><center>
								<b>비밀번호</b>
							</center></font></TD>
					<TD>
						<p>
							<input type='password' size='12' name='pwd'> * 필수
						</p>
					</TD>
				</TR>
				
				<TR>
					<TD width='100' bgcolor='cccccc'><font size='2'><center>
								<b>이름</b>
							</center></font></TD>
					<TD>
						<p>
							<input type='text' size='12' name='name'>
						</p>
					</TD>
				</TR>
				
				<TR>
					<TD width='100' bgcolor='cccccc'><font size='2'><center>
								<b>나이</b>
							</center></font></TD>
					<TD>
						<p>
							<input type='text' size='12' name='age'>
						</p>
					</TD>
				</TR>
				
				<TR>
					<TD width='100' bgcolor='cccccc'><font size='2'><center>
								<b>E-mail</b>
							</center></font></TD>
					<TD><font size='2'><input type='text' size='40'
							maxlength='50' name='email'></font></TD>
				</TR>

				<TR>
					<TD width='100' bgcolor='cccccc'><font size='2'><center>
								<b>phone</b>
							</center></font></TD>
					<TD><font size='2'><input type='text' size='40'
							maxlength='50' name='phone'></font> - 없이 입력하세요 </TD>
				</TR>

				<TR>
					<TD align='center' colspan='2' width='100%'>
						<TABLE>
							<TR>
								<TD width='100' align='center'><input Type='Reset'
									Value='다시 작성'></TD>
								<TD width='200' align='center'><input Type='Submit'
									Value='등록'></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>

			</TABLE>
		</form>
	</center>
</body>
</html>