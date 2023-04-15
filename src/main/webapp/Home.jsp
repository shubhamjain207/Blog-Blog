<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="homeStyle.css" rel="stylesheet">
</head>
<body>


<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%

try {
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:8809/techblog","root","1234");
	String q = "select * from blogposts";

	Statement pstm =  cn.createStatement();
	
	ResultSet set =  pstm.executeQuery(q);

	
	
	while(set.next()) {

			
			
			
	%>		
	
	<div class="blogContainer">

    <h5><%=set.getString("user_id_blog")%></h5>
	<%= set.getString("blog_content")%>

</div>

	
	
	<%
	}
	
}catch(Exception e){
		
	
	
}
	%>
	
	
		
	
		

<form action="Home1" method="post">

Write blog : <input type="text" name="blogpost">




<input type="submit" value="Post">



</form>
</body>
</html>