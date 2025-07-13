package com.library.controller;

import com.library.dao.BookDAO;
import com.library.model.Book;
import com.library.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ListBooksServlet
 */
@WebServlet("/ListBooksServlet")
public class ListBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBooksServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookDAO dao = new BookDAO();
        try {
            List<Book> books = dao.getAllBooks(); // Make sure this returns the full list
            request.setAttribute("books", books);

            // Route based on user role (optional)
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user != null && "admin".equals(user.getRole())) {
                request.getRequestDispatcher("admin/book-list.jsp").forward(request, response);
            } else if (user != null && "member".equals(user.getRole())) {
                request.getRequestDispatcher("member/book-list.jsp").forward(request, response);
            }else if (user != null && "librarian".equals(user.getRole())) {
                request.getRequestDispatcher("librarian/book-list.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
	}

}
