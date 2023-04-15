<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <link href="style1.css" rel="stylesheet">
 	
</head>
<body class="registerBody">
    <h1>Register:</h1>

    <div class="container">     
    
    <form action="Register"  method="post" class="loginForm" enctype="multipart/form-data">
    User Name: <input type="text" class="formFlexItems" name="userName">
    Email:<input type="email" class="formFlexItems" name="userEmail">
    Password:<input type="password" class="formFlexItems" name="userPassword">
    Select Gender: 
    <input type="radio" name="gender" id="Male" value="M"> <label for="Male">Male</label><br>
    <input type="radio" name="gender" id="Female" value="F"> <label for="Female">Female</label>
    Photo: <input type="file" name="userPhoto">
    
    <input type="submit" class="formFlexItems" value="Register">
    
    </form>
    
    </div>
        </body>
</html>