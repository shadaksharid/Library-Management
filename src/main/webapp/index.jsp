<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Management System</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f1f8e9);
            color: #333;
            overflow-x: hidden;
        }

        .hero {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            min-height: 100vh;
            padding: 0 20px;
            animation: fadeIn 1.2s ease-in-out;
        }

        h1 {
            font-size: 3em;
            margin-bottom: 10px;
            color: #2e7d32;
        }

        .tagline {
            font-size: 1.2em;
            margin-bottom: 30px;
            color: #555;
        }

        .description {
            max-width: 700px;
            font-size: 1em;
            color: #444;
            line-height: 1.6;
            margin-bottom: 40px;
        }

        .btn-container {
            display: flex;
            gap: 20px;
        }

        .btn {
            padding: 12px 30px;
            font-size: 16px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #388e3c;
            transform: scale(1.05);
        }

        footer {
            text-align: center;
            padding: 20px;
            font-size: 14px;
            color: #888;
            background-color: #f1f1f1;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2em;
            }
            .btn-container {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <section class="hero">
        <h1>Library Management System</h1>
        <p class="tagline">Empowering libraries with smart technology</p>
        <p class="description">
            This system allows administrators and librarians to manage books, members, and borrowing activities efficiently. 
            Members can search and borrow books, view their borrowing history, and return books seamlessly — all from one place.
        </p>
        <div class="btn-container">
            <a href="registration.jsp" class="btn">Register</a>
            <a href="login.jsp" class="btn">Login</a>
        </div>
    </section>

    <footer>
        &copy; <%= java.time.LocalDate.now().getYear() %> Library Management System. All rights reserved.
    </footer>
</body>
</html>
