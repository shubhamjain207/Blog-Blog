<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

String userEmail = (String)session.getAttribute("currentUserEmail");
String userName = (String) session.getAttribute("currentUserName");
String userId = (String) session.getAttribute("currentUserId");
String userEmail1 = (String)session.getAttribute("currentUserEmail");
String userGender = (String)session.getAttribute("currentUserGender");
String userRegDate = (String)session.getAttribute("currentUserRegDate");
String userPhoto =  (String)session.getAttribute("currentUserPhoto");






 if(userEmail == null){
	 response.sendRedirect("login.jsp");
 }
 
 



 
%>


<div id="profileView" style="display:visible">  
<img src="pics/<%=userPhoto%>" style="height:100px;width:100px" >
<h1>User Name: <%=userName %></h1>
<h1>User Email: <%=userEmail %></h1>
<h1>Gender: <%=userGender %></h1>

<h1>Date of joining: <%=userRegDate%></h1>


<button class="editProfile">Edit</button>

<form action="Logout" method="post">

<input type="submit" value="Log out">


</form>

</div>

<div id="editProfileView" style="display:none">

<form action="EditProfile"  method="post" class="loginForm" enctype="multipart/form-data">
	Profile Picture : <input type="file" class="formFlexItems" name="userPhoto">
    User Name: <input type="text" class="formFlexItems" name="userName">
    Email:<input type="email" class="formFlexItems" name="userEmail">
    Password:<input type="password" class="formFlexItems" name="userPassword">
    Select Gender: 
    <input type="radio" name="gender" id="Male" value="M"> <label for="Male">Male</label><br>
    <input type="radio" name="gender" id="Female" value="F"> <label for="Female">Female</label>
   
    
    <input type="submit" class="formFlexItems" value="Save">
    
    </form>

<h1>Date of joining:</h1>

</div>


<script>
     <%@ include file="in3.js"%>
</script>
 
</body>
</html>