package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Home1")
public class Home1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Home1() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String blogpostcontent = request.getParameter("blogpost");
		String blogTag = request.getParameter("tags");
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
		LocalDateTime now = LocalDateTime.now();  
		String date = dtf.format(now);
		
		   
		
		
		
		try { 
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:8809/techblog","root","1234");
			String q = "insert into blogposts(user_id_blog,blog_content,blog_tag,blog_date_time) values(?,?,?,?)";
			

			HttpSession httpsess = request.getSession();
			String currentUser =  (String) httpsess.getAttribute("currentUserEmail");
			
			
			PreparedStatement pstm = cn.prepareStatement(q);
			pstm.setString(1, currentUser);
			pstm.setString(2,blogpostcontent);
			pstm.setString(3,blogTag);
			pstm.setString(4,date);
			
			
			pstm.executeUpdate();
			
			response.sendRedirect(request.getContextPath() + "/Home.jsp");
		
//			String path1 = System. getProperty("user. dir");
//			System.out.println("PATH==========>" + path1);
//			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}


		
		
	}

}
