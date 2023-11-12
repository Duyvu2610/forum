package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import model.User;
import service.ForumService;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ForumService forumService = new ForumService();

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Login.jsp").forward(request, response);;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String status = "";
		User user =forumService.checkUser(userName, password);
		
		if ( user != null) {
			status = "success";
			request.setAttribute("status", status);
			session.setAttribute("user", user);
			response.sendRedirect("topics");
		}else {
			status = "failed";
			
			request.setAttribute("status", status);
			dispatcher = request.getRequestDispatcher("/Login.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

}
