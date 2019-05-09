<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%@ include file="header.jsp"%>

<div w3-include-html="header.jsp">
<body><h4><form action="http://localhost:8080/JSPfiles/BankApp/createpassword.jsp" onsubmit="return checkform()" method="post" style="border: thin black solid; position: absolute; top:25%; left:50%; transform:translate(-50%,-50%); padding:10;" align="left">
<center>
<%
ResultSet rs = st.executeQuery("select name, address from accounts where accno='"+request.getParameter("accno")+"'");
rs.next();
String name = rs.getString(1);
String address = rs.getString(2);
%>
Name <input name="name" style="border: thin black solid;" value="<%=(String) name%>"><br>
Address <input name="address" style="border: thin black solid" value="<%=(String) address%>"><br>
<%
rs = st.executeQuery("select password from users where accno='"+request.getParameter("accno")+"'");
rs.next();
String pass = rs.getString(1);
%>
Password <input type="password" name="password" style="border: thin black solid;" value="<%=(String) pass%>"><br>
<input type="submit" value="Edit account" style="float: right">
</form>
</h4>

</body>
</html>