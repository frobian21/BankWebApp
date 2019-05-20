<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="footer.jsp"%>
<head>
	<title>Home</title>
</head>
<!--<input type="button" onclick="location.href='http://localhost:8080/JSPfiles/BankApp/accountdetails.jsp?accno=<%=(String)session.getAttribute("username") %>';" value="Transactions">-->

<!-- <div w3-include-html="content.html"> -->
<body>
	<div w3-include-html="header.jsp">
	<div style="border: thin black solid; position: absolute; top:25%; left:50%; transform: translate(-50%,-50%);padding: 10;padding-bottom:0;background-color: lightblue; min-height:240px;min-width:300">
		<%
		try{
			if(null==session.getAttribute("role")){session.setAttribute("role",0);}
		}catch(Exception e){
			out.println(e.toString());
		}
		if((Integer) session.getAttribute("role")==2||session.getAttribute("username").equals(request.getParameter("accno"))){
			String name;
			String address;

			try{
			ResultSet rs;

			if((Integer) session.getAttribute("role")==2){
				rs = st.executeQuery("select * from accounts where accno='"+request.getParameter("accno")+"'");
				rs.next();
				name=rs.getString(2);
				address=rs.getString(3);
			}else{
				name=(String)session.getAttribute("name");
				address=(String)session.getAttribute("address");
			}

			out.println("<div style=\"float:left;padding:5; border: thin black solid;background-color:aqua\"><b>Account Number </b>"+(String)request.getParameter("accno")+"<br>\n<b>Name </b>"+name+"<br>\n<b>Address<br></b>"+address+"\n</div>");
			
			if((Integer) session.getAttribute("role")==1){
				out.println("<div style=\"float:right; margin-left:20; padding:5; border: thin black solid; background-color:aqua;\">\n<b>Actions</b></br>\n<input type=\"button\" style=\"color: black; background-color:lightblue; border:thin black solid;\" onclick=\"location.href='http://localhost:8080/JSPfiles/BankApp/transactions.jsp?accno="+session.getAttribute("username")+"';\" value=\"Deposit\"><br>\n<input type=\"button\" style=\"color: black; background-color:lightblue; border:thin black solid;\" onclick=\"location.href='http://localhost:8080/JSPfiles/BankApp/transactions.jsp?accno="+session.getAttribute("username")+"';\" value=\"Withdraw\"><br>\n</div>");

				}
			out.println("<div style=\"overflow:auto;height:140; border: thin black solid; background-color:aqua; position:absolute; top:100;\">");
	
	//INSERT INTO transactions VALUES ('cf001',10,current_time,'w')
	//INSERT INTO transactions VALUES ('cf001',10,current_timestamp,'w')

			
			rs = st.executeQuery("select * from transactions where accno='"+request.getParameter("accno")+"'");
			out.println("<table border='1'><tr><td><b>amount</b></td><td><b>type</b></td><td><center><b>date</b></center></td></tr>");
			while(rs.next()){
				out.println("<tr><td>"+rs.getString(2)+"</td>");
				out.println("<td><center>"+rs.getString(4)+"</center></td>");
				out.println("<td>"+rs.getString(3)+"</td></tr>");
			}
			out.println("</table>");
			rs = st.executeQuery("SELECT (select ifnull(sum(amount),0) as sum from transactions where accno='"+request.getParameter("accno")+"' and type ='d') -(select ifnull(sum(amount),0) as sum from transactions where accno='"+request.getParameter("accno")+"' and type ='w') as result");
			rs.next();
			out.println("<b>Current Balance: "+rs.getInt(1)+"</b></div>");
		
		} catch (Exception E) {
			out.println(E.toString());
		}

	}else {out.println("You do not have the permission to be here");}
%>
		</div> 
	</div>
</body>

</html>