package com.entity;

public class FeedbackEntity 
{
	private int feedbackid;
	private String name;
	private String emailid;
	private Long mobileno;
	private String message;
	
	public int getFeedbackid() {
		return feedbackid;
	}
	public void setFeedbackid(int feedbackid) {
		this.feedbackid = feedbackid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public Long getMobileno() {
		return mobileno;
	}
	public void setMobileno(Long mobileno) {
		this.mobileno = mobileno;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@Override
	public String toString() {
		return "FeedbackEntity [id="+feedbackid+", name=" + name + ", emailid=" + emailid + ", mobileno=" + mobileno + ", message="
				+ message + "]";
	}

}
