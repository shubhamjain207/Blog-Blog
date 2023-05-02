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

<div class="navbar-home">

<div class="webTitle">
    Blog Blog
</div>

<div class="profilePageButton">
	<form action="profile.jsp" method="post">
		<input type="submit" value="My Profile">
	</form>
</div>

<div>
<button class="writeBlogButton">Write Blog</button>
</div>

</div>

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
	%>
	
	<div class="blogContainerMain">
	
	
	<%
	for(int i = 0 ; i < list.size() ; i++){
	
	%>
	
	<div class="blogContainer">
		<div class="blogText"><%=list.get(i).getBlogContent()%></div>
	    <h3 class="blogWriter"><%=list.get(i).getBlogUserEmail()%></h1>
	</div>
	
	
	
<% 	
	
}	
	
%>

</div>

<% 



}catch(Exception e){
		
}

%>




<div class="writeBlog">

<div class="writeBlogChild">
<form action="Home1" method="post" >

<textarea name="blogpost" rows=10 cols="80" maxlength="400">

</textarea>

<input type="submit" value="Post">
<button class="closeBtn">Close</button>

</form>

</div>

</div>






<script>
  <%@ include file="in2.js"%>
</script>

</body>
</html>