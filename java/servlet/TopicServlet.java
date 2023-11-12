package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ForumService;

import java.io.IOException;

/**
 * Servlet implementation class TopicServlet
 */
@WebServlet("/topics")
public class TopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String queryString = request.getQueryString();
		// Tách giá trị số từ query string
		if (queryString != null && queryString.contains("id")) {
	        String[] keyValue = queryString.split("=");
	        String id = keyValue[1];
			request.setAttribute("topic", ForumService.getInstance().findTopic(Integer.parseInt(id)));
			request.getRequestDispatcher("showTopic.jsp").forward(request, response);
		}else {
			request.setAttribute("topics", ForumService.getInstance().getTopics());
			request.getRequestDispatcher("listTopics.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
