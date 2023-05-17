package servlets;

public class BlogPost {
	public String blogContent;
	public String blogUserEmail;
	public String blogTag;
	
	public BlogPost(String content, String email, String tag){
		
		this.blogContent = content;
		this.blogUserEmail = email;
		this.blogTag = tag;
	}

	public String getBlogTag() {
		return blogTag;
	}

	public void setBlogTag(String blogTag) {
		this.blogTag = blogTag;
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
