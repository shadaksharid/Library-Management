package com.library.controller;

import com.library.dao.BookDAO;
import com.library.model.Book;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class EditBookServlet
 */
@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookDAO dao = new BookDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBookServlet() {
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
	        int id = Integer.parseInt(request.getParameter("id"));
	        BookDAO dao = new BookDAO();
	        Book book = dao.getBookById(id);  // this might throw an exception

	        request.setAttribute("book", book);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/edit-book.jsp");
	        dispatcher.forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("error.jsp");
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            Book book = new Book();
            book.setId(Integer.parseInt(request.getParameter("id")));
            book.setTitle(request.getParameter("title"));
            book.setAuthor(request.getParameter("author"));
            book.setGenre(request.getParameter("genre"));
            book.setIsbn(request.getParameter("isbn"));
            book.setYear(Integer.parseInt(request.getParameter("year")));
            book.setAvailable(Boolean.parseBoolean(request.getParameter("available")));

            dao.updateBook(book);
            response.sendRedirect("ListBooksServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
	}

}
