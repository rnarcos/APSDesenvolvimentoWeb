<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="/assets/pages/js/navigation.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="/schedule/css/schedule.css">
        <script type="text/javascript" src="/schedule/js/schedule.js"></script>
        <title>Clinica Médica</title>
    </head>
    <body>
        <%@include file="/assets/pages/navigation.jsp"%>
        <div id="main">
    <c:choose>
        <c:when test="${especialidade == null}">
            <form method="POST" class="formulario" id="schedule_form">
                <input type="hidden" id="action" name="action" value="${action}"/>
                <ul>
                    <li>
                        <label for="especialidade">Especialidade</label>
                        <select name="especialidade" id="especialidade" required>
                        </select>
                        <span>Selecione a especialidade da consulta</span>
                    </li>
                    <li>
                        <input type="submit" value="Enviar"/>
                    </li>
                </ul>
            </form>
        </c:when>
        <c:when test="${paciente == null}">
            <form method="POST" class="formulario">
                <input type="hidden" id="action" name="action" value="${action}"/>
                <input type="hidden" id="especialidade" name="especialidade" value="${especialidade}"/>
                <ul>
                    <li>
                         <label for="medico">Medico</label>
                         <select name="medico"id="medico" required>
                         </select>
                         <span>Selecione o nome do Médico</span>
                    </li>
                    <li>
                        <label for="paciente">Paciente</label>
                        <input type="text" name="paciente" id="paciente" required/>
                        <span>Informe o nome do paciente</span>
                    </li>
                    <li>
                        <label for="data_consulta">Horário</label>
                        <input type="datetime-local" name="data_consulta" id="data_consulta" required/>
                        <span>Informe a data e a hora da consulta</span>
                    </li>
                    <li>
                        <label for="convenio">Convenio</label>
                        <input type="text" name="convenio" id="convenio" required/>
                        <span>Informe o convenio</span>
                    </li>
                    <li>
                        <input type="submit" value="Enviar"/>
                    </li>
                </ul>
            </form>
        </c:when>
        <c:when test="${action == 'schedule_success'}">
            <div class="alert alert-success alert-dismissible">
                <a href="/" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Sucesso</strong> Sua consulta foi agendada!
            </div>
        </c:when>
        <c:when test="${action == 'schedule_fail'}">
            <div class="alert alert-danger alert-dismissible">
                <a href="/" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Erro</strong> Houve uma falha no agendamento da consulta!
            </div>
        </c:when>
        <c:otherwise>
            Voce nao devia estar nessa pagina!
        </c:otherwise>
    </c:choose>
        </div>
    </body>
</html>
