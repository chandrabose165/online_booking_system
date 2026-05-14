<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>

Payment Page

</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(
        135deg,
        #d2691e,
        #00f2fe
    );
}

.payment-container{
    width:400px;
    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0px 10px 25px rgba(0,0,0,0.2);
    text-align:center;
}

.payment-container h1{
    color:#4facfe;
    margin-bottom:15px;
}

.payment-container p{
    color:#555;
    margin-bottom:25px;
}

.qr-box{
    background:#f5f5f5;
    padding:20px;
    border-radius:15px;
    margin-bottom:25px;
}

.qr-box img{
    width:220px;
    height:220px;
    border-radius:10px;
}

.pay-btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:10px;
    background:#4facfe;
    color:white;
    font-size:17px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.pay-btn:hover{
    background:#008cdd;
}

.back-link{
    display:block;
    margin-top:20px;
    text-decoration:none;
    color:#4facfe;
    font-weight:bold;
}

.back-link:hover{
    text-decoration:underline;
}

</style>

</head>

<body>

<div class="payment-container">

<h1>

QR Code Payment

</h1>

<p>

Scan the QR code using PhonePe, Google Pay or Paytm.

</p>

<div class="qr-box">

<img
src="https://api.qrserver.com/v1/create-qr-code/?size=220x220&data=upi://pay?pa=bunny@paytm&pn=OnlineBookStore&am=500"
alt="QR Code">

</div>

<button class="pay-btn">

Payment Done

</button>

<a
href="success.jsp"
class="back-link">

← Back To Store

</a>

</div>

</body>

</html>