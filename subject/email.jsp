<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
<TITLE> 이메일 전송 </TITLE>

<SCRIPT language="JavaScript">
function Check()
{
if (email.toemail.value.indexOf("@") + "" == "-1" ||
	email.toemail.value.indexOf(".") + "" == "-1" ||
	email.toemail.value == "" )
	{ 
		alert("E-mail을 입력하세요.");
		email.toemail.focus();
		return false;
	}

if (email.title.value.length < 1) {
	alert("글제목을 입력하세요.");
	email.title.focus(); 
	return false;
        }

if (email.contents.value.length < 1) {
	alert("글내용을 입력하세요.");
	email.contents.focus(); 
	return false;
        }

email.submit();
}


function list()
{
location.href = "listboard.jsp";
}

</SCRIPT>
<link rel="stylesheet" href="main_css.css" />
</HEAD>

<BODY>
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
Connection conn = DriverManager.getConnection(url,"Member","apple");

PreparedStatement pstmt = null;
ResultSet rs = null;

try {

String strSQL = "SELECT * FROM tblboard WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String email = rs.getString("email");
String title = rs.getString("title");
String contents = rs.getString("contents");
%>
                   
<center><font size='3'><b> 이메일 발송하기 </b></font>                  

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>
                 
<FORM Name='email' Action='email_input.jsp' Method='POST' OnSubmit='return Check()'>
<input type='hidden' name='num' value='<%=num %>'>
      
<TABLE border='0' width='600'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>보내는이</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='12' name='fromemail' value="<%=email %>"> * 필수 </p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>받는이</b></center></font>
		</TD>
		<TD>
			<p><input type='text' size='12' name='toemail'> * 필수 </p>
		</TD>
	</TR>

	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>글 제목</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='70' maxlength='50' name='title' value="<%=title %>"></font>
		</TD>
	</TR>

	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>글 내용</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<textarea cols='70' rows='15' wrap='virtual' name='contents'><%=contents %></textarea>
         		</font>
      		</TD>
	</TR>
	
	<TR>
		<TD colspan='2'><hr size='1' noshade></TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='200' align='center'>
					<input Type = 'Reset' Value = '다시 작성'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Submit' Value = '이메일전송'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Button' Value = '목록' Name='Page' onClick='list();'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>

<%
}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
	rs.close();
	pstmt.close();
	conn.close();
}
%>

</BODY>
</HTML>


