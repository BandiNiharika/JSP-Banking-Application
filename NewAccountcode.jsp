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
String Confirm_password=request.getParameter("psw");
Double Amount=Double.parseDouble(request.getParameter("amt"));
String Address=request.getParameter("addr");
Long Mobileno=Long.parseLong(request.getParameter("mno"));
if(Password.equals(Confirm_password))
{
	Password=Confirm_password;
}
else
{
	out.println("please enter valid values");
}
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","niharika","niharika");
	PreparedStatement ps=con.prepareStatement("insert into sdfcbank values(?,?,?,?,?,?)");
	ps.setLong(1,AccountNumber);
	ps.setString(2,Name);
	ps.setString(3,Password);
	ps.setDouble(4,Amount);
	ps.setString(5,Address);
	ps.setLong(6,Mobileno);
	 
	int i=ps.executeUpdate();
	out.print(i+"record inserted succesfully");
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>

</body>
</html>