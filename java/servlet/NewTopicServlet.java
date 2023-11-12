package servlet;

import java.io.IOException;
import java.util.Collections;
import java.util.Map;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Topic;
import model.User;
import service.ForumService;

/**
 * Servlet implementation class NewTopicServlet
 */
@WebServlet("/new-topic")
public class NewTopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewTopicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String queryString = request.getQueryString();
		String[] keyValue = queryString.split("=");
		System.out.println(queryString);
		// Tách giá trị số từ query string
		if (keyValue[0].equals("type")) {
			response.sendRedirect("topics");
	    
		}else {
			request.getRequestDispatcher("newTopic.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Integer id;
		Map<Integer, Topic> topics = ForumService.getInstance().getListTopic();
		// Lấy tất cả các keys (IDs) của topics
        Set<Integer> topicIds = topics.keySet();

        // Nếu không có topic nào, trả về null hoặc giá trị mặc định phù hợp
        if (topicIds.isEmpty()) {
            id = 0;
        }

        // Sử dụng Collections.max để lấy giá trị lớn nhất (ID cuối cùng)
        id = Collections.max(topicIds);
        System.out.println(id);
        User user = (User) sess.getAttribute("user");
		Topic topic = new Topic(id + 1, title, content, user, new Category("Học hành"));
		topics.put(id + 1, topic);
		request.getRequestDispatcher("topics").forward(request, response);
		
		
	}

}
