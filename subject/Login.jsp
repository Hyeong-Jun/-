<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<script>
	function Check() {
		if (Write.id.value.length < 1) {
			alert("id를 입력하세요.");
			Write.id.focus();
			return false;
		}

		if (Write.pwd.value.length < 1) {
			alert("비밀번호를 입력하세요.");
			Write.pwd.focus();
			return false;
		}
		return true;
	}
	function goMemberRegister() {
		location.href = "MemberRegister.jsp"
	}
</script>
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
		<ul class="navbar_log">
			<li><a href="Login.jsp">로그인</a></li>
			<li><a href="MemberRegister.jsp">회원가입</a></li>
		</ul>
	</header>
	
<center style="margin:30px">
	<Form Action="LoginCheck.jsp" Method="post" onsubmit="return Check()">
		<table>
			<tr>
				<td>ID</td>
				<td colspan="2"><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td colspan="2"><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인"></td>
				<td><input type="Reset" value="다시"></td>
				<td style="text-align: center"><input type="button"
					value="회원가입" onclick="goMemberRegister()"></td>
			</tr>
		</table>
	</Form>
</center>
</body>
</html>