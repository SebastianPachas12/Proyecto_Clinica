<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>
            <table border="2px">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Dni</th>
                        <th>Direccion</th>
                        <th>Provincia</th>
                        <th>Edad</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Responsable</th>
                        <th>NomRes</th>
                        <th>ApeRes</th>
                        <th>DniRes</th>
                        <th>TelRes</th>
                        <th>Enfermedades</th>
                        <th>Alergias</th>
                        <th>Operaciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="histo" items="${histo}">
                        <tr>
                            
                            <td>${histo.getNom()}</td>
                            <td>${histo.getApe()}</td>
                            <td>${histo.getDni()}</td>
                            <td>${histo.getDir()}</td>
                            <td>${histo.getPro()}</td>
                            <td>${histo.getEdad()}</td>
                            <td>${histo.getFec()}</td>
                            <td>${histo.getHora()}</td>
                            <td>${histo.getRes()}</td>
                            <td>${histo.getNomRes()}</td>
                            <td>${histo.getApeRes()}</td>
                            <td>${histo.getDniRes()}</td>
                            <td>${histo.getTelRes()}</td>
                            <td>${histo.getEnf()}</td>
                            <td>${histo.getAle()}</td>
                            <td>${histo.getOpe()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <a href="ControlHistoria?menu=Historia&accion=Listar"/>Salir</a>
        </div>
    </body>
</html>
