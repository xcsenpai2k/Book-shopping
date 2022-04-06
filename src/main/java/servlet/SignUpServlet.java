package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import connection.*;
import dao.UserDao;
import model.User;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String sdt = request.getParameter("sdt");
		String address = request.getParameter("address");
		String pass = request.getParameter("pass");
		String re_pass = request.getParameter("repass");
		if(!pass.equals(re_pass)) {
			response.sendRedirect("login.jsp");
		} else {
			try {
				UserDao userDao = new UserDao(DbCon.getConnection());
				User u = userDao.checkAccountExist(email);
				if(u==null) {
					//dc signup
					userDao.signup(name,email,pass,sdt,address);
					response.sendRedirect("index.jsp");
				}else {
					response.sendRedirect("login.jsp");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block	
			}
			
		}
	}

}
