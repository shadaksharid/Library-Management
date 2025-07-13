package com.library.dao;

import java.sql.*;
import java.util.*;

import com.library.model.Book;
import com.library.util.DBUtil;


public class BookDAO {
	public void addBook(Book book) throws Exception {
        Connection conn = DBUtil.getConnection();
        String sql = "INSERT INTO books (title, author, genre, isbn, year, available, cover_image, copies) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, book.getTitle());
        stmt.setString(2, book.getAuthor());
        stmt.setString(3, book.getGenre());
        stmt.setString(4, book.getIsbn());
        stmt.setInt(5, book.getYear());
        stmt.setBoolean(6, book.getAvailable());
        stmt.setString(7, book.getCoverImage());
        stmt.setInt(8,  book.getCopies());
        stmt.executeUpdate();
    }
	
	public List<Book> getAllBooks() throws Exception {
        List<Book> books = new ArrayList<>();
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM books";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Book book = new Book();
            book.setId(rs.getInt("id"));
            book.setTitle(rs.getString("title"));
            book.setAuthor(rs.getString("author"));
            book.setGenre(rs.getString("genre"));
            book.setIsbn(rs.getString("isbn"));
            book.setYear(rs.getInt("year"));
            book.setAvailable(rs.getBoolean("available"));
            book.setCoverImage(rs.getString("cover_image"));
            book.setCopies(rs.getInt("copies"));
            books.add(book);
        }
        return books;
    }
	
	public void deleteBook(int id) throws Exception {
        Connection conn = DBUtil.getConnection();
        String sql = "DELETE FROM books WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        stmt.executeUpdate();
    }
	
	public void updateBook(Book book) throws Exception {
        Connection conn = DBUtil.getConnection();
        String sql = "UPDATE books SET title = ?, author = ?, genre = ?, isbn = ?, year = ?, available = ?, copies = ? WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, book.getTitle());
        stmt.setString(2, book.getAuthor());
        stmt.setString(3, book.getGenre());
        stmt.setString(4, book.getIsbn());
        stmt.setInt(5, book.getYear());
        stmt.setBoolean(6, book.getAvailable());
        stmt.setInt(7, book.getCopies());
        stmt.setInt(8, book.getId());
        stmt.executeUpdate();
    }
	
	public Book getBookById(int id) throws Exception {
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM books WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            Book book = new Book();
            book.setId(rs.getInt("id"));
            book.setTitle(rs.getString("title"));
            book.setAuthor(rs.getString("author"));
            book.setGenre(rs.getString("genre"));
            book.setIsbn(rs.getString("isbn"));
            book.setYear(rs.getInt("year"));
            book.setAvailable(rs.getBoolean("available"));
            book.setCoverImage(rs.getString("cover_image"));
            book.setCopies(rs.getInt("copies"));
            return book;
        }
        return null;
    }
	
	public List<Book> searchBooks(String title, String author, String genre, String available) throws Exception {
	    List<Book> books = new ArrayList<>();
	    StringBuilder query = new StringBuilder("SELECT * FROM books WHERE 1=1");

	    if (title != null && !title.isEmpty())
	        query.append(" AND title LIKE ?");
	    if (author != null && !author.isEmpty())
	        query.append(" AND author LIKE ?");
	    if (genre != null && !genre.isEmpty())
	        query.append(" AND genre LIKE ?");
	    if (available != null && !available.isEmpty())
	        query.append(" AND available = ?");

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query.toString())) {

	        int index = 1;
	        if (title != null && !title.isEmpty())
	            stmt.setString(index++, "%" + title + "%");
	        if (author != null && !author.isEmpty())
	            stmt.setString(index++, "%" + author + "%");
	        if (genre != null && !genre.isEmpty())
	            stmt.setString(index++, "%" + genre + "%");
	        if (available != null && !available.isEmpty())
	            stmt.setInt(index++, Integer.parseInt(available));

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Book book = new Book();
	            book.setId(rs.getInt("id"));
	            book.setTitle(rs.getString("title"));
	            book.setAuthor(rs.getString("author"));
	            book.setGenre(rs.getString("genre"));
	            book.setIsbn(rs.getString("isbn"));
	            book.setYear(rs.getInt("year"));
	            book.setAvailable(rs.getBoolean("available"));
	            book.setCoverImage(rs.getString("cover_image"));
	            book.setCopies(rs.getInt("copies"));
	            books.add(book);
	        }
	    }

	    return books;
	    
	}

}
