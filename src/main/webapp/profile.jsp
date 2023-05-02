<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style>
     <%@ include file="profileStyle.css"%>
</style>
 

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
<div class="heading">User Name</div>
<div><%=userName %></div>
<div class="heading">User Email</div>
<div><%=userEmail %></div>
<div class="heading">User Gender</div>
<div><%=userGender %></div>
<div class="heading">User Joining Date</div>
<div><%=userRegDate%></div>


<button class="editProfile">Edit</button>

<form action="Logout" method="post">

<input type="submit" value="Log out">


</form>

</div>

<div id="editProfileView" style="display:none">

<form action="EditProfile"  method="post" class="loginForm" enctype="multipart/form-data">
<div class="heading1">
Profile Picture <br><input type="file" class="formFlexItems" name="userPhoto">
</div><br>
	<div class="heading1">
    User Name<br> <input type="text" class="formFlexItems" name="userName">
	
	</div><br>
	
	<div class="heading1">
	
    Email<br><input type="email" class="formFlexItems" name="userEmail">
	</div><br>
	<div class="heading1">
	
    Password<br><input type="password" class="formFlexItems" name="userPassword">
	</div><br>
	
	<div class="heading1">
    Select Gender<br> 
    <input type="radio" name="gender" id="Male" value="M"> <label for="Male">Male</label><br>
    <input type="radio" name="gender" id="Female" value="F"> <label for="Female">Female</label>
	
	</div><br>
   
    <div class="heading1">
    
    <input type="submit" class="formFlexItems" value="Save">
    </div>
    
    </form>



</div>


<script>
     <%@ include file="in3.js"%>
</script>
 
</body>
</html>