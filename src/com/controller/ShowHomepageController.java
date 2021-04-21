package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ClubDao;
import com.dao.ConnectionDao;
import com.dao.LoginDao;

@WebServlet("/homepage")
public class ShowHomepageController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try
		{
			ClubDao d1= new ClubDao();
			
			ConnectionDao.logActivity("ShowHomepageController: ");

			RequestDispatcher rd= req.getRequestDispatcher("website");
			req.setAttribute("clubsCount", d1.countAllClubs());
			//ConnectionDao.logActivity("ShowWebsiteController: "+ d1.countAllClubs());
			
			req.setAttribute("clubsData", d1.readAllClubsDetails());
			rd.forward(req, res);
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ShowHomepageController Exception: "+e);
		}
	}
}
