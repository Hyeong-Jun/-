<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
%>

<HTML>
<HEAD>
<TITLE>게시판</TITLE>

<SCRIPT language="JavaScript">
	function Check() {
		if (Modify.id.value.length < 1) {
			alert("아이디를 입력하세요.");
			Modify.id.focus();
			return false;
		}

		if (Modify.pwd.value.length < 1) {
			alert("비밀번호를 입력하세요.");
			Modify.pwd.focus();
			return false;
		}

		if (Modify.name.value.length < 1) {
			alert("이름을 입력하세요.");
			Modify.name.focus();
			return false;
		}

		if (Modify.email.value.indexOf("@") + "" == "-1"
				|| Modify.email.value.indexOf(".") + "" == "-1"
				|| Modify.email.value == "") {
			alert("E-mail을 입력하세요.");
			Modify.email.focus();
			return false;
		}

		if (Modify.phone.value.length < 1) {
			alert("전화번호를 입력하세요.");
			Modify.phone.focus();
			return false;
		}

		//Modify.submit();
		return true;
	}

	function list() {
		location.href = "memberboard.jsp";
	}
</SCRIPT>
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

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	Connection conn = DriverManager.getConnection(url, "Member", "apple");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {

		String strSQL = "SELECT * FROM tblmember WHERE num = ?";
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(num));

		rs = pstmt.executeQuery();
		rs.next();

		String id = rs.getString("id");
		String name = rs.getString("name");
		String email = rs.getString("email");
		String phone = rs.getString("phone");
	%>
	<center style="margin:30px">
		<h3>회원정보 수정</h3>
		<form name='Modify' Action='modify_member_output.jsp' method='post'
			OnSubmit='return Check()'>
			<input type='hidden' name='num' value='<%=num%>'>


			<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
				<TR>
					<TD width='100' bgcolor='cccccc'><font size='2'><center>
								<b>아이디</b>
							</center></font></TD>
					<TD>
						<p>
							<input type='text' size='12' name='id' value="<%=id%>"> *
							필수
						</p>
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
							<input type='text' size='12' name='name' value="<%=name%>">
						</p>
					</TD>
				</TR>

				<TR>
					<TD width='100' bgcolor='cccccc'><font size='2'><center>
								<b>E-mail</b>
							</center></font></TD>
					<TD><font size='2'><input type='text' size='40'
							maxlength='50' name='email' value="<%=email%>"></font></TD>
				</TR>

				<TR>
					<TD width='100' bgcolor='cccccc'><font size='2'><center>
								<b>phone</b>
							</center></font></TD>
					<TD><font size='2'><input type='text' size='40'
							maxlength='50' name='phone' value="<%=phone%>"></font> - 없이
						입력하세요</TD>
				</TR>

				<TR>
					<TD align='center' colspan='2' width='100%'>
						<TABLE>
							<TR>
								<TD width='200' align='center'><input Type='Reset'
									Value='다시 작성'></TD>
								<TD width='200' align='center'><input Type='Submit'
									Value='수정완료'></TD>
								<TD width='200' align='center'><input Type='Button'
									Value='목록' Name='Page' onClick='list();'></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>

			</TABLE>
	</center>
	<%
	} catch (SQLException e) {
	out.print("SQL에러 " + e.toString());
	} catch (Exception ex) {
	out.print("JSP에러 " + ex.toString());
	} finally {
	rs.close();
	pstmt.close();
	conn.close();
	}
	%>

</BODY>
</HTML>


