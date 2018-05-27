<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="/assets/pages/js/navigation.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="/list/css/list.css">
        <script type="text/javascript" src="/list/js/list.js"></script>
        <title>Clinica Médica</title>
    </head>
    <body>
        <%@include file="/assets/pages/navigation.jsp"%>
        <div id="main">
            <div id="emptyListAlert" class="alert alert-warning alert-dismissible">
                <a href="/" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Aviso</strong> Nenhuma consulta ainda foi marcada. <a href="/schedule" class="alert-link">Marque aqui a sua consulta</a>
            </div>
        </div>
    </body>
</html>
