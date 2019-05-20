<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="footer.jsp"%>
<head>
	<title>Home</title>
</head>
<body>
	<div w3-include-html="header.jsp"></div> 
	<div style="border: thin black solid; position: absolute; top:25%; left:50%; transform: translate(-50%,-50%);padding: 10;padding-bottom:0;background-color: lightblue; min-height:240px;min-width:300">
<%
try{
	if(null==session.getAttribute("role")){session.setAttribute("role",0);}
} catch(Exception e){
	out.println(e.toString());
}
if((Integer) session.getAttribute("role")==2||session.getAttribute("username").equals(request.getParameter("accno"))){
	String name;
	String address;

	try{
		ResultSet rs;
		Statement st2 = con.createStatement();
		ResultSet rs2;
		if((Integer) session.getAttribute("role")==2){
			rs = st.executeQuery("select * from accounts where accno='"+request.getParameter("accno")+"'");
			rs.next();
			name=rs.getString(2);
			address=rs.getString(3);
		}else{
			name=(String)session.getAttribute("name");
			address=(String)session.getAttribute("address");
		}
%>

	<div style="float:left;padding:5; border: thin black solid;background-color:aqua">
		<b>Account Number </b><%=(String)request.getParameter("accno")%><br>
		<b>Name </b><%=name%><br><b>Address<br></b><%=address%></div>
	
		<div style="float:right; margin-left:20; padding:5; border: thin black solid; background-color:aqua;"  <%= (Integer)session.getAttribute("role")==1 ? "visible" : "hidden" %>>
			<b>Actions</b></br>
			<input type="button" style="color: black; background-color:lightblue; border:thin black solid;" onclick="location.href='http://localhost:8080/JSPfiles/BankApp/transactions.jsp?accno=<%=session.getAttribute("username")%>';" value="Deposit"><br>
			<input type="button" style="color: black; background-color:lightblue; border:thin black solid;" onclick="location.href='http://localhost:8080/JSPfiles/BankApp/transactions.jsp?accno=<%=session.getAttribute("username")%>';" value="Withdraw"><br>
		</div>
	<div style="overflow:auto;height:140; border: thin black solid; background-color:aqua; position:absolute; top:100;">
	<table border='1'><tr><td><b>amount</b></td><td><b>type</b></td><td><center><b>date</b></center></td></tr>
<%
		rs = st.executeQuery("select * from transactions where accno='"+request.getParameter("accno")+"'");
		while(rs.next()){
		%>
			<tr><td><%=rs.getString(2)%></td>
			<td><center><%=rs.getString(4)%></center></td>
			<td><%=rs.getString(3)%></td></tr>
		<%
		}
		rs2 = st2.executeQuery("SELECT (select ifnull(sum(amount),0) as sum from transactions where accno='"+request.getParameter("accno")+"' and type ='d') -(select ifnull(sum(amount),0) as sum from transactions where accno='"+request.getParameter("accno")+"' and type ='w') as result");
		rs2.next();
		%>
		</table>
		<b>Current Balance: <%=rs2.getInt(1)%></b></div>
		<%
	} catch (Exception E) {
		out.println(E.toString());
	}

}else {out.println("You do not have the permission to be here");}
%>
	</div>
</body>

</html>