package com.library.dao;

import com.library.model.BorrowRecord;
import com.library.util.DBUtil;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BorrowDAO {

	public boolean issueBook(BorrowRecord record) throws Exception {
	    Connection conn = DBUtil.getConnection();

	    // Step 1: Check available copies
	    String checkSql = "SELECT copies FROM books WHERE id = ?";
	    PreparedStatement checkStmt = conn.prepareStatement(checkSql);
	    checkStmt.setInt(1, record.getBookId());
	    ResultSet rs = checkStmt.executeQuery();

	    if (rs.next() && rs.getInt("copies") > 0) {
	        // Step 2: Insert into borrow_records
	        String insertSql = "INSERT INTO borrow_records (book_id, member_id, borrow_date, due_date) VALUES (?, ?, ?, ?)";
	        PreparedStatement insertStmt = conn.prepareStatement(insertSql);
	        insertStmt.setInt(1, record.getBookId());
	        insertStmt.setInt(2, record.getMemberId());
	        insertStmt.setDate(3, new java.sql.Date(record.getBorrowDate().getTime()));
	        insertStmt.setDate(4, new java.sql.Date(record.getDueDate().getTime()));
	        insertStmt.executeUpdate();

	        // Step 3: Decrement book copy count
	        String updateSql = "UPDATE books SET copies = copies - 1 WHERE id = ?";
	        PreparedStatement updateStmt = conn.prepareStatement(updateSql);
	        updateStmt.setInt(1, record.getBookId());
	        updateStmt.executeUpdate();

	        return true;
	    }

	    return false;
	}

	public boolean returnBook(int borrowId) throws Exception {
	    Connection conn = DBUtil.getConnection();

	    String selectSQL = "SELECT due_date FROM borrow_records WHERE id = ? AND return_date IS NULL";
	    String updateSQL = "UPDATE borrow_records SET return_date = ?, fine = ? WHERE id = ?";
	    String updateCopiesSQL = "UPDATE books SET copies = copies + 1 WHERE id = (SELECT book_id FROM borrow_records WHERE id = ?)";

	    PreparedStatement selectStmt = conn.prepareStatement(selectSQL);
	    selectStmt.setInt(1, borrowId);
	    ResultSet rs = selectStmt.executeQuery();

	    if (rs.next()) {
	        Date dueDate = rs.getDate("due_date");
	        Date today = Date.valueOf(LocalDate.now());

	        long overdueDays = ChronoUnit.DAYS.between(dueDate.toLocalDate(), today.toLocalDate());
	        double fine = overdueDays > 0 ? overdueDays * 5.0 : 0.0;

	        PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
	        updateStmt.setDate(1, today);
	        updateStmt.setDouble(2, fine);
	        updateStmt.setInt(3, borrowId);
	        updateStmt.executeUpdate();

	        // Increase copies of the returned book
	        PreparedStatement updateCopiesStmt = conn.prepareStatement(updateCopiesSQL);
	        updateCopiesStmt.setInt(1, borrowId);
	        updateCopiesStmt.executeUpdate();

	        return true;
	    }

	    return false;
	}
	
	public List<BorrowRecord> getBorrowRecordsByUser(int memberId) throws Exception {
	    List<BorrowRecord> records = new ArrayList<>();
	    Connection conn = DBUtil.getConnection();
	    String sql = "SELECT * FROM borrow_records WHERE member_id = ?";
	    PreparedStatement stmt = conn.prepareStatement(sql);
	    stmt.setInt(1, memberId);
	    ResultSet rs = stmt.executeQuery();

	    while (rs.next()) {
	        BorrowRecord record = new BorrowRecord();
	        record.setId(rs.getInt("id"));
	        record.setBookId(rs.getInt("book_id"));
	        record.setMemberId(rs.getInt("member_id"));
	        record.setBorrowDate(rs.getDate("borrow_date"));
	        record.setDueDate(rs.getDate("due_date"));
	        record.setReturnDate(rs.getDate("return_date"));
	        record.setFine(rs.getDouble("fine"));
	        records.add(record);
	    }

	    return records;
	}
	
	public boolean hasBorrowRecords(int id) throws Exception {
	    Connection conn = DBUtil.getConnection();
	    String sql = "SELECT COUNT(*) FROM borrow_records WHERE book_id = ?";
	    PreparedStatement stmt = conn.prepareStatement(sql);
	    stmt.setInt(1, id);
	    ResultSet rs = stmt.executeQuery();
	    if (rs.next()) {
	        return rs.getInt(1) > 0;
	    }
	    return false;
	}

}
