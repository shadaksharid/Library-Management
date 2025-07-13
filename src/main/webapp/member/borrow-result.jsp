<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Borrow Result</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e1f5fe, #b3e5fc);
            text-align: center;
            padding: 50px;
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            color: #0277bd;
            font-size: 28px;
            margin-bottom: 30px;
        }

        a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #039be5;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        a:hover {
            background-color: #0277bd;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <h2><%= request.getAttribute("message") %></h2>

    <a href="member/dashboard.jsp">Back to Dashboard</a>
    <a href="ListBooksServlet">Back to Book List</a>

</body>
</html>
