<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import= "com.library.model.User" %>
<%
	User user = (User) session.getAttribute("user");
	if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
    	response.sendRedirect("../login.jsp");
    	return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f3f3f3;
        text-align: center;
        padding: 50px;
    }
    h2 {
        color: #333;
        animation: fadeIn 0.5s ease;
    }
    .nav {
        margin: 30px 0;
    }
    .nav a {
        display: inline-block;
        background: #2196F3;
        color: white;
        text-decoration: none;
        padding: 12px 20px;
        margin: 10px;
        border-radius: 5px;
        transition: background 0.3s, transform 0.3s;
    }
    .nav a:hover {
        background: #1976D2;
        transform: scale(1.05);
    }
    .logout {
        background: #f44336;
    }
    .logout:hover {
        background: #d32f2f;
    }
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>

<h2>Welcome, <%= user.getName() %> (Admin)</h2>

<div class="nav">
    <a href="../ListBooksServlet">📚 View All Books</a>
    <a href="../logout.jsp" class="logout">🚪 Logout</a>
</div>

</body>
</html>
