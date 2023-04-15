package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Register() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		String gender = request.getParameter("gender");
		Part userPhoto = request.getPart("userPhoto");
		Date date = new Date();
		System.out.println(userPhoto);
		
		
		User user = new User(userName, userEmail, userPassword, gender, userPhoto.getSubmittedFileName(), date.toString());
		
		try {
			
			
			String path = "C:/Users/hp/eclipse-workspace/TechBlog/src/main/webapp/pics/" + userPhoto.getSubmittedFileName();
			InputStream is = userPhoto.getInputStream();
			byte b[] = new byte[is.available()];
			is.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			
			fos.write(b);
			fos.flush();
			fos.close();
//			
//			
			System.out.println("Path===>" + userPhoto.getInputStream().toString());
//			
			
			
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		try { 
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:8809/techblog","root","1234");
			String q = "insert into new_table(userName,userEmail,userPassword,userGender,userPhoto,userRegDate) values(?,?,?,?,?,?)";
			

			PreparedStatement pstm = cn.prepareStatement(q);
			pstm.setString(1, userName);
			pstm.setString(2,userEmail);
			pstm.setString(3, userPassword);
			pstm.setString(4,gender);
			pstm.setString(5, userPhoto.getSubmittedFileName());
			pstm.setString(6,date.toString());
			
			pstm.executeUpdate();
			
			
		
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
