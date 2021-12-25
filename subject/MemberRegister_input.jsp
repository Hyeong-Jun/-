<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
String name   = request.getParameter("name");  
String pwd   = request.getParameter("pwd"); 
String email  = request.getParameter("email");
String age = request.getParameter("age");
String id  = request.getParameter("id");
String phone = request.getParameter("phone");


String check_ok = "yes";

if (id=="")
	check_ok="no";
if (pwd=="")
	check_ok="no";
if (name=="")
	check_ok="no";
if (age=="")
	check_ok="no";
if (email=="")
	check_ok="no";
if (phone=="")
	check_ok="no";


Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
Connection conn = DriverManager.getConnection(url,"Member","apple");
Statement stmt = conn.createStatement();

String strSQL = "SELECT id FROM tblmember where id='" + id + "'";
ResultSet rs = stmt.executeQuery(strSQL);

/*
PreparedStatement pstmt1 = null;
String tstrSQL = "SELECT Max(num) FROM tblboard";
pstmt1 = conn.prepareStatement(tstrSQL);
ResultSet trs = pstmt1.executeQuery();
int num = 1;

if (!trs.wasNull()){
	trs.next();
	num = trs.getInt(1) + 1;	
}
rs.close();
pstmt1.close();
*/


if (!rs.next())
	check_ok="yes";
else
	check_ok="no";

if (check_ok == "yes"){
	strSQL = "INSERT INTO tblmember(id,pwd,name,age,email,phone)";
	strSQL = strSQL +  "VALUES('" + id + "', '" + pwd + "', '" + name + "', '" + age + "', '"  + email + "', '" + phone + "')";
	stmt.executeUpdate(strSQL);

%>

<BODY>

<center><font size='3'><b> 회원 가입 성공 </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>회원 가입을 축하합니다.<BR>로그인 하세요.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="Login.jsp">[로그인]</a></font>
	</TD>
</TR>
</TABLE>

</BODY>
</HTML>

<%
} else {
%>

<HTML>
<HEAD>
<TITLE> 회원 가입 실패 </TITLE> 
</HEAD>

<BODY>

<center><font size='3'><b> 회원 가입 실패 </b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>회원 가입에 실패 했습니다. <BR>다시 가입서를 작성해 주세요.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="MemberRegister.jsp">[가입서 작성]</a></font>
	</TD>
</TR>
</TABLE>

</BODY>
</HTML>
<%
}

stmt.close();
conn.close();
%>