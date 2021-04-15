package com.dao;

import java.sql.*;

public class ConnectionDao 
{
	//getConnectionClubs() method returns connection obj
	static Connection getConnectionClubs()
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/clubs", "root", ""); //connection to clubs database
			return con;
		}
		catch(Exception e)
		{	
			logActivity("ConnectionDao Exception: "+e);	
			return null;
		}
	}
	
	public static void logActivity(String msg)
	{
		System.out.println("["+msg+"]");
	}
	
}
