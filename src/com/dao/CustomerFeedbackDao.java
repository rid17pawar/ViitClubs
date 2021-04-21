package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.ClubEntity;
import com.entity.FeedbackEntity;

public class CustomerFeedbackDao {

	public boolean insertCustomerFeedback(FeedbackEntity feedback) 
	{
		try
		{
			ConnectionDao.logActivity("CustomerFeedbackDao insertCustomerFeedback(): "+feedback);
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("insert into feedback(name,emailid,mobileno,message) values(?,?,?,?)");
			//id column is auto-increment
			pt.setString(1, feedback.getName());
			pt.setString(2, feedback.getEmailid());
			pt.setLong(3, feedback.getMobileno());
			pt.setString(4, feedback.getMessage());
			int i= pt.executeUpdate();
			ConnectionDao.logActivity("CustomerFeedbackDao insertCustomerFeedback(): "+i);
			if(i==1)
			{	
				con.close();
				return true;   
			}
			else
			{	
				con.close();
				return false;  
			}
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("CustomerFeedbackDao insertCustomerFeedback() Exception: "+e);
			return false;
		}
	}

	public ArrayList<FeedbackEntity> readAllCustomerFeedbacks()
	{
		try
		{
			ConnectionDao.logActivity("CustomerFeedbackDao readAllCustomerFeedbacks(): ");
			Connection con= ConnectionDao.getConnectionClubs();
			Statement st= con.createStatement();
			ResultSet rs= st.executeQuery("select * from feedback");
			
			ArrayList<FeedbackEntity> feedbacks= new ArrayList<FeedbackEntity>();
			FeedbackEntity temp;
			while(rs.next())
			{
				temp= new FeedbackEntity();
				temp.setFeedbackid(rs.getInt(1));
				temp.setName(rs.getString(2));
				temp.setEmailid(rs.getString(3));
				temp.setMobileno(rs.getLong(4));
				temp.setMessage(rs.getString(5));
				feedbacks.add(temp); 
				ConnectionDao.logActivity(""+temp);
			}
			con.close();
			return feedbacks; 
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("CustomerFeedbackDao readAllCustomerFeedbacks() Exception: "+e);
			return null;
		}
	}

}
