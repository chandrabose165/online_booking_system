<%@ page import="java.sql.*" %>
<%@ page import="javaclass.DatabaseConnection" %>

<%

if(session.getAttribute("username") == null){

    response.sendRedirect("Login.jsp");

    return;
}

String role =
(String)session.getAttribute("role");

String username =
(String)session.getAttribute("username");

%>

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
    font-family:Arial,sans-serif;
}

body{
    background:#f4f7fb;
    padding:30px;
}

/* HEADER */

.header{
    background:#4facfe;
    color:white;
    padding:20px 30px;
    border-radius:12px;
    margin-bottom:30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.logo h1{
    font-size:32px;
}

/* RIGHT SECTION */

.right-section{
    display:flex;
    align-items:center;
    gap:15px;
}

/* CART BUTTON */

.cart-btn{
    background:white;
    color:#4facfe;
    border:none;
    padding:10px 18px;
    border-radius:25px;
    font-weight:bold;
    cursor:pointer;
    font-size:15px;
    transition:0.3s;
}

.cart-btn:hover{
    background:#e6f4ff;
}

/* PROFILE */

.profile{
    position:relative;
    display:inline-block;
}

.profile-btn{
    background:white;
    color:#4facfe;
    border:none;
    padding:10px 18px;
    border-radius:25px;
    font-weight:bold;
    cursor:pointer;
    font-size:15px;
}

.profile-content{
    display:none;
    position:absolute;
    right:0;
    background:white;
    min-width:180px;
    box-shadow:0px 4px 12px rgba(0,0,0,0.2);
    border-radius:12px;
    overflow:hidden;
    z-index:1;
    margin-top:10px;
}

.profile-content p{
    padding:15px;
    color:#333;
    border-bottom:1px solid #eee;
}

.profile-content a{
    display:block;
    padding:15px;
    text-decoration:none;
    color:#333;
    transition:0.3s;
}

.profile-content a:hover{
    background:#f1f1f1;
}

.profile:hover .profile-content{
    display:block;
}

/* ADMIN PANEL */

.admin-panel{
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0px 4px 10px rgba(0,0,0,0.1);
    margin-bottom:40px;
}

.admin-panel h2{
    margin-bottom:20px;
    color:#333;
}

form input{
    width:100%;
    padding:12px;
    margin-bottom:15px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
}

button{
    padding:12px 20px;
    background:#4facfe;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-size:15px;
    transition:0.3s;
}

button:hover{
    background:#008cdd;
}

/* BOOKS */

.book-container{
    display:grid;
    grid-template-columns:
    repeat(auto-fit,minmax(250px,1fr));
    gap:25px;
}

.book-card{
    background:white;
    border-radius:15px;
    padding:20px;
    text-align:center;
    box-shadow:0px 4px 10px rgba(0,0,0,0.1);
    transition:0.3s;
}

.book-card:hover{
    transform:translateY(-5px);
}

.book-card img{
    width:180px;
    height:240px;
    object-fit:cover;
    border-radius:10px;
    margin-bottom:15px;
}

.book-card h2{
    color:#333;
    margin-bottom:10px;
}

.book-card h3{
    color:#666;
    margin-bottom:10px;
}

.price{
    color:#4facfe;
    font-size:22px;
    font-weight:bold;
    margin-bottom:15px;
}

.remove-btn{
    background:#ff4d4d;
}

.remove-btn:hover{
    background:#cc0000;
}

.buy-btn{
    background:#28a745;
    margin-top:10px;
}

.buy-btn:hover{
    background:#1e7e34;
}

</style>

</head>

<body>

<!-- HEADER -->

<div class="header">

<div class="logo">

<h1>

Online Book Store

</h1>

</div>

<!-- RIGHT SECTION -->

<div class="right-section">

<% if("user".equals(role)){ %>

<a href="payment.jsp">

<button class="cart-btn">

Cart

</button>

</a>

<% } %>

<!-- PROFILE -->

<div class="profile">

<button class="profile-btn">

Profile - <%= username %>

</button>

<div class="profile-content">

<p>

Role :
<%= role %>

</p>

<a href="LogoutServlet">

Logout

</a>

</div>

</div>

</div>

</div>

<!-- ADMIN PANEL -->

<% if("admin".equals(role)){ %>

<div class="admin-panel">

<h2>

Add New Book

</h2>

<form
action="AddBookServlet"
method="post">

<input
type="text"
name="title"
placeholder="Book Title"
required>

<input
type="text"
name="author"
placeholder="Author"
required>

<input
type="number"
name="price"
placeholder="Price"
required>

<input
type="text"
name="image"
placeholder="Image URL"
required>

<button type="submit">

Add Book

</button>

</form>

</div>

<% } %>

<!-- BOOK LIST -->

<div class="book-container">

<%

try{

Connection con =
DatabaseConnection.getConnection();

String sql =
"SELECT * FROM books";

PreparedStatement ps =
con.prepareStatement(sql);

ResultSet rs =
ps.executeQuery();

while(rs.next()){

%>

<div class="book-card">

<img
src="<%= rs.getString("image") %>">

<h2>

<%= rs.getString("title") %>

</h2>

<h3>

<%= rs.getString("author") %>

</h3>

<div class="price">

&#8377;<%= rs.getDouble("price") %>

</div>

<% if("admin".equals(role)){ %>

<a href="RemoveBookServlet?id=<%= rs.getInt("id") %>">

<button class="remove-btn">

Remove Book

</button>

</a>

<% } %>

<% if("user".equals(role)){ %>

<a href="payment.jsp">

<button class="buy-btn">

Buy Now

</button>

</a>

<% } %>

</div>

<%

}

con.close();

}catch(Exception e){

e.printStackTrace();

}

%>

</div>

</body>

</html>