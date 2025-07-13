package com.library.controller;

import com.library.dao.BookDAO;
import com.library.model.Book;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class SearchBooksServlet
 */
@WebServlet("/SearchBooksServlet")
public class SearchBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBooksServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
        String author = request.getParameter("author");
        String genre = request.getParameter("genre");
        String available = request.getParameter("available");

        try {
            BookDAO dao = new BookDAO();
            List<Book> books = dao.searchBooks(title, author, genre, available);
            request.setAttribute("books", books);
            RequestDispatcher dispatcher = request.getRequestDispatcher("member/book-list.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
	}

}
