<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%@ include file="header.jsp"%>
<script>
	function checkform(){
		let ref1 = window.document.getElementById("p1");
		let ref2 = window.document.getElementById("p2");
		let check = true;
		if(window.document.forms[0].elements[0].value==""){
			ref1.style.visibility="visible";
			ref1.innerHTML="Name is missing";
			check = false;
			window.document.forms[0].elements[0].focus();
		}
		else{
			ref1.style.visibility="hidden";
		}
		if(window.document.forms[0].elements[1].value==""){
			ref2.style.visibility="visible";
			ref2.innerHTML="Address is missing";
			check = false;
			window.document.forms[0].elements[1].focus();
		}
		else{
			ref2.style.visibility="hidden";
		}
		if(window.document.forms[0].elements[2].value==""){
			ref2.style.visibility="visible";
			ref2.innerHTML="Password is missing";
			check = false;
			window.document.forms[0].elements[2].focus();
		}
		else{
			ref2.style.visibility="hidden";
		}
		return check;
	}
</script>
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
Name <input name="name" style="border: thin black solid; background-color: aqua" value="<%=(String) name%>"><br>
Address <input name="address" style="border: thin black solid; background-color: aqua" value="<%=(String) address%>"><br>
<%
rs = st.executeQuery("select password from users where accno='"+request.getParameter("accno")+"'");
rs.next();
String pass = rs.getString(1);
%>
Password <input type="password" name="password" style="border: thin black solid; background-color: aqua" value="<%=(String) pass%>"><br>
<input type="submit" value="Edit account" style="float: right; border: thin black solid; background-color: aqua">
</form>
</h4>

</body>
</html>