<%@ page import="java.sql.*"%>
<%
	Connection con=null;
	Statement st=null;
	try{
	con = DriverManager.getConnection("jdbc:mysql://localhost/bankwebapp?serverTimezone=BST", "root", "");
	st = con.createStatement();
	}
	catch(Exception e){out.println(e.toString());}
%>