package Database;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Manager {
    static Connection connection;
    
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica?zeroDateTimeBehavior=convertToNull", "root", "root");
    }
    
    public static List<String> getEspecialidadesList() throws SQLException, ClassNotFoundException {
        connection = getConnection();
        List<String> RSList = new ArrayList<String>();
        CallableStatement statement = connection.prepareCall("{call list_especialidades}");
        statement.execute();
        ResultSet RS = statement.getResultSet();
        while(RS.next()) {
            RSList.add(RS.getString("especialidade"));
        }
        statement.close();
        connection.close();
        return RSList;
    }
    
    public static List<String> getMedicosNameListFromEspecialidade(String especialidade) throws SQLException, ClassNotFoundException {
        connection = getConnection();
        List<String> RSList = new ArrayList<String>();
        CallableStatement statement = connection.prepareCall("{call list_medicos_from_especialidade(?)}");
        statement.setString(1, especialidade); 
        statement.execute();
        ResultSet RS = statement.getResultSet();
        while(RS.next()) {
            RSList.add(RS.getString("nome"));
        }
        statement.close();
        connection.close();
        return RSList;
    }
    
    public static boolean createConsulta(String medico, String especialidade, String paciente, String data_consulta, String convenio) throws SQLException, ClassNotFoundException {
        connection = getConnection();
        List<String> RSList = new ArrayList<String>();
        CallableStatement statement = connection.prepareCall("{call create_consulta(?, ?, ?, ?, ?)}");
        statement.setString(1, medico);
        statement.setString(2, especialidade);
        statement.setString(3, paciente);
        statement.setString(4, data_consulta);
        statement.setString(5, convenio);
        statement.execute();
        boolean consultaCreated = statement.getUpdateCount() > 0;
        statement.close();
        connection.close();
        return consultaCreated;
    }
    
    public static List<ArrayList<String>> getConsultasList() throws SQLException, ClassNotFoundException {
        connection = getConnection();
        
        List<ArrayList<String>> RSLists = new ArrayList<>();
        List<String> RSList = new ArrayList<>();
        CallableStatement statement = connection.prepareCall("{call list_consultas}");
        statement.execute();
        ResultSet RS = statement.getResultSet();
        while (RS.next()) {
            RSList =  new ArrayList<>(Arrays.asList(RS.getString("medico"), RS.getString("especialidade"), RS.getString("paciente"), RS.getString("data"), RS.getString("convenio")));
            RSLists.add((ArrayList<String>) RSList);
        }
        statement.close();
        connection.close();
        return RSLists;
    }
}
