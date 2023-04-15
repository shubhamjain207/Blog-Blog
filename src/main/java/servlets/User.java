package servlets;

public class User {

	
	public String userName;
	public String userEmail;
	public String userPassword;
	public String userGender;
	public String userPhoto;
	public String userRegDate;
	
	
	public User(String userName, String userEmail, String userPassword, String userGender,String userPhoto,
			String userRegDate) {
		
		
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userGender = userGender;
		this.userName = userName;
		this.userPhoto = userPhoto;
		this.userRegDate = userRegDate;
	}
	
	
	public String getUserPhoto() {
		return userPhoto;
	}


	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}


	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(String userRegDate) {
		this.userRegDate = userRegDate;
	}
	
	
}
