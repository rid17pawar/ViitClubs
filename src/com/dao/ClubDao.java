package com.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.ClubEntity;

public class ClubDao 
{

	public boolean insertClubDetails(ClubEntity club, InputStream istream)
	{
		try
		{
			ConnectionDao.logActivity("ClubDao insertClubDetails(): "+club+", icon= "+istream);
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("insert into club(icon,acronym,name,description,vision,mission,objectives,staff,instagramlink,twitterlink,facebooklink,linkedinlink,isdeleted,categories) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			//id column is auto-increment
			pt.setBlob(1, istream);
			pt.setString(2, club.getClubacronym());
			pt.setString(3, club.getClubname());
			pt.setString(4, club.getClubdescription());
			pt.setString(5, club.getClubvision());
			pt.setString(6, club.getClubmission());
			pt.setString(7, club.getClubobjectives());
			pt.setString(8, club.getClubstaff());
			pt.setString(9, club.getInstagramlink());
			pt.setString(10, club.getTwitterlink());
			pt.setString(11, club.getFacebooklink());
			pt.setString(12, club.getLinkedinlink());
			pt.setInt(13, 0); //isdeleted= no
			pt.setString(14, club.getCategories());
			int i= pt.executeUpdate();
			ConnectionDao.logActivity("ClubDao insertClubDetails(): "+i);
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
			ConnectionDao.logActivity("ClubDao insertClubDetails() Exception: "+e);
			return false;
		}
	}
	
	
	
	public ArrayList<ClubEntity> readAllClubsDetails()
	{
		try
		{
			ConnectionDao.logActivity("ClubDao readAllClubsDetails(): ");
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("select * from club where isdeleted=?");
			pt.setInt(1, 0);
			ResultSet rs= pt.executeQuery();
			
			ArrayList<ClubEntity> clubs= new ArrayList<ClubEntity>();
			ClubEntity temp;
			while(rs.next())
			{
				temp= new ClubEntity();
				temp.setClubid(rs.getInt(1));
				temp.setClubacronym(rs.getString(3));
				temp.setClubname(rs.getString(4));
				temp.setClubdescription(rs.getString(5));
				temp.setClubvision(rs.getString(6));
				temp.setClubmission(rs.getString(7));
				temp.setClubobjectives(rs.getString(8));
				temp.setClubstaff(rs.getString(9));
				temp.setInstagramlink(rs.getString(10));
				temp.setTwitterlink(rs.getString(11));
				temp.setFacebooklink(rs.getString(12));
				temp.setLinkedinlink(rs.getString(13));
				temp.setCategories(rs.getString(15));
				clubs.add(temp); 
				ConnectionDao.logActivity(""+temp);
			}
			con.close();
			return clubs; 
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ClubDao readAllClubsDetails() Exception: "+e);
			return null;
		}
	}
	

	public byte[] getIcon(int id) 
	{
		try
		{
			byte[] icon;
			
			ConnectionDao.logActivity("ClubDao getIcon(): "+id);
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("select icon from club where id=?");
			pt.setInt(1, id);
			ResultSet rs= pt.executeQuery();
			
			if(rs.next())
			{
				icon= rs.getBytes(1);
				return icon;
			}
			else
			{
				return null;
			}
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ClubDao readAllClubsDetails() Exception: "+e);
			return null;
		}
	}

	
	public String deleteClub(int id)
	{
		String strError="";
		try
		{
			ConnectionDao.logActivity("ClubDao deleteClub(): "+id);
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("update club set isdeleted=1 where id=?");
			pt.setInt(1, id);
			int i= pt.executeUpdate();
			ConnectionDao.logActivity("ClubDao deleteClub(): "+i);
			return strError;
		}
		catch(Exception e)
		{
			strError=""+e;
			ConnectionDao.logActivity("ClubDao deleteClub() Exception: "+e);
			return strError;
		}
	}
	
	public ClubEntity getClubDetails(int id)
	{
		try
		{
			ConnectionDao.logActivity("ClubDao getClubDetails(): ");
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("select * from club where id=?");
			pt.setInt(1, id);
			ResultSet rs= pt.executeQuery();
			
			ClubEntity temp= new ClubEntity();
			if(rs.next())
			{
				temp.setClubid(rs.getInt(1));
				temp.setClubacronym(rs.getString(3));
				temp.setClubname(rs.getString(4));
				temp.setClubdescription(rs.getString(5));
				temp.setClubvision(rs.getString(6));
				temp.setClubmission(rs.getString(7));
				temp.setClubobjectives(rs.getString(8));
				temp.setClubstaff(rs.getString(9));
				temp.setInstagramlink(rs.getString(10));
				temp.setTwitterlink(rs.getString(11));
				temp.setFacebooklink(rs.getString(12));
				temp.setLinkedinlink(rs.getString(13));
				temp.setCategories(rs.getString(15));
				
				ConnectionDao.logActivity(""+temp);
			}
			con.close();
			return temp; 
		}
		catch(Exception e)
		{
			ConnectionDao.logActivity("ClubDao getClubDetails() Exception: "+e);
			return null;
		}
	}



	public String editClubDetails(ClubEntity club, InputStream istream) 
	{
		String strError="";
		try
		{
			ConnectionDao.logActivity("ClubDao editClubDetails(): "+club+", icon= "+istream);
			Connection con= ConnectionDao.getConnectionClubs();
			PreparedStatement pt= con.prepareStatement("update club set icon=?, acronym=?, name=?, description=?, vision=?, mission=?, objectives=?, staff=?, instagramlink=?, twitterlink=?, facebooklink=?, linkedinlink=?, categories=? where id=?");
			//id column is auto-increment
			pt.setBlob(1, istream);
			pt.setString(2, club.getClubacronym());
			pt.setString(3, club.getClubname());
			pt.setString(4, club.getClubdescription());
			pt.setString(5, club.getClubvision());
			pt.setString(6, club.getClubmission());
			pt.setString(7, club.getClubobjectives());
			pt.setString(8, club.getClubstaff());
			pt.setString(9, club.getInstagramlink());
			pt.setString(10, club.getTwitterlink());
			pt.setString(11, club.getFacebooklink());
			pt.setString(12, club.getLinkedinlink());
			pt.setString(13, club.getCategories());
			pt.setInt(14, club.getClubid());
			int i= pt.executeUpdate();
			ConnectionDao.logActivity("ClubDao editClubDetails(): "+i);
			return strError;
			
		}
		catch(Exception e)
		{
			strError=""+e;
			ConnectionDao.logActivity("ClubDao editClubDetails() Exception: "+e);
			return strError;
		}
	}

	
}
