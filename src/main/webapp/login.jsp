<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="style1.css" rel="stylesheet">
</head>
<body class="loginBody">


<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>



<%


String email = "",password="";
email = (String) request.getAttribute("userEmail");
password = (String) request.getAttribute("userPassword");
int flag = 1;


if(email!=null){

try {
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:8809/techblog","root","1234");
	String q = "select * from new_table";

	Statement pstm =  cn.createStatement();
	
	ResultSet set =  pstm.executeQuery(q);

	
	while(set.next()) {
	
		if(set.getString("userEmail").equals(email) && set.getString("userPassword").equals(password)){
		
		
			
			HttpSession httpses = request.getSession();
			httpses.setAttribute("currentUserId", set.getString("userId"));
			httpses.setAttribute("currentUserEmail", set.getString("userEmail"));
			httpses.setAttribute("currentUserName", set.getString("userName"));
			httpses.setAttribute("currentUserGender", set.getString("userGender"));
			httpses.setAttribute("currentUserPhoto", set.getString("userPhoto"));
			httpses.setAttribute("currentUserRegDate", set.getString("userRegDate"));
			
			
			RequestDispatcher rd;
			rd = request.getRequestDispatcher("Home.jsp");
			rd.forward(request, response);
			
		
			
		}
		
		else if(set.getString("userEmail").equals(email) && !set.getString("userPassword").equals(password)){
			 flag = 2;
		}
		else{
			
			flag = 3;
		}
		
		
	}
		
}





catch(Exception e) {
	
	//RequestDispatcher rd;
	//rd = request.getRequestDispatcher("error.jsp");
	//rd.forward(request, response);
	e.printStackTrace();
}

if(flag == 3){
		%>
		
		<h1>User Not Found! Please Register.</h1>
		
		<%
}

else if(flag == 2){
	
	%>
	<h1>Incorrect Password.</h1>
	<% 
	
}

}

%>


    <h1>Login:</h1>

<div class="container"> 

<form action="Login" class="loginForm" method="post">

Email:<input type="email" class="formFlexItems" name="userEmail">
Password:<input type="password" class="formFlexItems" name="userPassword">
<input type="submit" class="formFlexItems" value="login">

</form>

</div>
	


</body>
</html>