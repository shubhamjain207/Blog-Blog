<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
     <%@ include file="homeStyle.css"%>
</style>

</head>
<body>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="servlets.BlogPost"%>


<%

HttpSession http = request.getSession();
String userName = (String) http.getAttribute("currentUserName");

ArrayList<BlogPost> list = new ArrayList<>();

try {
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:8809/techblog","root","1234");
	String q = "select * from blogposts";

	Statement pstm =  cn.createStatement();
	
	ResultSet set =  pstm.executeQuery(q);
	
	
	
	
	while(set.next()){
	
		
		BlogPost bp = new BlogPost(set.getString("blog_content"),set.getString("user_id_blog"));
		list.add(bp);
	}
	
	Collections.reverse(list);
	for(int i = 0 ; i < list.size() ; i++){
		
	
	
	
	%>
	
	<div class="blogContainer">
		<h1><%=list.get(i).getBlogContent()%></h3>
	    <h3><%=list.get(i).getBlogUserEmail()%></h1>
	</div>
	
	
<% 	
	
}	

}catch(Exception e){
		
}

%>

<button class="writeBlogButton">Write Blog</button>


<div class="writeBlog">

<div class="writeBlogChild">
<form action="Home1" method="post" >

Write blog : <input type="textarea" name="blogpost">

<input type="submit" value="Post">
<button class="closeBtn">Close</button>

</form>

</div>

</div>




<div class="profilePageButton">
	<form action="profile.jsp" method="post">
	<input type="submit" value="My Profile">
	
	</form>
</div>

<script src="index1.js">



</script>
</body>
</html>