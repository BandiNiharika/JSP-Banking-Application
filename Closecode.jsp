<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
Long AccountNumber=Long.parseLong(request.getParameter("accno"));
String Name=request.getParameter("name");
String Password=request.getParameter("psw");
String status="inactive";
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","niharika","niharika");
	PreparedStatement ps=con.prepareStatement("update sdfcbank set status=? where AccountNumber=? and Name=? and Password=?");
	ps.setString(1,status);
	ps.setLong(2,AccountNumber);
	ps.setString(3,Name);
	ps.setString(4,Password);
	int i=ps.executeUpdate();
	if(i==1)
		out.println("welcome "+Name+" your accountno "+AccountNumber+" has closed");
	else
		out.println("please enter valid account details");
}
catch(Exception e)
{
	out.println(e);
}
%>

</body>
</html>