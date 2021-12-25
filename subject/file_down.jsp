<%@ page contentType="application; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*"%>

<%
String num = request.getParameter("num"); 

Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
Connection conn = DriverManager.getConnection(url,"Member","apple");

Statement stmt = conn.createStatement();
	
ResultSet rs = stmt.executeQuery("SELECT filename FROM tblboard WHERE num =" + num);
rs.next();

String filename = rs.getString("filename");
String filename2 = new String(filename.getBytes("KSC5601"),"8859_1");
File file = new File("C:/jspapp/Hellonew/WebContent/subject/filestorage/"+filename);
byte b[] = new byte[(int)file.length()];
response.setHeader("Content-Disposition", "attachment;filename=" + filename2 + ";");
               
if (file.isFile())
{
	BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
	int read = 0;
	while ((read = fin.read(b)) != -1){
		outs.write(b,0,read);
	}
	outs.close();
	fin.close();
}
%>
