package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ClubDao;
import com.dao.ConnectionDao;
import com.entity.ClubEntity;

@WebServlet("/reasonstojoinclub")
public class ShowReasonsToJoinClub extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{	
			ConnectionDao.logActivity("ShowReasonsToJoinClub: ");

			RequestDispatcher rd= req.getRequestDispatcher("viewreasonstojoinclub");
			rd.forward(req, res);			
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ShowReasonsToJoinClub Exception: "+e);
		} 
	}
}

