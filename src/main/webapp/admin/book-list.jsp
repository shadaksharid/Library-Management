<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, com.library.model.*" %>
<%@ page session = "true" %>
<%
    if(session.getAttribute("user") == null){
        response.sendRedirect("../login.jsp");
        return;
    }

    List<Book> books = (List<Book>) request.getAttribute("books");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Book List</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: #f3f3f3;
        margin: 0;
        padding: 20px;
    }
    h2, h3 {
        text-align: center;
        color: #333;
    }
    .nav-links {
        text-align: right;
        margin: 10px;
    }
    .nav-links a {
        margin: 0 10px;
        text-decoration: none;
        color: #fff;
        background: #4caf50;
        padding: 8px 15px;
        border-radius: 5px;
        transition: background 0.3s;
    }
    .nav-links a:hover {
        background: #388e3c;
    }
    form {
        text-align: center;
        margin-bottom: 20px;
    }
    input[type="text"], select {
        padding: 6px;
        margin: 5px;
    }
    input[type="submit"] {
        padding: 6px 12px;
        background: #2196f3;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background: #1976d2;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background: #fff;
        animation: fadeIn 0.5s ease;
    }
    th, td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: center;
    }
    th {
        background: #4caf50;
        color: white;
    }
    td a {
        margin: 0 5px;
        text-decoration: none;
        color: #2196f3;
    }
    td a:hover {
        text-decoration: underline;
    }
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>

<div class="nav-links">
    <a href="<%= request.getContextPath() %>/ListBooksServlet">📚 Books</a>
    <a href="admin/dashboard.jsp">🏠 Dashboard</a>
</div>

<h2>Admin - Book Management</h2>

<h3>Search Books</h3>
<form action="../SearchBooksServlet" method="post">
    Title: <input type="text" name="title" />
    Author: <input type="text" name="author" />
    Genre: <input type="text" name="genre" />
    Availability:
    <select name="available">
        <option value="">--Any--</option>
        <option value="1">Yes</option>
        <option value="0">No</option>
    </select>
    <input type="submit" value="Search" />
</form>

<h3>Available Books</h3>
<table>
    <tr>
        <th>ID</th><th>Title</th><th>Author</th><th>Genre</th>
        <th>ISBN</th><th>Year</th><th>Available</th><th>Copies</th><th>Actions</th>
    </tr>
    <%
        if (books != null) {
            for (Book book : books) {
    %>
    <tr>
        <td><%= book.getId() %></td>
        <td><%= book.getTitle() %></td>
        <td><%= book.getAuthor() %></td>
        <td><%= book.getGenre() %></td>
        <td><%= book.getIsbn() %></td>
        <td><%= book.getYear() %></td>
        <td><%= book.getAvailable() ? "Yes" : "No" %></td>
        <td><%= book.getCopies() %></td>
        <td>
            <a href="EditBookServlet?id=<%= book.getId() %>">✏️ Edit</a> |
            <a href="DeleteBookServlet?id=<%= book.getId() %>" onclick="return confirm('Are you sure you want to delete this book?');">🗑️ Delete</a>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="9">No books found.</td>
    </tr>
    <% } %>
</table>

</body>
</html>
