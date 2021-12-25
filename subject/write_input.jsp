<%@page contentType="text/html; charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*, java.io.*" %>

<%
String realFolder = "";
String saveFolder = "C:/jspapp/Hellonew/WebContent/subject/filestorage";
String encType = "utf-8";

int sizeLimit = 10 * 1024 * 1024;
ServletContext context = getServletContext();

MultipartRequest multi = null;
multi = new MultipartRequest(request, saveFolder,sizeLimit,encType,new DefaultFileRenamePolicy());

String fileName = multi.getFilesystemName("userFile");
String originFileName = multi.getOriginalFileName("userFile");

File file = multi.getFile("userFile");


String name   = multi.getParameter("name");  
String pass   = multi.getParameter("pass"); 
String email  = multi.getParameter("email");
String title  = multi.getParameter("title");
String contents  = multi.getParameter("contents");


Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
Connection conn = DriverManager.getConnection(url,"Member","apple");

Statement stmt = conn.createStatement();
	
	
Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

String strSQL = "SELECT Max(num) FROM tblboard";
ResultSet rs = stmt.executeQuery(strSQL);

int num = 1;
while(rs.next()) {
	rs.getInt(1);
		if (!rs.wasNull()){
			strSQL = "SELECT Max(num) FROM tblboard";
			rs = stmt.executeQuery(strSQL);
			rs.next();
			num = rs.getInt(1) + 1;
		}
		else {
			num = 1;
		}
}
	
strSQL ="INSERT INTO tblboard (num, name, pass, email, title, contents, writedate, readcount, filename)";
strSQL = strSQL +  "VALUES('" + num + "', '" + name + "', '" + pass + "', '" + email + "',";
strSQL = strSQL +  "'" + title + "', '" + contents + "', '" + indate + "', ' 0 ', '" + fileName + "')";
stmt.executeUpdate(strSQL);

stmt.close();                	
conn.close();

response.sendRedirect("listboard.jsp"); 
%>
