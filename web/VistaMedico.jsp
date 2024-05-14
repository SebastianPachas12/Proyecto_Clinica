<%-- 
    Document   : VistaMedico
    Created on : 12/05/2024, 11:00:53 PM
    Author     : Nacho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="
             min-height: 100vh;
             background: linear-gradient( rgba(5, 7, 12, 0.25), rgba(5, 7, 12, 0.25)),
             url(./img/fondoClinica.jpg) no-repeat center center fixed;
             background-size: cover;
             ">
            <center>
                <br><br>
                <div class="text-white">
                    <h1>Clinica TU SALUD</h1>
                    <h2>¡Bienvenido <%= session.getAttribute("tip")%> - <%= session.getAttribute("nom")%>!</h2>
                </div>
                <br>
                
                
                <a class="btn btn-primary" href="Controlador?menu=Horario&accion=Grabar">Grabar Horario</a>
                <a href="Login.jsp" class="btn btn-primary">Cerrar Sesion</a>
            </center>
        </div>
    </body>
</html>
