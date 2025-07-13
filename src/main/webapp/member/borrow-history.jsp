<%@ page import="java.util.*, com.library.model.BorrowRecord" %>
<%@ page session="true" %>
<%
    List<BorrowRecord> records = (List<BorrowRecord>) request.getAttribute("records");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Borrow History</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0f4c3, #ffe0b2);
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
            color: #e65100;
            font-weight: 600;
        }

        h2 {
            text-align: center;
            color: #ef6c00;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
            animation: fadeInUp 1s ease-in-out;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #ffcc80;
        }

        button {
            background-color: #fb8c00;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #e65100;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <h2>Your Borrowed Books</h2>

    <div class="nav">
        <a href="<%= request.getContextPath() %>/ListBooksServlet">Books</a> |
        <a href="member/dashboard.jsp">Dashboard</a>
    </div>

    <table>
        <tr>
            <th>Book ID</th>
            <th>Borrowed On</th>
            <th>Due Date</th>
            <th>Return Date</th>
            <th>Fine (₹)</th>
            <th>Action</th>
        </tr>

        <%
            if (records != null && !records.isEmpty()) {
                for (BorrowRecord record : records) {
        %>
            <tr>
                <td><%= record.getBookId() %></td>
                <td><%= record.getBorrowDate() %></td>
                <td><%= record.getDueDate() %></td>
                <td><%= record.getReturnDate() != null ? record.getReturnDate() : "Not returned" %></td>
                <td><%= record.getFine() %></td>
                <td>
                    <% if (record.getReturnDate() == null) { %>
                        <form method="post" action="<%= request.getContextPath() %>/ReturnBookServlet">
                            <input type="hidden" name="borrowId" value="<%= record.getId() %>" />
                            <button type="submit">Return</button>
                        </form>
                    <% } else { %>
                        Returned on <%= record.getReturnDate() %><br/>
                        Fine: ₹<%= record.getFine() %>
                    <% } %>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="6">No borrowing history found.</td>
            </tr>
        <%
            }
        %>
    </table>

</body>
</html>
