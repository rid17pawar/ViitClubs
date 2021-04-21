package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.ConnectionDao;
import com.dao.ClubDao;
import com.dao.LoginDao;
import com.entity.ClubEntity;

//1.5MB filesize
@WebServlet("/createclub")
@MultipartConfig(maxFileSize = 16177216)
public class CreateClubController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{			
			ConnectionDao.logActivity("CreateClubController:  tags: "+req.getParameter("tags-1"));
			
			ClubDao d1= new ClubDao();
			ClubEntity club= new ClubEntity();
			InputStream istream;
			
			Part filepart=req.getPart("clubicon");
			if(filepart.getSize()!=0)
			{
				ConnectionDao.logActivity("CreateClubController:  filepart: "+filepart.getName()+", "+filepart.getSize()+", "+filepart.getContentType());
				istream= filepart.getInputStream();
			}
			else
			{
				//File imageFile= new File("/images/defaultClubIcon.png");
				istream= getServletContext().getResourceAsStream("/images/defaultClubIcon.jpg");
				ConnectionDao.logActivity("CreateClubController: "+getServletContext());
			}
			
			club.setClubacronym(req.getParameter("clubacronym"));
			club.setClubname(req.getParameter("clubname"));
			club.setClubdescription(req.getParameter("clubdescription"));
			club.setClubvision(req.getParameter("clubvision"));
			club.setClubmission(req.getParameter("clubmission"));
			club.setClubobjectives(req.getParameter("clubobjectives")); //optional
			club.setClubstaff(req.getParameter("clubstaff"));
			club.setInstagramlink(req.getParameter("instagramlink")); //optional
			club.setTwitterlink(req.getParameter("twitterlink")); //optional
			club.setFacebooklink(req.getParameter("facebooklink")); //optional
			club.setLinkedinlink(req.getParameter("linkedinlink")); //optional	
			club.setCategories(req.getParameter("tags-1"));
			ConnectionDao.logActivity("CreateClubController: "+club);
			
			boolean b= d1.insertClubDetails(club, istream);
			ConnectionDao.logActivity("CreateClubController: "+b);
			
			RequestDispatcher rd= req.getRequestDispatcher("admindashboard");
			req.setAttribute("clubsData", d1.readAllClubsDetails());
			
			if(b)
			{
				req.setAttribute("action", "Club created successfully");
				rd.forward(req, res);
			}
			else
			{
				req.setAttribute("action", "Unable to create Club. Please try again.");
				rd.forward(req, res);
			}
		
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("CreateClubController Exception: "+e);
		}
	}
}
