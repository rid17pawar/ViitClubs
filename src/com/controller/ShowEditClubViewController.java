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

@WebServlet("/editclub")
public class ShowEditClubViewController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{
			ClubDao d1= new ClubDao();
			
			int id=Integer.parseInt(req.getParameter("id"));
			ConnectionDao.logActivity("EditClubController: "+id);
			ClubEntity c1= d1.getClubDetails(id);
			if(c1!=null)
			{
				RequestDispatcher rd= req.getRequestDispatcher("editclubview");
				req.setAttribute("editableClub", c1);
				req.setAttribute("action", "Club Details are in Editable Mode");
				rd.forward(req, res);
			}
			else
			{
				RequestDispatcher rd= req.getRequestDispatcher("admindashboard");
				req.setAttribute("clubsData", d1.readAllClubsDetails());
				req.setAttribute("action", "Unable to edit Club Details. Please try again.");
				rd.forward(req, res);
			}
			
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("EditClubController Exception: "+e);
		}
	}
}
