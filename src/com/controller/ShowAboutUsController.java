package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ConnectionDao;

@WebServlet("/aboutus")
public class ShowAboutUsController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{	
			ConnectionDao.logActivity("ShowAboutUsController: ");

			RequestDispatcher rd= req.getRequestDispatcher("viewaboutus");
			rd.forward(req, res);			
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ShowAboutUsController Exception: "+e);
		} 
	}
}