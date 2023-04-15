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

String userEmail = (String)session.getAttribute("currentUser");


String userId = (String) request.getAttribute("userId");
String userName = (String)request.getAttribute("userName");
String userEmail1 = (String)request.getAttribute("userEmail");
String userGender = (String)request.getAttribute("userGender");
String userRegDate = (String)request.getAttribute("userRegDate");
String userPhoto =  (String)request.getAttribute("userPhoto");



 if(userEmail == null){
	 response.sendRedirect("login.jsp");
 }
 else{
	 out.println("<h1>User Login</h1>");
 }
 



 
%>


<div id="profileView" style="display:visible">  
<img src="pics/<%=userPhoto%>" style="height:100px;width:100px" >
<h1>User Name: <%=userId %></h1>
<h1>User Email: <%=userEmail %></h1>
<h1>Gender: <%=userGender %></h1>

<h1>Date of joining: <%=userRegDate%></h1>


<button id="editProfile">Edit</button>

<form action="Logout" method="post">

<input type="submit" value="Log out">


</form>

</div>

<div id="editProfileView" style="display:none">

<form action="EditProfile"  method="post" class="loginForm">
	<input type="text" name="userId" value=<%=userId%>>
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


 <script src="style2.js"></script> 
 
</body>
</html>