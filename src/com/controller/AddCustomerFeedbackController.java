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

import com.dao.ConnectionDao;
import com.dao.CustomerFeedbackDao;
import com.entity.FeedbackEntity;

@WebServlet("/addcustomerfeedback")
public class AddCustomerFeedbackController extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try 
		{			
			CustomerFeedbackDao d1= new CustomerFeedbackDao();
			FeedbackEntity feedback= new FeedbackEntity();
			
			feedback.setName(req.getParameter("name"));
			feedback.setEmailid(req.getParameter("emailid"));
			feedback.setMobileno(Long.parseLong(req.getParameter("mobileno")));
			feedback.setMessage(req.getParameter("message"));
			ConnectionDao.logActivity("AddCustomerFeedbackController: "+feedback);
			
			boolean b= d1.insertCustomerFeedback(feedback);
			ConnectionDao.logActivity("AddCustomerFeedbackController: "+b);
			
			RequestDispatcher rd= req.getRequestDispatcher("homepage");			
			if(b)
			{
				req.setAttribute("action", "Feedback sent successfully");
				rd.forward(req, res);
			}
			else
			{
				req.setAttribute("action", "Unable to send Feedback. Please try again.");
				rd.forward(req, res);
			}
		
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("AddCustomerFeedbackController Exception: "+e);
		}
	}
}
