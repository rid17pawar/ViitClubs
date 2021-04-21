package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ClubDao;
import com.dao.ConnectionDao;
import com.entity.ClubEntity;

@WebServlet("/clubDetails")
public class ShowClubDetailsController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{	
			ClubDao d1= new ClubDao();
		
			int id=Integer.parseInt(req.getParameter("id"));
			ConnectionDao.logActivity("ShowClubDetailsController: "+id);
			ClubEntity c1= d1.getClubDetails(id);
			if(c1!=null)
			{
				RequestDispatcher rd= req.getRequestDispatcher("viewshowclubdetails");
				req.setAttribute("club", c1);
				rd.forward(req, res);
			}
			else
			{
				RequestDispatcher rd= req.getRequestDispatcher("website");
				req.setAttribute("clubsCount", d1.countAllClubs());
				ConnectionDao.logActivity("ShowClubDetailsController: couldnt show club details of "+id);
				
				req.setAttribute("clubsData", d1.readAllClubsDetails());
				rd.forward(req, res);
			}
			
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ShowClubDetailsController Exception: "+e);
		} 
	}
}
