package action;

import Database.Manager;
import com.google.gson.Gson;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(urlPatterns="/schedule")
public class Schedule_action extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest Request, HttpServletResponse Response) throws ServletException, java.io.IOException {
        Request.setCharacterEncoding("UTF-8");
        String action, paciente, especialidade, medico, data_consulta, convenio;
        action = Request.getParameter("action") == null? "schedule": Request.getParameter("action");
        medico = Request.getParameter("medico");
        especialidade = Request.getParameter("especialidade");
        paciente = Request.getParameter("paciente");
        data_consulta = Request.getParameter("data_consulta");
        convenio = Request.getParameter("covenio");
        switch (action) {
            case "list_especialidades":
                try {
                    String json = new Gson().toJson(Manager.getEspecialidadesList());
                    Response.setContentType("application/json");
                    Response.setCharacterEncoding("UTF-8");
                    Response.getWriter().write(json);
                } catch (SQLException | ClassNotFoundException ex) {
                    Logger.getLogger(Schedule_action.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "list_medicos":
                try {
                    String json = new Gson().toJson(getMedicosNameListFromEspecialidade(Request.getParameter("especialidade")));
                    Response.setContentType("application/json");
                    Response.setCharacterEncoding("UTF-8");
                    Response.getWriter().write(json);
                } catch (SQLException | ClassNotFoundException ex) {
                    Logger.getLogger(Schedule_action.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            default:
                RequestDispatcher Redirect = Request.getRequestDispatcher("/schedule/schedule.jsp");
                Request.setAttribute("action", "schedule");
                Redirect.forward(Request, Response);
                break;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest Request, HttpServletResponse Response) throws ServletException, java.io.IOException {
        Request.setCharacterEncoding("UTF-8");
        String medico, especialidade, paciente, data_consulta, convenio;
        medico = Request.getParameter("medico");
        especialidade = Request.getParameter("especialidade");
        paciente = Request.getParameter("paciente");
        data_consulta = Request.getParameter("data_consulta");
        convenio = Request.getParameter("convenio");
        RequestDispatcher Redirect = Request.getRequestDispatcher("/schedule/schedule.jsp");
        Request.setAttribute("medico", medico);
        Request.setAttribute("especialidade", especialidade);
        Request.setAttribute("paciente", paciente);
        Request.setAttribute("data_consulta", data_consulta);
        Request.setAttribute("convenio", convenio);
        if (especialidade != null && medico != null && paciente != null && data_consulta != null && convenio != null) {
            try {
                boolean consultaCriada = createConsulta(medico, especialidade, paciente, data_consulta, convenio);
                if (consultaCriada) {
                    Request.setAttribute("action", "schedule_success");
                } else {
                    Request.setAttribute("action", "schedule_failed");
                }
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(Schedule_action.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            Request.setAttribute("action", "schedule");
        }
        Redirect.forward(Request, Response);
    }
    
    public List<String> getEspecialidadesList() throws SQLException, ClassNotFoundException {
        return Manager.getEspecialidadesList();
    }
    
    public List<String> getMedicosNameListFromEspecialidade(String especialidade) throws SQLException, ClassNotFoundException {
        return Manager.getMedicosNameListFromEspecialidade(especialidade);
    }
    
    
    public boolean createConsulta(String medico, String especialidade, String paciente, String data_consulta, String convenio) throws SQLException, ClassNotFoundException {
        return Manager.createConsulta(medico, especialidade, paciente, data_consulta, convenio);
    }
}
