package com.library.controller;

import com.library.dao.BorrowDAO;
import com.library.model.BorrowRecord;
import com.library.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/BorrowServlet")
public class BorrowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BorrowDAO dao = new BorrowDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null || !"member".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("login.jsp");
                return;
            }

            BorrowRecord record = new BorrowRecord();
            record.setBookId(bookId);
            record.setMemberId(user.getId());

            LocalDate today = LocalDate.now();
            LocalDate dueDate = today.plusDays(14); // 2 weeks from today

            record.setBorrowDate(Date.valueOf(today));
            record.setDueDate(Date.valueOf(dueDate));

            boolean success = dao.issueBook(record);

            if (success) {
                request.setAttribute("message", "Book issued successfully!");
            } else {
                request.setAttribute("message", "Failed to issue book. It may be unavailable.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while issuing the book.");
        }

        request.getRequestDispatcher("member/borrow-result.jsp").forward(request, response);
    }
}
