<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="Heading.css">
<center>
<body>
<h1>SDFC BACK</h1>

       <h4>EXTRAODINARY SERVICES</h4>
  <a href="Home.jsp">Home</a>&nbsp;&nbsp;
  <a href="NewAccount.jsp">New Account</a>&nbsp;&nbsp;
  <a href="Balance.jsp">Balance</a>&nbsp;&nbsp;
  <a href="Deposite.jsp">Deposite</a>&nbsp;&nbsp;
  <a href="Withdraw.jsp">withdraw</a>&nbsp;&nbsp;
  <a href="Transfer.jsp">Transfer</a>&nbsp;&nbsp;
  <a href="Close.jsp">Close A/c</a>&nbsp;&nbsp;
  <a href="AboutUs.jsp">AboutUs</a>&nbsp;&nbsp;


<h1>Open Account Form</h1>
<form action="NewAccountcode.jsp">
AccountNumber:<input type="number" name="accno"><p></p>
Name:<input type="text" name="name"><p></p>
Password:<input type="password" name="psw"><p></p>
Confirm_password:<input type="password" name="psw"><p></p>
Amount:<input type="number" name="amt"><p></p>
Address:<input type="text" name="addr"><p></p>
Mobileno:<input type="mobileno" name="mno"><p></p>
           <input type="submit"  value="submit">
           <input type="submit" value="clear">
  </form>


</body>
</center>
</html>