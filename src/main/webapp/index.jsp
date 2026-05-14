<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>
Online Book Store
</title>

<style>

    *{
        margin:0;
        padding:0;
        box-sizing:border-box;
        font-family:Arial, sans-serif;
    }

    body{
        height:100vh;
        display:flex;
        justify-content:center;
        align-items:center;
        background:linear-gradient(to right,#4facfe,#00f2fe);
    }

    .container{
        background:white;
        padding:50px;
        border-radius:15px;
        box-shadow:0 4px 15px rgba(0,0,0,0.2);
        text-align:center;
        width:400px;
    }

    h1{
        margin-bottom:35px;
        color:#333;
        font-size:32px;
    }

    .btn{
        width:100%;
        padding:14px;
        margin-top:15px;
        border:none;
        border-radius:8px;
        font-size:18px;
        cursor:pointer;
        transition:0.3s;
    }

    .login-btn{
        background:#4facfe;
        color:white;
    }

    .login-btn:hover{
        background:#008cdd;
    }

    .register-btn{
        background:#00b894;
        color:white;
    }

    .register-btn:hover{
        background:#019875;
    }

    a{
        text-decoration:none;
    }

</style>

</head>

<body>

<div class="container">

    <h1>
        Welcome
    </h1>

    <a href="Login.jsp">

        <button class="btn login-btn">

            Login

        </button>

    </a>

    <a href="reg.jsp">

        <button class="btn register-btn">

            Register

        </button>

    </a>

</div>

</body>

</html>