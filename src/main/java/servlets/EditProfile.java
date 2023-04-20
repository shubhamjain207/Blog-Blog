package servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    
    public EditProfile() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession httpsess = request.getSession();
		
		String userName = (request.getParameter("userName") != null) ? (String) request.getParameter("userName") : (String) httpsess.getAttribute("currentUserName");
		String userEmail = (request.getParameter("userEmail") != null) ? (String) request.getParameter("userEmail") : (String) httpsess.getAttribute("currentUserEmail");
		String userPassword = (request.getParameter("userPassword") != null) ? (String) request.getParameter("userPassword") : (String) httpsess.getAttribute("currentUserPassword");
		String userGender = (request.getParameter("userGender") != null) ? (String) request.getParameter("userGender") : (String) httpsess.getAttribute("currentUserGender");
		Part userPhotoFile = request.getPart("userPhoto");
		String userPhoto = (userPhotoFile!=null) ? userPhotoFile.getSubmittedFileName() : (String) httpsess.getAttribute("currentUserPhoto");
		int userId = Integer.parseInt((String) httpsess.getAttribute("currentUserId"));
		
	
		
		try {
			if(userPhotoFile!=null) {
				
			String path = "C:/Users/hp/eclipse-workspace/TechBlog/src/main/webapp/pics/" + userPhotoFile.getSubmittedFileName();
			InputStream is = userPhotoFile.getInputStream();
			byte b[] = new byte[is.available()];
			is.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			
			fos.write(b);
			fos.flush();
			fos.close();
			
			
			}
		
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:8809/techblog","root","1234");
			String q = "update new_table set userName=?, userEmail=?, userPassword=?, userGender=?, userPhoto=? where userId=?";
			PreparedStatement pstm = cn.prepareStatement(q);
			pstm.setString(1, userName);
			pstm.setString(2, userEmail);
			pstm.setString(3, userPassword);
			pstm.setString(4, userGender);
			pstm.setString(5, userPhoto);
			pstm.setInt(6, userId);
			
			pstm.executeUpdate();
			
			HttpSession httpses = request.getSession();
			httpses.setAttribute("currentUserEmail", userEmail);
			httpses.setAttribute("currentUserName",userName );
			httpses.setAttribute("currentUserGender", userGender);
			httpses.setAttribute("currentUserPassword", userPassword);
			httpses.setAttribute("currentUserPhoto",userPhoto );
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	}

}
