<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Book</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        width: 400px;
        animation: fadeIn 0.5s ease;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
    }
    input, select {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    button {
        width: 100%;
        padding: 10px;
        margin-top: 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background 0.3s;
    }
    button:hover {
        background-color: #45a049;
    }
    .top-nav {
        text-align: right;
        margin-bottom: 20px;
    }
    .top-nav a {
        text-decoration: none;
        background: #2196F3;
        color: white;
        padding: 8px 15px;
        border-radius: 4px;
        transition: background 0.3s;
    }
    .top-nav a:hover {
        background: #1976D2;
    }
    .message {
        text-align: center;
        color: green;
        margin-top: 15px;
    }
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>

<div class="container">
    <div class="top-nav">
        <a href="dashboard.jsp">🏠 Dashboard</a>
    </div>

    <h2>Add New Book</h2>

    <form action="../AddBookServlet" method="post" enctype="multipart/form-data">
        <label>Title:</label>
        <input type="text" name="title" required>

        <label>Author:</label>
        <input type="text" name="author" required>

        <label>Genre:</label>
        <input type="text" name="genre" required>

        <label>ISBN:</label>
        <input type="text" name="isbn" required>

        <label>Publication Year:</label>
        <input type="number" name="year" required>

        <label>Available:</label>
        <input type="checkbox" name="available" checked>

        <label>Cover Image:</label>
        <input type="file" name="coverImage" accept="image/*">

        <label>Copies:</label>
        <input type="number" name="copies" min="1" required>

        <button type="submit">Add Book</button>
    </form>

    <p class="message">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </p>
</div>

</body>
</html>
