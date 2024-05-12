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
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","niharika","niharika");
	PreparedStatement ps=con.prepareStatement("select * from sdfcbank where AccountNumber=?");
	ps.setLong(1,AccountNumber);
	ResultSet rs=ps.executeQuery();
	String status=null;
	if(rs.next())
	 status=rs.getString(7);
	if(status.equals("active"))
	{
	PreparedStatement ps1=con.prepareStatement("select AccountNumber,Name,Amount,Adress,Mobileno from sdfcbank where Name=? and AccountNumber=?");
	ps1.setString(1,Name);
	ps1.setLong(2,AccountNumber);
	ResultSet rs1=ps1.executeQuery();
	ResultSetMetaData rsmd=rs1.getMetaData();
	  out.println("<table border='1'>");
	  int n=rsmd.getColumnCount();
	  for(int i=1;i<=n;i++)
	  {
		  out.println("<td><font color=bluesize=3>"+"<br>"+rsmd.getColumnName(i));
		  
	  }
	  out.println("<tr>");
	  while(rs1.next())
	  {
		  for(int i=1;i<=n;i++)
		  {  
			  out.println("<td><br>"+rs1.getString(i));
			  
		  }
		  out.println("<tr>");
	  }
	  out.println("</table>");
	}
	else
		out.println("please enter valid account details");
    con.close();
 
}
catch(Exception ex)
{
  out.print(ex);
}
%>
</body>
</html>


