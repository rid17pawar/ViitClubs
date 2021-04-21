package com.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dao.ClubDao;
import com.dao.ConnectionDao;
import com.entity.ClubEntity;

//1.5MB filesize
@WebServlet("/editedclubdata")
@MultipartConfig(maxFileSize = 16177216)
public class EditClubController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{	
			ConnectionDao.logActivity("EditClubController:  tags: "+req.getParameter("tags-1"));
			
			ClubDao d1= new ClubDao();
			ClubEntity club= new ClubEntity();
			InputStream istream;

			club.setClubid(Integer.parseInt(req.getParameter("id")));
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
			ConnectionDao.logActivity("EditClubController: "+club);
			
			String strerror;
			Part filepart=req.getPart("clubicon");
			
			if(filepart.getSize()!=0)
			{
				ConnectionDao.logActivity("EditClubController:  filepart: "+filepart.getName()+", "+filepart.getSize()+", "+filepart.getContentType());
				istream= filepart.getInputStream();
				
				strerror= d1.editClubDetails(club, istream);
				ConnectionDao.logActivity("EditClubController: "+strerror);
			}
			else
			{
				//File imageFile= new File("/images/defaultClubIcon.png");
				istream= getServletContext().getResourceAsStream("/images/defaultClubIcon.jpg");
				ConnectionDao.logActivity("EditClubController: "+getServletContext());
				
				strerror= d1.editClubDetailsWithoutImage(club);
				ConnectionDao.logActivity("EditClubController: "+strerror);
			}
			
			RequestDispatcher rd= req.getRequestDispatcher("admindashboard");
			req.setAttribute("clubsData", d1.readAllClubsDetails());
			
			if(strerror.equals(""))
			{
				req.setAttribute("action", "Club edited successfully");
				rd.forward(req, res);
			}
			else
			{
				req.setAttribute("action", "Unable to edit Club. Please try again.");
				rd.forward(req, res);
			}
		
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("EditClubController Exception: "+e);
		}
	}
}
