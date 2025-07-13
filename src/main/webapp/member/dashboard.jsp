<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import= "com.library.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"member".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member Dashboard</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #d1c4e9, #b39ddb);
            text-align: center;
            padding: 50px;
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            color: #4e342e;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .user-info {
            margin-bottom: 20px;
            color: #5d4037;
            font-weight: 500;
        }

        a {
            display: inline-block;
            margin: 12px;
            padding: 12px 24px;
            background-color: #7e57c2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        a:hover {
            background-color: #5e35b1;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <h2>Welcome, <%= user.getName() %>!</h2>
    <div class="user-info">
        <p>Email: <%= user.getEmail() %></p>
        <p>Role: Member</p>
    </div>

    <a href="../ListBooksServlet">📚 Browse Books</a>
    <a href="../BorrowHistoryServlet">📖 View Borrow History</a>
    <a href="../logout.jsp">🚪 Logout</a>

</body>
</html>
