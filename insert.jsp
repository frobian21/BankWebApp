<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%
	String password = request.getParameter("password");
	String accno = request.getParameter("accno");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	try {
		st.executeUpdate("update accounts set name='"+name+"', address='"+address+"' where accno='"+accno+"'");
		st.executeUpdate("update users set password='"+password+"' where accno='"+accno+"'");
	} catch (Exception E) {
		out.println(E.toString());
	}
	response.sendRedirect("admin.jsp");
%>