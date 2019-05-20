<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriverFile.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="footer.jsp"%>
<script>
	function checkform(){
		let ref1 = window.document.getElementById("p1");
		let check = true;
		ref1.innerHTML="";
		if(document.getElementById("deposit").checked == false && document.getElementById("withdraw").checked == false){
			ref1.innerHTML="Transaction type is unchosen<br>";
			check = false;
		}
		if(window.document.forms[0].elements[2].value==""||window.document.forms[0].elements[2].value=="0"){
			ref1.innerHTML+="Amount is missing";
			check = false;
			window.document.forms[0].elements[2].focus();
		}
		if(document.getElementById("withdraw").checked==true){
			if(window.document.forms[0].elements[2].value>parseInt(document.getElementById("bal").innerHTML)) {
				ref1.innerHTML="Insufficient funds";
				check = false;
				window.document.forms[0].elements[2].focus();
			}
		}
		return check;
	}
	function newBalance(){
		if(document.getElementById("deposit").checked==true){
			document.getElementById("newbal").innerHTML=parseInt(document.getElementById("bal").innerHTML)+parseInt(window.document.forms[0].elements[2].value);
		}
		if(document.getElementById("withdraw").checked==true){
			document.getElementById("newbal").innerHTML=parseInt(document.getElementById("bal").innerHTML)-parseInt(window.document.forms[0].elements[2].value);
		}
	}
</script>
<body>
<div w3-include-html="header.jsp">
<h4>
<%
//INSERT INTO transactions VALUES ('cf001',10,current_time,'w')
//INSERT INTO transactions VALUES ('cf001',10,current_timestamp,'w')
	if(!session.getAttribute("username").equals(request.getParameter("accno")))
	out.println("You do not have the permission to be here");
%>
	<form action="http://localhost:8080/JSPfiles/BankApp/inserttransac.jsp" onsubmit="return checkform()" method="post" style="border: thin black solid; position: absolute; top:25%; left:50%; transform:translate(-50%,-50%); padding:10;background-color: lightblue;" <%= session.getAttribute("username").equals(request.getParameter("accno")) ? "visible" : "hidden" %> align="left">
	<center>
	Deposit <input type="radio" onclick="newBalance()" name="transactype" id="deposit" value="d">
	Withdraw <input type="radio" onclick="newBalance()" name="transactype" id="withdraw" value="w"><br>
	Amount <input type ="number" min="0" name="amount" oninput="newBalance()" value=0 style="border: thin black solid; background-color: aqua"><br>
	<b><span id="p1" style="font-size: small;color: red"></span><br>
	Current Balance: <span id="bal"><%
	int balance=0;
		try{
			ResultSet rs = st.executeQuery("SELECT (select ifnull(sum(amount),0) as sum from transactions where accno='"+request.getParameter("accno")+"' and type ='d') -(select ifnull(sum(amount),0) as sum from transactions where accno='"+request.getParameter("accno")+"' and type ='w') as result");
			rs.next();
			balance=rs.getInt(1);
			out.print(balance);
		} catch (Exception E) {
			out.println(E.toString());
		}
	%></span><br>
	New Balance: <span id="newbal"></span></b><br><input type="submit" style="border: thin black solid; background-color: aqua"></form>

</h4>

</body>
</html>