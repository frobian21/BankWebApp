<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%@ include file="header.jsp"%>

<div w3-include-html="header.jsp">
<%
	if((Integer) session.getAttribute("role")==2){
	String active ="error";
	Statement st2 = con.createStatement();
	ResultSet rs2;
	int sno=1;
	try{
		ResultSet rs = st.executeQuery("select * from accounts");
		out.println("<table border='1'><tr><td>s.no</td><td>accno</td><td>name</td><td>operations</td></tr>");
	while(rs.next()){
		out.println("<tr><td>"+(sno++)+"</td>");
		out.println("<td><a href='http://localhost:8080/JSPfiles/BankApp/home.jsp?accno="+rs.getString(1)+"'>"+rs.getString(1)+"</a></td>");
		out.println("<td><a href='http://localhost:8080/JSPfiles/BankApp/home.jsp?accno="+rs.getString(1)+"'>"+rs.getString(2)+"</a></td>");
		rs2 = st2.executeQuery("select active from users where accno='"+rs.getString(1)+"'");
		rs2.next();
		if(rs2.getInt(1)==1) active="block";
		if(rs2.getInt(1)==0) active="unblock";
		out.println("<td><a href='http://localhost:8080/JSPfiles/BankApp/edit.jsp?accno="+rs.getString(1)+"'>edit</a> ");
		out.println("<a href='http://localhost:8080/JSPfiles/BankApp/block.jsp?accno="+rs.getString(1)+"'>"+active+"</a> ");
		out.println("<a href='http://localhost:8080/JSPfiles/BankApp/delete.jsp?accno="+rs.getString(1)+"'>delete</a></td>");
	}
	out.println("</table>");
	} catch (Exception E) {
		out.println(E.toString());
	}

}else out.println("You do not have the permission to be here");
%>
</html>