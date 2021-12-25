<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*" %>

<HTML>
<HEAD>
<TITLE> 아이디 중복 체크 </TITLE> 
</HEAD>

<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	         {font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>



<BODY>

<FORM>

<TABLE border='1' width=250>
	
<%
String id = request.getParameter("id");

if (id == ""){
%>

<TR>
	<TD align='center' bgcolor='cccccc'>
	<font size='2'>id를 입력하세요.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href=javascript:close()>[닫 기]</a>
	</TD>
</TR>

<%
} else {
	Class.forName("com.mysql.jdbc.Driver");


	String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	Connection conn = DriverManager.getConnection(url,"Member","apple");
	Statement stmt = conn.createStatement();
	
	String strSQL = "SELECT id FROM tblmember where id='" + id + "'";
	ResultSet rs = stmt.executeQuery(strSQL);


	if (!rs.next()) {
%>
<TR>
	<TD align='center' bgcolor='cccccc'>
	<fint size='2'>ID : <%=id%> <BR> 사용할 수 있는 아이디입니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href=javascript:close()>[닫 기]</a>
	</TD>
</TR>
<%
	} else {
%>
<TR>
	<TD align='center' bgcolor='cccccc'>
	<font size='2'>ID : <%=id%> <BR> 사용할 수 없는 아이디입니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href=javascript:close()>[닫 기]</a>
	</TD>
</TR>
<%
	}

	rs.close();
	stmt.close();
	conn.close();
}
%>

</BODY>
</HTML>
