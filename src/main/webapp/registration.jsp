<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #fce4ec);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            max-width: 400px;
            width: 100%;
            animation: fadeIn 1s ease;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #00695c;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            transition: 0.3s;
            cursor: pointer;
        }

        button:hover {
            background-color: #388e3c;
        }

        .message {
            text-align: center;
            margin-top: 10px;
        }

        .message.error {
            color: red;
        }

        .message.success {
            color: green;
        }

        .link {
            text-align: center;
            margin-top: 15px;
        }

        .link a {
            color: #00695c;
            text-decoration: none;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Register</h2>
        <form action="register" method="post">
            <input type="text" name="name" placeholder="Name" required />
            <input type="email" name="email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <select name="role" required>
                <option value="">Select Role</option>
                <option value="member">Member</option>
                <option value="librarian">Librarian</option>
            </select>
            <button type="submit">Register</button>
        </form>
        <%
            String error = (String) request.getAttribute("error");
            String success = (String) request.getAttribute("success");
            if (error != null) {
        %>
            <div class="message error"><%= error %></div>
        <% } else if (success != null) { %>
            <div class="message success"><%= success %></div>
        <% } %>
        <div class="link">
            Already have an account? <a href="login.jsp">Login</a>
        </div>
    </div>
</body>
</html>
