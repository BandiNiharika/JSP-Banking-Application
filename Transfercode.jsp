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
Long TargetAccountNo=Long.parseLong(request.getParameter("taccno"));
Double TargetAmount=Double.parseDouble(request.getParameter("tamt"));
try{

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","niharika","niharika");
	PreparedStatement ps1=con.prepareStatement("select * from sdfcbank  where AccountNumber=? and Name=? and Password=?");
	ps1.setLong(1, AccountNumber);
	ps1.setString(2,Name);
	ps1.setString(3,Password);
	ResultSet rs=ps1.executeQuery();
	Double sbal=0.0,Amount=0.0;
	String status1=null,status2=null;	 
	 if (rs.next()) {
		 
         sbal = rs.getDouble(4);
         status1=rs.getString(7); 
     if (sbal > TargetAmount) 
     {
    	 Amount = sbal- TargetAmount;
         PreparedStatement ps2 = con.prepareStatement("update sdfcbank SET Amount=? WHERE AccountNumber=? and Name=? and Password=?");
         ps2.setDouble(1, Amount);
         ps2.setLong(2, AccountNumber);
         ps2.setString(3,Name);
     	 ps2.setString(4,Password);
         int i= ps2.executeUpdate();
         Double sbalance=Amount;
     	 AccountNumber=TargetAccountNo;
         PreparedStatement ps3 = con.prepareStatement("select * from sdfcbank WHERE AccountNumber=?");
         ps3.setLong(1, AccountNumber);
         ResultSet rs1=ps3.executeQuery();
     	Double tbal=0.0;
     	if(rs1.next())
     	{
     		tbal=rs1.getDouble(4);
     		status2=rs.getString(7); 
     	}
     	if(status1!=null && status2!=null && status1.equals("active") && status2.equals("active"))
     	{
     	Amount=tbal+TargetAmount;
    	PreparedStatement ps4=con.prepareStatement("update sdfcbank set Amount=? where AccountNumber=?");
    	ps4.setDouble(1, Amount);
    	ps4.setLong(2, AccountNumber);
    	int j=ps4.executeUpdate();
	    out.println("<h3>Account Info</h3>");
	    out.println("<table border='2'>");
	    out.println("<tr>");
	    out.println("<td><font Color=blue size=3>sender account balance is : "+"<td font Color=blue size=3> "+sbal);
	    out.println("<tr>");
	    out.println("<td><font Color=blue size=3>Transfer amount is : "+"<td font Color=blue size=3>"+TargetAmount);
	    out.println("<tr>");
	    out.println("<td><font Color=blue size=3>Target account balance is : "+"<td font Color=blue size=3>"+tbal);
	    out.println("<tr>");
	    out.println("<td><font Color=blue size=3>After transfer,Target account balance is : "+"<td font Color=blue size=3>"+sbalance);
	    out.println("<tr>");
	    out.println("<td><font Color=blue size=3>After transfer,Sender account balance is : "+"<td font Color=blue size=3>"+Amount);
	}
     else
    	out.println("please enter valid receiver account details");
     }
     else
 		out.println("insufficent balance");
	 }
	 else
			out.println("please enter valid account details");
    
	con.close();
	
} catch (Exception ex) {
out.println(ex);
}
%>

</body>
</html>