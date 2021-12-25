<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*, java.io.*" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "javax.servlet.ServletException" %>
<%@ page import = "javax.servlet.http.HttpServlet" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.servlet.http.HttpServletResponse" %>
<% request.setCharacterEncoding("utf-8"); %>

<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>
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

String name = rs.getString("name");
String title = rs.getString("title");
String contents = rs.getString("contents").trim();
String writedate = rs.getString("writedate");
int readcount = rs.getInt("readcount");
String filename = rs.getString("filename");
%>

<center style="margin:30px"><font size='3'><b> 게시판 </b></font>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
    		<TD align='left'>
      		<font size='2'> 작성자 : <a href="email.jsp?num=<%=num %>"><%=name %></font>
    		</TD>
    		
    		<TD align=right>
      		<font size='2'>작성일: <%=writedate %>, 조회수: <%=readcount %></font>
    		</TD>
    	</TR>
    	
    	<TR>
    		<TD align=left>
      		<font size='2'>파일이름 :<a href="file_down.jsp?num=<%=num %>"> <%=filename %></font>
    		</TD>
    	</TR>
</TABLE>

<TABLE border='0' cellspacing=3 cellpadding=3 width='600'>
	<TR bgcolor='cccccc'>
		<TD align='center'>
    		<font size='3'><b><%=title %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' cellspacing=5 cellpadding=10 width='600'>
	<TR>
		<TD align=center>
			<img src=<%="./filestorage/" + filename %> width='512' height='384'>
		</TD>
	</TR>
	<TR>
		<TD><font size='2' color='' left=30><%=contents %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
    		<TD align='right'>
		<font size='2'><br><font size='2'></font>
    		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
  	<TR>
  		<TD><hr size='1' noshade>
  		</TD>
  	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
		<TD align='left'>
			<a href="modify_pass.jsp?num=<%=num %>">[수정하기]</a>
			<a href="delete_pass.jsp?num=<%=num %>">[삭제하기]</a>
		</TD>
		
		<TD align='right'>
			<a href="reply.jsp?num=<%=num %>">[답변하기]</a>
			<a href='write.jsp'>[글쓰기]</a>
			<a href='listboard.jsp'>[목록보기]</a>
 		</TD>
	</TR>
</TABLE>

<%
strSQL = "UPDATE tblboard SET readcount=readcount+1 WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));
pstmt.executeUpdate();

}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
}
%>
<FORM Name='Plus' Action='plus_input.jsp' Method='post'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
<input type='hidden' name='num' value='<%=num %>'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>작성자</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='12' name='plus_name' ></p>
		</TD>
	</TR>
	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>한줄댓글</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<input type='text' size='62' name='plus_contents' >
         		</font>
      		</TD>
      		<TD>
      			<input Type = 'Submit' Value = '댓글등록'>
      		</TD>
	</TR>
</TABLE>

<%
Statement stmt = conn.createStatement();
String strSQL = "SELECT * FROM tblplus WHERE id = " + num;
rs = stmt.executeQuery(strSQL); 

while(rs.next()){ 
%>
<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
	<TR bgcolor='cccccc'>     
		 <TD>
		 <font size=2 color='black'>
		 	<b><%=rs.getString("name")%> :</b>
		 	<%=rs.getString("contents")%> 
		 	(<%=rs.getString("writedate")%>)
		 </font>
		 </TD>          
	</TR> 
</TABLE>   	
<%     
}
rs.close();
pstmt.close();
conn.close();
%>
</FORM>
</TABLE>
</BODY>
</HTML>
