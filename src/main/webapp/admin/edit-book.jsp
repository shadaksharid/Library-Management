<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Edit Book</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f3f3f3;
        margin: 0;
        padding: 20px;
    }
    .nav-links {
        text-align: right;
        margin-bottom: 20px;
    }
    .nav-links a {
        margin: 0 10px;
        text-decoration: none;
        color: white;
        background: #4caf50;
        padding: 8px 12px;
        border-radius: 4px;
        transition: background 0.3s;
    }
    .nav-links a:hover {
        background: #388e3c;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    form {
        max-width: 500px;
        margin: auto;
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        animation: fadeIn 0.5s ease;
    }
    input[type="text"], select {
        width: 100%;
        padding: 8px;
        margin: 8px 0;
        box-sizing: border-box;
    }
    button {
        background: #2196f3;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 4px;
        margin-top: 10px;
    }
    button:hover {
        background: #1976d2;
    }
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>

<div class="nav-links">
    <a href="<%= request.getContextPath() %>/ListBooksServlet">📚 Books</a>
    <a href="dashboard.jsp">🏠 Dashboard</a>
</div>

<h2>Edit Book</h2>

<form action="EditBookServlet" method="post">
    <input type="hidden" name="id" value="${book.id}" />

    <label>Title:</label>
    <input type="text" name="title" value="${book.title}" required />

    <label>Author:</label>
    <input type="text" name="author" value="${book.author}" required />

    <label>Genre:</label>
    <input type="text" name="genre" value="${book.genre}" required />

    <label>ISBN:</label>
    <input type="text" name="isbn" value="${book.isbn}" required />

    <label>Year:</label>
    <input type="text" name="year" value="${book.year}" required />

    <label>Available:</label>
    <select name="available">
        <option value="true" ${book.available ? "selected" : ""}>Yes</option>
        <option value="false" ${!book.available ? "selected" : ""}>No</option>
    </select>

    <label>Copies:</label>
    <input type="text" name="copies" value="${book.copies}" required />

    <button type="submit">Update Book</button>
</form>

</body>
</html>
