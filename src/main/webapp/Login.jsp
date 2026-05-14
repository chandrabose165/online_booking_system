<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<form action="Loginservlet" method="post">

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>
Login Page
</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(
            to right,
            #4facfe,
            #00f2fe
    );
}

.container{
    width:100%;
    display:flex;
    justify-content:center;
    align-items:center;
}

.loginform{
    width:400px;
    background:white;
    padding:40px;
    border-radius:15px;
    box-shadow:0px 4px 15px rgba(0,0,0,0.3);
}

h1{
    text-align:center;
    margin-bottom:30px;
    color:#333;
}

label{
    font-weight:bold;
    color:#444;
}

input{
    width:100%;
    padding:12px;
    margin-top:8px;
    margin-bottom:20px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
}

input:focus{
    outline:none;
    border-color:#4facfe;
}

button{
    width:100%;
    padding:12px;
    background:#4facfe;
    color:white;
    border:none;
    border-radius:8px;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#008cdd;
}

.error{
    color:red;
    text-align:center;
    margin-bottom:15px;
}

.footer{
    text-align:center;
    margin-top:20px;
}

.footer a{
    text-decoration:none;
    color:#4facfe;
    font-weight:bold;
}

.footer a:hover{
    text-decoration:underline;
}

</style>

</head>

<body>

<div class="container">

<div class="loginform">

<h1>

LOGIN
</h1>

<form action="Loginservlet" method="post" onsubmit="return validateLogin()">

<label>

username

</label>

<input
type="text"
name="username"
id="username"
placeholder="Enter username"
required>

<label>
Password
</label>
<input
type="password"
name="password"
id="password"
placeholder="Enter Password"
required>
<p
id="error"
class="error">
</p>
<button type="submit">
LOGIN
</button>
</form>
<%
String error =
request.getParameter("error");
if(error != null){
%>
<p class="error">
<%= error %>
</p>
<%
}
%>
<div class="footer">
Don't have account?
<a href="reg.jsp">
Register
</a>
</div>
</div>
</div>
<script>
function validateLogin(){
    let email =
        document.getElementById(
            "username"
        ).value;

    let password =
        document.getElementById(
            "password"
        ).value;

    let error =
        document.getElementById(
            "error"
        );

    if(email.trim() === ""){

        error.innerHTML =
            "Email cannot be empty";

        return false;
    }

    if(password.trim() === ""){

        error.innerHTML =
            "Password cannot be empty";

        return false;
    }

    if(password.length < 6){

        error.innerHTML =
            "Password must be at least 6 characters";

        return false;
    }

    error.innerHTML = "";

    return true;
}

</script>

</body>

</html>