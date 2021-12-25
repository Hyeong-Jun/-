<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
int num   = Integer.parseInt(request.getParameter("num")); 
String name   = request.getParameter("name");  
String pass   = request.getParameter("pass"); 
String email  = request.getParameter("email");
String title  = request.getParameter("title");
String contents  = request.getParameter("contents");

Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
Connection conn = DriverManager.getConnection(url,"Member","apple");

PreparedStatement pstmt1 = null, pstmt2 = null;
	
	
Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

String strSQL = "UPDATE tblboard SET num = num + 1 WHERE num > " + num;
pstmt1 = conn.prepareStatement(strSQL);
pstmt1.executeUpdate();

String tstrSQL = "UPDATE tblboard SET num = num + 1 WHERE num = " + num;
pstmt1 = conn.prepareStatement(tstrSQL);
pstmt1.executeUpdate();
	
strSQL ="INSERT INTO tblboard(num, name, pass, email, title, contents, writedate, readcount)";
strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
pstmt2 = conn.prepareStatement(strSQL);
pstmt2.setInt(1, num);
pstmt2.setString(2, name);
pstmt2.setString(3, pass);
pstmt2.setString(4, email);
pstmt2.setString(5, title);
pstmt2.setString(6, contents);
pstmt2.setString(7, indate);
pstmt2.setInt(8, 0);
pstmt2.executeUpdate();

pstmt1.close();                	
pstmt2.close();
conn.close();

response.sendRedirect("listboard.jsp"); 
%>
