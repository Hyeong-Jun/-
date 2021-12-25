<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
%>

<HTML>
<HEAD>
<TITLE>회원관리</TITLE>

<META http-equiv="Content-Type" content="text/html; charset=utf-8">
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

<SCRIPT language="JavaScript">
function Check()
{
if (Form.keyword.value.length < 1) {
	alert("검색어를 입력하세요.");
	Form.keyword.focus(); 
         return false;
	}
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
	String key = request.getParameter("key");
	String keyword = request.getParameter("keyword");

	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";	
	}
	
	int listSize = 5;
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * listSize + 1;
	int endRow = currentPage * listSize;
	int lastRow = 0;
	int i = 0;
	String strSQL2 = "";
	
	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	Connection conn = DriverManager.getConnection(url, "Member", "apple");

	Statement stmt = conn.createStatement();
	Statement stmt1 = conn.createStatement();

	String strSQL = "SELECT * FROM tblmember ORDER BY num DESC";
	ResultSet rs = stmt.executeQuery(strSQL);
	ResultSet rs2 = null;
	
	if (key==null || keyword==null){
		strSQL2 = "SELECT count(*) FROM tblmember";
	}else{
		strSQL2 = "SELECT count(*) FROM tblmember WHERE " + key + " like '%" + keyword + "%'";
	}
	rs2 = stmt1.executeQuery(strSQL2);
	rs2.next();
	lastRow = rs2.getInt(1);

	rs2.close();
	
	try{
		String strUser = "yes";
		String strSession = session.getAttribute("user").toString();
		
		if(!strUser.equals(strSession)) {
	
	%>
	<TR>
		<TD align='center'>
		<font size='2'> 로그인 하세요.</font>
		</TD>
	</TR>
	<TR>
		<TD align='center'>
		<a href="Login.jsp"> [로그인]</a>
		</TD>
	</TR>
	<%
	} else {
	%>
	<center style="margin:30px">
		<font size='3'><b> 회원관리 </b></font>
		</TD>

		<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>

		<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>

			<TR bgcolor='cccccc'>
				<TD><font size=2><center>
							<b>번호</b>
						</center></font></TD>
				<TD><font size=2><center>
							<b>아이디</b>
						</center></font></TD>
				<TD><font size=2><center>
							<b>비밀번호</b>
						</center></font></TD>
				<TD><font size=2><center>
							<b>이름</b>
						</center></font></TD>
				<TD><font size=2><center>
							<b>E-mail</b>
						</center></font></TD>
				<TD><font size=2><center>
							<b>나이</b>
						</center></font></TD>
				<TD><font size=2><center>
							<b>phone</b>
						</center></font></TD>
			</TR>

			<%
			if(lastRow > 0) {
				if(key==null || keyword==null){
					strSQL2 = "SELECT * FROM tblmember WHERE num BETWEEN " + startRow + " and " + endRow + " ORDER BY num DESC";
					rs2 = stmt1.executeQuery(strSQL2);
				} else {
					strSQL2 = "SELECT * FROM tblmember WHERE " + key + " like '%" + keyword + "%' ORDER BY num DESC";
					rs2 = stmt1.executeQuery(strSQL2);
				}

				for (i = 1; i < listSize; i++){			
					while(rs2.next()){

					int listnum = rs2.getInt("num");
					String id = rs2.getString("id");
					String pwd = rs2.getString("pwd");
					String name = rs2.getString("name");
					String email = rs2.getString("email");
					String age = rs2.getString("age");
					int phone = rs2.getInt("phone");
			%>

			<TR bgcolor='ededed'>
				<TD align=center><font size=2 color='black'><%=listnum%></font></TD>
				<TD align=left><a href="member_output.jsp?num=<%=listnum%>"> <font
						size=2 color="black"><%=id%></font></a></TD>
				<TD align=center><a href="<%=email%>"> <font size=2
						color="black"><%=pwd%></font></a></TD>
				<TD align=center><font size=2><%=name%></font></TD>
				<TD align=center><font size=2><%=email%></font></TD>
				<TD align=center><font size=2><%=age%></font></TD>
				<TD align=center><font size=2><%=phone%></font></TD>
			</TR>

			<%
					}
				}
			%>

		</TABLE>

		<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>

		<TABLE border=0 width=600>
			<TR>
				<TD align=left></TD>

				<TD align='right'><a href='MemberRegister.jsp'>[등록]</a></TD>
			</TR>
		</TABLE>
		<%
		rs.close();
		stmt.close();
		conn.close();
			}
		if(lastRow > 0) {
			int setPage = 1;
			int lastPage = 0;
			if(lastRow % listSize == 0)
				lastPage = lastRow / listSize;
			else
				lastPage = lastRow / listSize + 1;

			if(currentPage > 1) {
		%>
				<a href="memberboard.jsp?pageNum=<%=currentPage-1%>">[이전]</a>	
		<%	
			}
			for(i=setPage; i<=lastPage; i++) {
				if (i == Integer.parseInt(pageNum)){
		%>
				[<%=i%>]
		<%		
				}else{
		%>
				<a href="memberboard.jsp?pageNum=<%=i%>">[<%=i%>]</a>
		<%
				}
			}
			if(lastPage > currentPage) {
		%>
				<a href="memberboard.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
		<%
			}
		}
		%>
	<%
			}
	} catch(NullPointerException e){
	%>
	<TR>
		<TD align='center'>
			<font size='2'> 로그인 하세요.</font>
		</TD>
	</TR>
	<TR>
		<TD align='center'>
		<a href="Login.jsp"> [로그인]</a>
		</TD>
	</TR>
	<%
	}
	%>
	
</BODY>
</HTML>