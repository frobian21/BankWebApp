<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%
try{
	ResultSet rs = st.executeQuery("select active from users where accno='"+request.getParameter("accno")+"'");
	rs.next();
	if(rs.getInt(1)==1){
		st.executeUpdate("update users set active=0 where accno='"+request.getParameter("accno")+"'");
	}else{
	st.executeUpdate("update users set active=1 where accno='"+request.getParameter("accno")+"'");
	}
}catch(Exception E){;}
response.sendRedirect("http://localhost:8080/JSPfiles/BankApp/admin.jsp");
%>