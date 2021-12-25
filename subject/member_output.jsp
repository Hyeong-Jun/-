<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("euc-kr");
%>

<HTML>
<HEAD>
<TITLE>ȸ������</TITLE>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
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
			<li><a href="#">Home</a></li>
		</ul>
		<ul class="navbar_menu">
			<li><a href="memberboard.jsp">ȸ������</a></li>
			<li><a href="listboard.jsp">�Խ���</a></li>
		</ul>
	<% 
	if(session.getAttribute("user") == null)
	{
	%>
		<ul class="navbar_log">
			<li><a href="Login.jsp">�α���</a></li>
			<li><a href="MemberRegister.jsp">ȸ������</a></li>
		</ul>
	<%
	}
	else if(session.getAttribute("user") != null)
	{
	%>
		<ul class="navbar_log">
			<li><a href="Logout.jsp">�α׾ƿ�</a></li>
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
		String pwd = rs.getString("pwd");
		String name = rs.getString("name").trim();
		String email = rs.getString("email");
		int age = Integer.parseInt(rs.getString("age"));
		String phone = rs.getString("phone");
	%>

	<center style="margin:30px">
		<font size='3'><b> ȸ������ </b></font>

		<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>

		<TABLE border='0' width='600'>
			<TR>
				<TD align='center'><font size='2'> ���̵� : <%=id%></font></TD>
			</TR>
		</TABLE>

		<TABLE border='0' width='600'>
			<TR>
				<TD align='center'><font size='2'> ��й�ȣ : <%=pwd%></font></TD>
			</TR>
		</TABLE>

		<TABLE border='0' width='600'>
			<TR>
				<TD align='center'><font size='2'> �̸� : <%=name%></font></TD>
			</TR>
		</TABLE>
		
		<TABLE border='0' width='600'>
			<TR>
				<TD align='center'><font size='2'> �̸��� : <%=email%></font></TD>
			</TR>
		</TABLE>

		<TABLE border='0' width='600'>
			<TR>
				<TD align='center'><font size='2'> ���� : <%=age%></font></TD>
			</TR>
		</TABLE>
		
		<TABLE border='0' width='600'>
			<TR>
				<TD align='center'><font size='2'> �޴�����ȣ : <%=phone%></font></TD>
			</TR>
		</TABLE>
		
		<br><br><br>
		<TABLE border='0' width='600'>
			<TR>
				<TD align='left'><a href="modify_member_pwd.jsp?num=<%=num%>">[�����ϱ�]</a>
					<a href="delete_pass.jsp?num=<%=num%>">[�����ϱ�]</a></TD>

				<TD align='right'>
					<a href='memberboard.jsp'>[��Ϻ���]</a>
				</TD>
			</TR>
		</TABLE>

		<%
		pstmt.setInt(1, Integer.parseInt(num));
		pstmt.executeQuery();

		} catch (SQLException e) {
		out.print("SQL���� " + e.toString());
		} catch (Exception ex) {
		out.print("JSP���� " + ex.toString());
		} finally {
		rs.close();
		pstmt.close();
		conn.close();
		}
		%>

		</TABLE>
</BODY>
</HTML>
