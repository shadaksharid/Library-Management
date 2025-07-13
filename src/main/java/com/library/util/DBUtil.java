package com.library.util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	private static final String URL = "jdbc:mysql://localhost:3306/library_db";
	private static final String USER = "shadak";
	private static final String PASSWORD  ="Shadak@2004";
	
	public static Connection getConnection() throws Exception{
		System.out.println("Loading MySQL driver...");
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Loaded MySQL driver successfully.");

		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
	
}
