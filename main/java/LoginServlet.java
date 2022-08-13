import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
/**
 * @see HttpServlet#HttpServlet()
 */
    public LoginServlet() {
        super();
    }

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String User = null;
		String UserName = request.getParameter("User");
		String Password = request.getParameter("Password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EnglishDAM", "root", "root");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from users where User=" + UserName + " and Password=" + Password);
			
			if(rs.isBeforeFirst()) {
				rs.next();
				User = rs.getString(UserName);
				response.sendRedirect("/FinalTask/src/main/webapp/Main.jsp");
			}else {
				response.sendRedirect("/FinalTask/src/main/webapp/Log.jsp");
			}
			
			con.close();
		}catch(Exception error) {
			System.err.println(error);
		}
	}

}
