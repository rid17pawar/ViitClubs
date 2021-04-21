package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ConnectionDao;
import com.dao.CustomerFeedbackDao;

@WebServlet("/showcustomerfeedbacks")
public class ShowCustomerFeedbacks extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{	
			CustomerFeedbackDao d1= new CustomerFeedbackDao();
		
			ConnectionDao.logActivity("ShowCustomerFeedbacks: ");
			
			RequestDispatcher rd= req.getRequestDispatcher("viewcustomerfeedbacks");			
			req.setAttribute("feedbackData", d1.readAllCustomerFeedbacks());
			rd.forward(req, res);
			
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ShowCustomerFeedbacks Exception: "+e);
		} 
	}
}

