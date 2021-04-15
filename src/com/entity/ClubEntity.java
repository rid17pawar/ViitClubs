package com.entity;

public class ClubEntity 
{
//	private byte[] clubicon;
	private int clubid;
	private String clubacronym;
	private String clubname;
	private String clubdescription;
	private String clubvision;
	private String clubmission;
	private String clubobjectives;
	private String clubstaff;
	private String instagramlink;
	private String twitterlink;
	private String facebooklink;
	private String linkedinlink;
	private String categories;
//	
//	public byte[] getClubicon() {
//		return clubicon;
//	}
//	public void setClubicon(byte[] icon) {
//		this.clubicon = icon;
//	}
	public int getClubid() {
		return clubid;
	}
	public void setClubid(int clubid) {
		this.clubid = clubid;
	}
	public String getClubacronym() {
		return clubacronym;
	}
	public void setClubacronym(String clubacronym) {
		this.clubacronym = clubacronym;
	}
	public String getClubname() {
		return clubname;
	}
	public void setClubname(String clubname) {
		this.clubname = clubname;
	}
	public String getClubdescription() {
		return clubdescription;
	}
	public void setClubdescription(String clubdescription) {
		this.clubdescription = clubdescription;
	}
	public String getClubvision() {
		return clubvision;
	}
	public void setClubvision(String clubvision) {
		this.clubvision = clubvision;
	}
	public String getClubmission() {
		return clubmission;
	}
	public void setClubmission(String clubmission) {
		this.clubmission = clubmission;
	}
	public String getClubobjectives() {
		return clubobjectives;
	}
	public void setClubobjectives(String clubobjectives) {
		this.clubobjectives = clubobjectives;
	}
	public String getClubstaff() {
		return clubstaff;
	}
	public void setClubstaff(String clubstaff) {
		this.clubstaff = clubstaff;
	}
	public String getInstagramlink() {
		return instagramlink;
	}
	public void setInstagramlink(String instagramlink) {
		this.instagramlink = instagramlink;
	}
	public String getTwitterlink() {
		return twitterlink;
	}
	public void setTwitterlink(String twitterlink) {
		this.twitterlink = twitterlink;
	}
	public String getFacebooklink() {
		return facebooklink;
	}
	public void setFacebooklink(String facebooklink) {
		this.facebooklink = facebooklink;
	}
	public String getLinkedinlink() {
		return linkedinlink;
	}
	public void setLinkedinlink(String linkedinlink) {
		this.linkedinlink = linkedinlink;
	}	
	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	
	@Override
	public String toString() {
		return "ClubEntity [clubid="+clubid+", clubacronym=" + clubacronym + ", clubname=" + clubname + ", clubdescription="
				+ clubdescription + ", clubvision=" + clubvision + ", clubmission=" + clubmission + ", clubobjectives="
				+ clubobjectives + ", clubstaff=" + clubstaff + ", instagramlink=" + instagramlink + ", twitterlink="
				+ twitterlink + ", facebooklink=" + facebooklink + ", linkedinlink=" + linkedinlink +", categories=" + categories + "]";
	}
		
}
