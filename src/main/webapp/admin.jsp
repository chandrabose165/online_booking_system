<%
String username =
(String)session.getAttribute("username");
%>

<!DOCTYPE html>
<html>

<head>
<title>Admin Dashboard</title>
</head>

<body>

<h1>

Welcome Admin

<%= username %>

</h1>

<a href="success.jsp">

<button>

Manage Books

</button>

</a>

</body>

</html>