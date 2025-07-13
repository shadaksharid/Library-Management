package com.library.controller;

import com.library.dao.*;
import com.library.model.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		UserDAO dao = new UserDAO();
		User user = dao.login(email, password);
		
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("role", user.getRole());
			
			String role = user.getRole().toLowerCase();
			switch (role) {
			    case "admin":
			        response.sendRedirect("admin/dashboard.jsp");
			        break;
			    case "librarian":
			        response.sendRedirect("librarian/dashboard.jsp");
			        break;
			    case "member":
			        response.sendRedirect("member/dashboard.jsp");
			        break;
			    default:
			        response.sendRedirect("login.jsp");
			}

		}else {
			request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
