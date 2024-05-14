<%-- 
    Document   : HistoriasClinicas
    Created on : 13/05/2024, 11:16:14 PM
    Author     : Nacho
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Historias Clinicas</h1>
        
        <div>
            <form action="ControlBuscarHistoria">
                <input type="text" name="txtdni" placeholder="Ingrese el dni..."/> 
                <input type="submit" name="accion" value="Buscar"/> 
            </form>
            
            
        </div>
        <br>
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
                    <c:forEach var="his" items="${historias}">
                        <tr>
                            
                            <td>${his.getNom()}</td>
                            <td>${his.getApe()}</td>
                            <td>${his.getDni()}</td>
                            <td>${his.getDir()}</td>
                            <td>${his.getPro()}</td>
                            <td>${his.getEdad()}</td>
                            <td>${his.getFec()}</td>
                            <td>${his.getHora()}</td>
                            <td>${his.getRes()}</td>
                            <td>${his.getNomRes()}</td>
                            <td>${his.getApeRes()}</td>
                            <td>${his.getDniRes()}</td>
                            <td>${his.getTelRes()}</td>
                            <td>${his.getEnf()}</td>
                            <td>${his.getAle()}</td>
                            <td>${his.getOpe()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <a href="VistaEncargado.jsp">Salir</a>
        </div>
    </body>
</html>
