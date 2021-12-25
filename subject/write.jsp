<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*, java.io.*" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "javax.servlet.ServletException" %>
<%@ page import = "javax.servlet.http.HttpServlet" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.servlet.http.HttpServletResponse" %>
<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<SCRIPT language="JavaScript">
function Check()
{
if (Write.name.value.length < 1) {
	alert("작성자를 입력하세요.");
	Write.name.focus(); 
        return false;
	}

if (Write.pass.value.length < 1) {
	alert("비밀번호를 입력하세요.");
	Write.pass.focus(); 
	return false;
	}

if (Write.email.value.indexOf("@") + "" == "-1" ||
	Write.email.value.indexOf(".") + "" == "-1" ||
	Write.email.value == "" )
	{ 
		alert("E-mail을 입력하세요.");
		Write.email.focus();
		return false;
	}

if (Write.title.value.length < 1) {
	alert("글제목을 입력하세요.");
	Write.write_title.focus(); 
	return false;
        }

if (Write.contents.value.length < 1) {
	alert("글내용을 입력하세요.");
	Write.content.focus(); 
	return false;
        }

Write.submit();
}

</SCRIPT>
<link rel="stylesheet" href="main_css.css" />
</HEAD>
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
<BODY>

<center style="margin:30px"><font size='3'><b> 게시판 글쓰기 </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<FORM Name='Write' Action='write_input.jsp' Method='POST' Enctype='multipart/form-data' OnSubmit='return Check()'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>작성자</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='12' name='name' > * 필수</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>비밀번호</b></center></font>
		</TD>
		<TD>
			<p><input type='password' size='12' name='pass'> * 필수 (게시물 수정
						삭제시 필요합니다.)</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>E-mail</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='40' maxlength='50' name='email'></font>
		</TD>
	</TR>
	
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>파일</b></center></font>
		</TD>
		<TD>
			<font size='2'>
                           <input type="file" name="userFile">
                           </font>
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
			<font size='2'><input type='text' size='70' maxlength='50' name='title'></font>
		</TD>
	</TR>

	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>글 내용</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<textarea cols='70' rows='15' wrap='virtual' name='contents' ></textarea>
         		</font>
      		</TD>
	</TR>

	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='100' align='center'>
					<input Type = 'Reset' Value = '다시작성'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Submit' Value = '등록'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>

</FORM>

</BODY>
</HTML>