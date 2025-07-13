package com.library.dao;
import com.library.model.User;
import com.library.util.DBUtil;
import java.sql.*;

import org.mindrot.jbcrypt.BCrypt;

public class UserDAO {
	public boolean register(User user) throws Exception{
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT * FROM users WHERE email = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, user.getEmail());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			return false;
		}
		
		String sql1 = "INSERT INTO users(name, email, password, role) VALUES(?, ?, ?, ?)";
		PreparedStatement stmt1 = conn.prepareStatement(sql1);
		stmt1.setString(1, user.getName());
		stmt1.setString(2, user.getEmail());
		String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		stmt1.setString(3, hashedPassword);
		stmt1.setString(4, user.getRole());
		
		stmt1.executeUpdate();
		return true;
		
	}
	public User login(String email, String password) {
		User user = null;
		try(Connection conn = DBUtil.getConnection()){
			String sql = "SELECT * FROM users WHERE email = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			
			ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            String hashedPassword = rs.getString("password");

	            if (BCrypt.checkpw(password, hashedPassword)) {
	                user = new User();
	                user.setId(rs.getInt("id"));
	                user.setName(rs.getString("name"));
	                user.setEmail(rs.getString("email"));
	                user.setRole(rs.getString("role"));
	            }
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
