<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="/assets/pages/js/nav.js" type="text/javascript"></script>
        <link rel="stylesheet" href="/list/css/list.css">
        <script type="text/javascript" src="/list/js/list.js"></script>
        <title>Clinica Médica</title>
    </head>
    <body>
        <%@include file="/assets/pages/navigation.jsp"%>
        <div id="main">
            <table>
                <thead>
                    <tr>
                        <td>Medico</td>
                        <td>Especialidade</td>
                        <td>Paciente</td>
                        <td>Data</td>
                        <td>Convenio</td>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </body>
</html>
