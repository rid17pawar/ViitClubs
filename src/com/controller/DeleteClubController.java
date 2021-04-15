package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ClubDao;
import com.dao.ConnectionDao;

@WebServlet("/deleteclub")
public class DeleteClubController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{
			ClubDao d1= new ClubDao();
			
			int id=Integer.parseInt(req.getParameter("id"));
			ConnectionDao.logActivity("DeleteClubController: "+id);
			String strerror= d1.deleteClub(id);
			ConnectionDao.logActivity("DeleteClubController: "+strerror);
			
			RequestDispatcher rd= req.getRequestDispatcher("admindashboard");
			req.setAttribute("clubsData", d1.readAllClubsDetails());
			if(strerror.equals(""))
			{
				req.setAttribute("action", "Club deleted successfully");
			}
			else
			{
				req.setAttribute("action", "Unable to delete Club. Please try again.");
			}
			rd.forward(req, res);
			
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("DeleteClubController Exception: "+e);
		}
	}
}
