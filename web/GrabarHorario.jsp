<%-- 
    Document   : GrabarHorario
    Created on : 13/05/2024, 05:15:14 PM
    Author     : Nacho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Grabar Horario</h1>
        <div>
            <div>
                <form action="Controlador?menu=Horario" method="Post">
                    <div>
                        <label>Nombre</label>
                        <input type="text" name="txtnom"/>
                    </div>
                    <div>
                        <label>Especialidad</label>
                        <input type="text" name="txtesp"/>
                    </div>
                    <div>
                        <label>Fecha</label>
                        <input type="text" name="txtfec"/>
                    </div>
                    <div>
                        <label>Hora</label>
                        <input type="text" name="txthor"/>
                    </div>
                    <div>
                        <label>Consultorio</label>
                        <input type="text" name="txtcon"/>
                    </div>
                    <input type="submit" name="accion" value="Grabar">
                </form>
            </div>
        </div>
    </body>
</html>
