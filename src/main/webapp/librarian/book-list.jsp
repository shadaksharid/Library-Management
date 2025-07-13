<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, com.library.model.Book, com.library.model.User" %>
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
    <title>Available Books</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0f4c3, #e1bee7);
            margin: 0;
            padding: 20px;
        }

        .nav {
            text-align: right;
            margin-bottom: 20px;
        }

        .nav a {
            margin: 0 10px;
            text-decoration: none;
            color: #388e3c;
            font-weight: 600;
        }

        h2, h3 {
            text-align: center;
            color: #2e7d32;
        }

        form {
            text-align: center;
            margin-bottom: 30px;
            animation: fadeIn 1s ease-in-out;
        }

        input, select {
            padding: 8px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #388e3c;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            animation: fadeInUp 0.8s ease-in-out;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #c8e6c9;
        }

        img {
            border-radius: 4px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="nav">
        <a href="librarian/dashboard.jsp">Dashboard</a>
    </div>

    <h2>Library Management System</h2>
    <h3>Search Books</h3>

    <form action="<%= request.getContextPath() %>/SearchBooksServlet" method="post">
        <input type="text" name="title" placeholder="Title" />
        <input type="text" name="author" placeholder="Author" />
        <input type="text" name="genre" placeholder="Genre" />
        <select name="available">
            <option value="">Availability</option>
            <option value="1">Available</option>
            <option value="0">Not Available</option>
        </select>
        <input type="submit" value="Search" />
    </form>

    <h2>Available Books</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Cover</th>
            <th>Title</th>
            <th>Author</th>
            <th>Genre</th>
            <th>ISBN</th>
            <th>Year</th>
            <th>Available</th>
            <th>Copies</th>
        </tr>
        <%
            if (books != null && !books.isEmpty()) {
                for (Book book : books) {
        %>
        <tr>
            <td><%= book.getId() %></td>
            <td>
                <%
                    String cover = book.getCoverImage();
                    if (cover != null && !cover.isEmpty()) {
                %>
                    <img src="<%= request.getContextPath() %>/uploads/<%= cover %>" width="60" height="80" />
                <%
                    } else {
                %>
                    N/A
                <%
                    }
                %>
            </td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getGenre() %></td>
            <td><%= book.getIsbn() %></td>
            <td><%= book.getYear() %></td>
            <td><%= book.getAvailable() ? "Yes" : "No" %></td>
            <td><%= book.getCopies() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="10">No books found.</td>
        </tr>
        <% } %>
    </table>

</body>
</html>
