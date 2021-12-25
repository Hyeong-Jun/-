<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 인증</title>
</head>
<body>
	<%
	// 세션값 가져오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String sessionID = "yes";
	// 세션값 없으면(null이면) Login.jsp이동
	try {

		if (id == "" || pwd == "") {
	%>
	<TR>
		<TD align="center"><font size='2'>ID와 비밀번호를 입력하세요.</font></TD>
	</TR>
	<TR>
		<TD align="center"><a href="Login.jsp">[로그인]</a></TD>
	</TR>
	<%
		} 
		else {
	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	Connection conn = DriverManager.getConnection(url, "Member", "apple");
	Statement stmt = conn.createStatement();

	String strSQL = "SELECT * FROM tblmember where id='" + id + "'";
	ResultSet rs = stmt.executeQuery(strSQL);
	
	rs.next();
	String logid = rs.getString("id");
	String logpass = rs.getString("pwd");

			if (!id.equals(logid)) {
	%>

	<TR>
		<TD align='center'><font size=2>회원 ID가 아닙니다.</font></TD>
	</TR>
	<TR>
		<TD align='center'><a href="Login.jsp">[로그인]</a></TD>
	</TR>

	<%
			} 
			else {
				if (!pwd.equals(logpass)) {
	%>
	<TR>
		<TD align="center"><font size='2'>비밀번호가 일치하지 않습니다.</font></TD>
	</TR>
	<TR>
		<TD align="center"><a href="Login.jsp">[로그인]</a></TD>
	</TR>

	<%
				} 
				else {
			session.setAttribute("user", sessionID);
			response.sendRedirect("main.jsp");
				}
			}
		}
	} catch (Exception e) {
	%>
	<TR>
		<TD align="center"><font size='2'> 회원 ID가 아닙니다.</font></TD>
	</TR>
	<TR>
		<TD align="center"><a href="Login.jsp">[로그인]</a></TD>
	</TR>
	<%
	}
	%>
	</TABLE>

</BODY>
</HTML>