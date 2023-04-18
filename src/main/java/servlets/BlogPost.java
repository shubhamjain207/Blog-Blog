package servlets;

public class BlogPost {
	public String blogContent;
	public String blogUserEmail;
	
	public BlogPost(String content, String email){
		
		this.blogContent = content;
		this.blogUserEmail = email;
		
	}

	public String getBlogContent() {
		return blogContent;
	}

	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}

	public String getBlogUserEmail() {
		return blogUserEmail;
	}

	public void setBlogUserEmail(String blogUserEmail) {
		this.blogUserEmail = blogUserEmail;
	}
	
	
	
}
