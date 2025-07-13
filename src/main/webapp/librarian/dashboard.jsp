<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import= "com.library.model.User" %>
<%
	User user = (User) session.getAttribute("user");
	if (user == null || !"librarian".equalsIgnoreCase(user.getRole())) {
    	response.sendRedirect("../login.jsp");
    	return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Librarian Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #e0f7fa;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }
    .dashboard {
        background: white;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        text-align: center;
        animation: slideIn 0.6s ease;
    }
    h2 {
        color: #00796B;
    }
    a {
        display: inline-block;
        margin: 12px;
        padding: 10px 20px;
        background: #00796B;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background 0.3s, transform 0.3s;
    }
    a:hover {
        background: #004D40;
        transform: scale(1.05);
    }
    @keyframes slideIn {
        from { opacity: 0; transform: translateY(-30px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>

<div class="dashboard">
    <h2>Welcome, Librarian!</h2>
    <a href="add-book.jsp">📚 Add New Book</a>
    <a href="../ListBooksServlet">📖 View All Books</a>
    <a href="../logout.jsp">🚪 Logout</a>
</div>

</body>
</html>
