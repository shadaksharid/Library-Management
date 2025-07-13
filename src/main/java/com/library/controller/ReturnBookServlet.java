package com.library.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.dao.BorrowDAO;

/**
 * Servlet implementation class ReturnBookServlet
 */
@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BorrowDAO borrowDAO = new BorrowDAO();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            int borrowId = Integer.parseInt(request.getParameter("borrowId"));

            boolean success = borrowDAO.returnBook(borrowId);

            if (success) {
                request.setAttribute("message", "Book returned successfully.");
            } else {
                request.setAttribute("message", "Invalid borrow record or already returned.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error processing return.");
        }

        request.getRequestDispatcher("member/borrow-result.jsp").forward(request, response);
		
	}

}
