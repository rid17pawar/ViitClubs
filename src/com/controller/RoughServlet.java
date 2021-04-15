package com.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ConnectionDao;

@WebServlet("/demo")
public class RoughServlet extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{
			ConnectionDao.logActivity("tags: "+req.getParameter("tags-1"));
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("RoughServlet Exception: "+e);
		}
	}	
}
