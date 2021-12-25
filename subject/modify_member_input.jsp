<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
String num = request.getParameter("num");
String pwd = request.getParameter("pwd");

Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
Connection conn = DriverManager.getConnection(url, "Member", "apple");

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT pwd FROM tblmember WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String goodpass = rs.getString("pwd").trim();
if (pwd.equals(goodpass)) {
	response.sendRedirect("modify_member.jsp?num=" + num);
} else {
	response.sendRedirect("modify_member_pwd.jsp?num=" + num);
}

rs.close();
pstmt.close();
conn.close();
%>
