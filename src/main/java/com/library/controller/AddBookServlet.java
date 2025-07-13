package com.library.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;



import com.library.dao.BookDAO;
import com.library.model.Book;

/**
 * Servlet implementation class AddBookServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024)
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String genre = request.getParameter("genre");
            String isbn = request.getParameter("isbn");
            int year = Integer.parseInt(request.getParameter("year"));
            boolean available = request.getParameter("available") != null;
            Part filePart = request.getPart("coverImage");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            int copies = Integer.parseInt(request.getParameter("copies"));

            
            String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String filePath = uploadDir + File.separator + fileName;
            if (!fileName.isEmpty()) {
                filePart.write(filePath);
            }

            Book book = new Book();
            book.setTitle(title);
            book.setAuthor(author);
            book.setGenre(genre);
            book.setIsbn(isbn);
            book.setYear(year);
            book.setAvailable(available);
            book.setCoverImage(fileName);
            book.setCopies(copies);

            BookDAO dao = new BookDAO();
            dao.addBook(book);

            request.setAttribute("message", "Book added successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error adding book.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("librarian/add-book.jsp");
        dispatcher.forward(request, response);
	}

}
