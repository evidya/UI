package com.edu.portal.model;

public enum UserProfileType {
	USER("USER"),
	DBA("TEACHER"),
	ADMIN("STUDENT");
	
	String userProfileType;
	
	private UserProfileType(String userProfileType){
		this.userProfileType = userProfileType;
	}
	
	public String getUserProfileType(){
		return userProfileType;
	}
	
}
