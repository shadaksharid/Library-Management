package com.library.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.library.dao.BorrowDAO;
import com.library.model.BorrowRecord;
import com.library.model.User;

/**
 * Servlet implementation class BorrowHistoryServlet
 */
@WebServlet("/BorrowHistoryServlet")
public class BorrowHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BorrowDAO dao = new BorrowDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrowHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            if (user == null || !"member".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("login.jsp");
                return;
            }

            List<BorrowRecord> records = dao.getBorrowRecordsByUser(user.getId());
            request.setAttribute("records", records);
            request.getRequestDispatcher("member/borrow-history.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("member/dashboard.jsp");
        }
	}

}
