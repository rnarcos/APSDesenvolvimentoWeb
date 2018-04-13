package action;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="")
public class Home_action extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest Request, HttpServletResponse Response) throws ServletException, java.io.IOException {
        RequestDispatcher Redirect = Request.getRequestDispatcher("/assets/pages/home.jsp");
        Redirect.forward(Request, Response);
        
    }
}
