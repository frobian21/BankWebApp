<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%
try{
	st.executeUpdate("delete from users where accno='"+request.getParameter("accno")+"'");
	st.executeUpdate("delete from accounts where accno='"+request.getParameter("accno")+"'");
	st.executeUpdate("delete from transactions where accno='"+request.getParameter("accno")+"'");
}catch(Exception E){;}
response.sendRedirect("http://localhost:8080/JSPfiles/BankApp/admin.jsp");
%>