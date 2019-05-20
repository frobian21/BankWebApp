<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="footer.jsp"%>
<body>
<div w3-include-html="header.jsp">
<div style="border: thin black solid; position: absolute; top:25%; left:50%; transform: translate(-50%,-50%);padding: 10;background-color: lightblue"><center>
<%
	String transac = request.getParameter("transactype");
	String amount = request.getParameter("amount");
	String accno = (String) session.getAttribute("username");
	try{
		st.executeUpdate("insert into transactions values('"+accno+"', "+amount+", current_time, '"+transac+"')");
		out.print("Succesful transaction.<br><a href='http://localhost:8080/JSPfiles/BankApp/home.jsp?accno="+accno+"'>Home</a>");
	} catch (Exception E) {
		out.println(E.toString());
	}
%>
</div>
</body>
</html>