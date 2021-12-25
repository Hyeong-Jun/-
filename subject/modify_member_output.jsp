<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
int num = Integer.parseInt(request.getParameter("num"));
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
Connection conn = DriverManager.getConnection(url, "Member", "apple");

PreparedStatement pstmt = null;

pstmt = conn
		.prepareStatement("UPDATE tblmember SET id=?, pwd=?, name=?, age=?, email=?, phone=? WHERE num=?");
pstmt.setString(1, id);
pstmt.setString(2, pwd);
pstmt.setString(3, name);
pstmt.setInt(4, 0);
pstmt.setString(5, email);
pstmt.setString(6, phone);
pstmt.setInt(7, num);
pstmt.executeUpdate();

pstmt.close();
conn.close();

response.sendRedirect("memberboard.jsp");
%>