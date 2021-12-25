<%@page contentType = "text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="javax.mail.PasswordAuthentication" %>
<%@ page import="java.util.Properties" %>
<% request.setCharacterEncoding("utf-8"); %>

<% 
String from   = request.getParameter("fromemail");  
String to   = request.getParameter("toemail"); 
String title  = request.getParameter("title");
String contents  = request.getParameter("contents");

String host = "mail.knu.ac.kr";//smtp 서버
Properties props = new Properties();
props.put("mail.smtp.user", "carstarjun@gmail.com");
props.put("mail.smtp.host", "smtp.gmail.com");

props.put("mail.smtp.port","465");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.debug", "true");

props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");

try {
Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
	protected PasswordAuthentication getPasswordAuthentication()
	{ return new PasswordAuthentication("carstarjun@gmail.com", "zkrntmrmf4513"); } 
});

mailSession.setDebug(true);
Message message = new MimeMessage(mailSession);

message.setFrom(new InternetAddress(from));

message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
message.setSubject(title);
message.setContent(contents, "text/html;charset=utf-8");
Transport.send(message);
}catch (MessagingException e) {
out.println("mail send error : " + e.toString());
}catch(Exception err){
out.println("error : " + err.toString());
}

response.sendRedirect("listboard.jsp"); 
%>