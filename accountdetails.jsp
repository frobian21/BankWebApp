<html>
<%@ page import="java.sql.*"%>
<%
//INSERT INTO transactions VALUES ('cf001',10,current_time,'w')
//INSERT INTO transactions VALUES ('cf001',10,current_timestamp,'w')
	out.println("<b>Account number "+session.getAttribute("username")+"</b>");
	if((Integer) session.getAttribute("role")==2||session.getAttribute("username").equals(request.getParameter("accno"))){
	try{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankwebapp?serverTimezone=BST", "root", "");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from transactions where accno='"+request.getParameter("accno")+"'");
		out.println("<table border='1'><tr><td><b>amount</b></td><td><b>type</b></td><td><center><b>date</b><center></td></tr>");
	while(rs.next()){
		out.println("<tr><td>"+rs.getString(2)+"</td>");
		out.println("<td><center>"+rs.getString(4)+"</center></td>");
		out.println("<td>"+rs.getString(3)+"</td></tr>");
	}
	out.println("</table>");
		rs = st.executeQuery("SELECT (select ifnull(sum(amount),0) as sum from transactions where accno='"+request.getParameter("accno")+"' and type ='d') -(select ifnull(sum(amount),0) as sum from transactions where accno='"+request.getParameter("accno")+"' and type ='w') as result");
		rs.next();
	out.println("<b>Current Balance: "+rs.getInt(1)+"</b>");
	
	} catch (Exception E) {
		out.println(E.toString());
	}

}else out.println("You do not have the permission to be here");
%>
</html>