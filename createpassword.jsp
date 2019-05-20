<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<script>
	function checkform(){
		let passwordError = window.document.getElementById("passwordError");
		if(window.document.getElementById("password1").value==""||window.document.getElementById("password2").value==""){
			passwordError.style.visibility="visible";
			passwordError.innerHTML="password is missing";
			window.document.getElementById("password1").focus();
			return false;
		}
		else{
			passwordError.style.visibility="hidden";
		}
		if(window.document.getElementById("password1").value!==(window.document.getElementById("password2").value)){
			passwordError.style.visibility="visible";
			passwordError.innerHTML="passwords must match";
			window.document.getElementById("password1").value="";
			window.document.getElementById("password2").value="";
			window.document.getElementById("password1").focus();
			return false;
		}
		return true;
	}
</script>
<head>
	<title>Login</title>
</head><body><h4>
	<%
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String acctype = request.getParameter("accountType");
		String gender = request.getParameter("gender");

		String myString="";
		try {
			ResultSet rs = st.executeQuery("select ifnull(lpad(maxed,3,0),'001') from (select max(substr(accno,3,3))+1 As MAXED from accounts where accno like '"+acctype+"%') as T");
			rs.next();
			session.setAttribute("username",acctype + gender +  rs.getString(1));
			session.setAttribute("name",name);
			session.setAttribute("address",address);
			session.setAttribute("role",1);
		} catch (Exception E) {
			out.println(E.toString());
		}
	%>
	<form action="http://localhost:8080/JSPfiles/BankApp/createaccount.jsp" onsubmit="return checkform()" method="post" style="border: thin black solid; position: absolute; top:10%; left:50%; transform:translate(-50%,-50%); padding:10; min-width: 315px; background-color: lightblue" align="right">
	Password <input type="Password" id="password1" style="border: thin black solid; background-color: aqua"><br>
	Re-write password <input type="Password" id="password2" style="border: thin black solid; background-color: aqua"><br><span id ="passwordError" style="color:red; visibility:hidden;font-size:small"></span>
	<input type="submit" style="float: right; border: thin black solid; background-color: aqua"></form></h4>
	</body>
</html>