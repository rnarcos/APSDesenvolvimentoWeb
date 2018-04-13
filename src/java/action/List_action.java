package action;

import Database.Manager;
import com.google.gson.Gson;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/list")
public class List_action extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest Request, HttpServletResponse Response) throws ServletException, java.io.IOException {
        String action = Request.getParameter("action") == null? "list": Request.getParameter("action");
        if (!action.equals("list_consultas")) {
            RequestDispatcher Redirect = Request.getRequestDispatcher("/list/list.jsp");
            Redirect.forward(Request, Response);
        } else {
            try {
                String json = new Gson().toJson(getConsultasList());
                Response.setContentType("application/json");
                Response.setCharacterEncoding("UTF-8");
                Response.getWriter().write(json);
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(Schedule_action.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public List<ArrayList<String>> getConsultasList() throws SQLException, ClassNotFoundException {
        return new Manager().getConsultasList();
    }
}
