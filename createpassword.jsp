<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<script>
	function checkform(){
		var ref1 = window.document.getElementById("p1");
		var check = true;
		if(window.document.forms[0].elements[1].value==""||window.document.forms[0].elements[0].value==""){
			ref1.style.visibility="visible";
			ref1.innerHTML="password is missing";
			check = false;
			window.document.forms[0].elements[1].focus();
		}
		else{
			ref1.style.visibility="hidden";
		}
		if(!window.document.forms[0].elements[0].value.equals(window.document.forms[0].elements[1].value)){
			check = false;
			ref1.innerHTML="passwords must match";
		}
	}
</script>
<head>
	<title>Login</title>
</head><body><h4>
	<%
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String acctype = request.getParameter("accounttype");
		String gender = request.getParameter("gender");

		String myString="";
		try {
			ResultSet rs = st.executeQuery("select ifnull(lpad(maxed,3,0),'001') from (select max(substr(accno,3,3))+1 As MAXED from accounts where accno like '"+acctype+"%') as T");
			if(rs.next()){
				myString = rs.getString(1);
			}
			session.setAttribute("username",acctype + gender + myString);
			session.setAttribute("name",name);
			session.setAttribute("address",address);
			out.println("<form action=\"http://localhost:8080/JSPfiles/BankApp/createaccount.jsp\" onsubmit=\"return checkform()\" method=\"post\" style=\"border: thin black solid; position: absolute; top:25%; left:50%; transform:translate(-50%,-50%); padding:10;\" align=\"right\">");
			out.println("Password <input type=\"Password\" name=\"password\" style=\"border: thin black solid\"><br>");
			out.println("Re-write password <input type=\"Password\" name=\"password\" style=\"border: thin black solid\"><br><span id =\"p1\" style=\"color:red; visibility:hidden;font-size:small\"></span><br>");
			out.println("<input type=\"submit\" style=\"float: right\"></form></h4></div>");


				
		} catch (Exception E) {
			out.println(E.toString());
		}
	%></body>
</html>