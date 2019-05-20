<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<head>
	<title>Home</title>
</head>
<body>
	<div style="border: thin black solid; position: absolute; top:25%; left:50%; transform: translate(-50%,-50%); padding: 10; background-color: lightblue">
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			ResultSet rs = st.executeQuery("select * from users where accno = '" + username + "' and password = '"+ password +"'");
			if(rs.next()){
				if(rs.getInt(3)==2){
					session.setAttribute("username", username);
					session.setAttribute("role", 2);
					response.sendRedirect("admin.jsp");
				}else{
					if(rs.getInt(4)==0){
						out.println("<center>You are <b><u>dead</b></u>.<br>Your account has been blocked.<br>Please see admin.<br><a href='index.html'>Home</a>");
					}else{
						ResultSet rs2=st.executeQuery("select * from accounts where accno = '" + username + "'");
						rs2.next();
						session.setAttribute("username", username);
						session.setAttribute("role", 1);
						session.setAttribute("name", rs2.getString(2));
						session.setAttribute("address", rs2.getString(3));
						response.sendRedirect("home.jsp?accno="+username);
					}
				}
			}else{
				out.println("You do not exist.<br> <center><a href='login.html' style=\"border:thin black solid\">Sign-in</a>");
			}
		} catch (Exception E) {
			out.println(E.toString());
		}
	%>
	</div>
</body>

</html>