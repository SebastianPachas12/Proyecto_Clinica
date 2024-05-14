<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Horarios disponibles</h1>
        <div>
            <table border="2px">
                <thead>
                    <tr>
                        <th>CODIGO</th>
                        <th>EMPLEADO</th>
                        <th>ESPECIALIDAD</th>
                        <th>FECHA</th>
                        <th>HORA</th>
                        <th>CONSULTORIO</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="hor" items="${horarios}">
                    <tr>
                        <td>${hor.getCod()}</td>
                        <td>${hor.getNom()}</td>
                        <td>${hor.getEsp()}</td>
                        <td>${hor.getFec()}</td>
                        <td>${hor.getHor()}</td>
                        <td>${hor.getCon()}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
