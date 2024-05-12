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
Double balance=Double.parseDouble(request.getParameter("balance"));
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","niharika","niharika");
	PreparedStatement ps1=con.prepareStatement("select * from sdfcbank  where Name=? and Password=? and AccountNumber=?");
	ps1.setString(1,Name);
	ps1.setString(2,Password);
	ps1.setLong(3,AccountNumber);
	ResultSet rs=ps1.executeQuery();
	Double  bal=0.0,Amount=0.0;
	String status=null;
	if(rs.next())
	{
	     bal= rs.getDouble(4);
	     status=rs.getString(7);
	}
	     if(status!=null && status.equals("active"))
	     {
	   Amount=bal+balance;
		PreparedStatement ps2=con.prepareStatement("update sdfcbank set  Amount=? where AccountNumber=?");
		ps2.setDouble(1, Amount);
		ps2.setLong(2, AccountNumber);
		int rowsAffected = ps2.executeUpdate();
		out.println("<table border='4'>");
		out.println("<tr>");
		out.println("<td>Before deposit,account balance is : "+"<td>"+bal);
		out.println("<tr>");
		out.println("<td>Deposited Amount is : "+"<td>"+balance);
		out.println("<tr>");
		out.println("<td>After deposit,account balance is : "+"<td>"+Amount);
		out.println("</table>");
	}

else
{
	out.println("enter the valid account details");
}

		con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>

</body>
</html>