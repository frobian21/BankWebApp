<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%@ include file="header.jsp"%>
<div w3-include-html="header.jsp">
<body><h4><form action="http://localhost:8080/JSPfiles/BankApp/insert.jsp" onsubmit="return checkform()" method="post" style="border: thin black solid; position: absolute; top:10%; left:50%; transform:translate(-50%,-50%); padding:10; background-color: lightblue" align="left">
<center>
<%
ResultSet rs = st.executeQuery("select name, address from accounts where accno='"+request.getParameter("accno")+"'");
rs.next();
String accno = request.getParameter("accno");
String name = rs.getString(1);
String address = rs.getString(2);
%>
<input type="hidden" value="<%=(String) accno%>" name="accno" />
Name <input required name="name" style="border: thin black solid; background-color: aqua" value="<%=(String) name%>"><br>
Address <input required name="address" style="border: thin black solid; background-color: aqua" value="<%=(String) address%>"><br>
<%
rs = st.executeQuery("select password from users where accno='"+request.getParameter("accno")+"'");
rs.next();
String password = rs.getString(1);
%>
Password <input required type="password" name="password" style="border: thin black solid; background-color: aqua" value="<%=(String) password%>"><br>
<input type="submit" value="Edit account" style="float: right; border: thin black solid; background-color: aqua">
</center>
</form>
</h4>
</body>
</html>