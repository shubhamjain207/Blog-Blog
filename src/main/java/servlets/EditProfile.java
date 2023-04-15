package servlets;

import java.io.IOException;
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
		
		String userName = (String) request.getParameter("userName");
		String userEmail = (String) request.getParameter("userEmail");
		String userPassword = (String) request.getParameter("userPassword");
		String userGender = (String) request.getParameter("gender");
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		
	
		
		try {
			
		
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:8809/techblog","root","1234");
			String q = "update new_table set userName=?, userEmail=?, userPassword=?, userGender=? where userId=?";
			PreparedStatement pstm = cn.prepareStatement(q);
			pstm.setString(1, userName);
			pstm.setString(2, userEmail);
			pstm.setString(3, userPassword);
			pstm.setString(4, userGender);
			pstm.setInt(5, userId);
			
			pstm.executeUpdate();
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	}

}
