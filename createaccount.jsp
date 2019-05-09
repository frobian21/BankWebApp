<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%
	//Check session has username name address- if not then dont allow page to be visible.
	//Delete attributes from session afterwards. Redirect to login page.
	String password = request.getParameter("password");
	String accno = (String) session.getAttribute("username");
	String name = (String) session.getAttribute("name");
	String address = (String) session.getAttribute("address");
	try {
		st.executeUpdate("insert into accounts values ('" + accno + "','"+ name + "','"+ address +"')");
		st.executeUpdate("insert into users values ('" + accno + "','"+ password + "',1,1)");
	} catch (Exception E) {
		out.println(E.toString());
	}
	response.sendRedirect("home.jsp");
%>
