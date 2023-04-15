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



String email = request.getParameter("userEmail");


%>

<%

try {
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:8809/techblog","root","1234");
	String q = "select * from new_table";

	Statement pstm =  cn.createStatement();
	
	ResultSet set =  pstm.executeQuery(q);

	%>
	
	<h1><%=email %></h1>
	
	<% 
	
	while(set.next()) {
	
		if(set.getString("userEmail").equals(email)){
		
			HttpSession httpses = request.getSession();
			httpses.setAttribute("currentUser", email);
			
			RequestDispatcher rd;
			String userId = String.valueOf(set.getInt("userId"));
			request.setAttribute("userId",userId);
			request.setAttribute("userName", set.getString("userName"));
			request.setAttribute("userEmail", set.getString("userEmail"));
			request.setAttribute("userGender", set.getString("userGender"));
			request.setAttribute("userPhoto", set.getString("userPhoto"));
			request.setAttribute("userRegDate", set.getString("userRegDate"));
			rd = request.getRequestDispatcher("profile.jsp");
			rd.forward(request, response);
			
			
			
		
%>
		
		
		
<% 		


		}
		
	}
}
catch(Exception e) {
	
	//RequestDispatcher rd;
	//rd = request.getRequestDispatcher("error.jsp");
	//rd.forward(request, response);
	e.printStackTrace();
}

%>


    <h1>Login:</h1>

<div class="container"> 

<form action="Login" class="loginForm" method="post">

Email:<input type="email" class="formFlexItems" name="userEmail">
Password:<input type="password" class="formFlexItems">
<input type="submit" class="formFlexItems" value="login">

</form>

</div>
	


</body>
</html>