<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Register</title>

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

.register-box{
    width:400px;
    background:white;
    padding:40px;
    border-radius:15px;
    box-shadow:0 4px 15px rgba(0,0,0,0.3);
}

h1{
    text-align:center;
    margin-bottom:25px;
    color:#333;
}

input{
    width:100%;
    padding:12px;
    margin-top:10px;
    margin-bottom:20px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
}

input:focus{
    border-color:#4facfe;
    outline:none;
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
    font-size:14px;
    margin-bottom:15px;
    display:none;
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

<div class="register-box">

<h1>

Register

</h1>

<form
action="RegisterServlet"
method="post"
onsubmit="return validateForm()">

<input
type="text"
name="username"
id="username"
placeholder="Username"
required>

<input
type="text"
name="name"
id="name"
placeholder="Full Name"
required>

<input
type="email"
name="email"
id="email"
placeholder="Email"
required>
<input
type="text"
name="phone"
placeholder="Phone Number"
required>

<input
type="password"
name="password"
id="password"
placeholder="Password"
required>

<input
type="password"
id="confirmPassword"
placeholder="Confirm Password"
required>

<p
id="error"
class="error">

Passwords do not match

</p>

<button type="submit">

Register

</button>

</form>

<div class="footer">

Already have an account?

<a href="Login.jsp">

Login

</a>

</div>

</div>

</div>

<script>

function validateForm(){

    let password =
        document.getElementById(
            "password"
        ).value;

    let confirmPassword =
        document.getElementById(
            "confirmPassword"
        ).value;

    let error =
        document.getElementById(
            "error"
        );

    if(password !== confirmPassword){

        error.style.display =
            "block";

        return false;
    }

    error.style.display =
        "none";

    return true;
}

</script>

</body>

</html>