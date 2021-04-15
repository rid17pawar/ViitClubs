package com.controller;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ClubDao;
import com.dao.ConnectionDao;

@WebServlet("/showicon")
public class ShowIconController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{	
			ClubDao d1= new ClubDao();
		
			int id=Integer.parseInt(req.getParameter("id"));
			ConnectionDao.logActivity("ShowIconController: "+id);
			byte[] iconData= d1.getIcon(id);
			if(iconData!=null)
			{
				ServletOutputStream outstream=res.getOutputStream();
				outstream.write(iconData);
			}
			
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ShowIconController Exception: "+e);
		} 
	}
}
