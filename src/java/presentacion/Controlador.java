package presentacion;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import servicio.ServicioBuscar_Service;
import servicio.ServicioHorario_Service;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/ServicioBusqueda/ServicioBuscar.wsdl")
    private ServicioBuscar_Service service_1;
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/ServicioHorario/ServicioHorario.wsdl")
    private ServicioHorario_Service service;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("Horario")) {
            switch (accion) {
                case "Listar":
                    List lista = servicioListarHorario();
                    request.setAttribute("horarios", lista);
                    //response.sendRedirect("ListarHorario.jsp");
                    request.getRequestDispatcher("ListarHorario.jsp").forward(request, response);
                    break;
                case "Grabar":
                    String nom = request.getParameter("txtnom");
                    String esp = request.getParameter("txtesp");
                    String fec = request.getParameter("txtfec");
                    String hor = request.getParameter("txthor");
                    String con = request.getParameter("txtcon");
                    
                    String emp = servicioBuscarEmpleado(nom);
                    String espe = servicioBuscarEspecialidad(esp);
                    
                    servicioGrabarHorario(emp,espe,fec,hor,con);
                    response.sendRedirect("GrabarHorario.jsp");
                    break;
                case "Filtro":
                    break;
                default:
                    throw new AssertionError();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String servicioGrabarHorario(java.lang.String nom, java.lang.String esp, java.lang.String fec, java.lang.String hor, java.lang.String con) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        servicio.ServicioHorario port = service.getServicioHorarioPort();
        return port.servicioGrabarHorario(nom, esp, fec, hor, con);
    }

    private java.util.List<servicio.Horario> servicioListarHorario() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        servicio.ServicioHorario port = service.getServicioHorarioPort();
        return port.servicioListarHorario();
    }

    private String servicioBuscarEmpleado(java.lang.String nom) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        servicio.ServicioBuscar port = service_1.getServicioBuscarPort();
        return port.servicioBuscarEmpleado(nom);
    }

    private String servicioBuscarEspecialidad(java.lang.String esp) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        servicio.ServicioBuscar port = service_1.getServicioBuscarPort();
        return port.servicioBuscarEspecialidad(esp);
    }

    
    

    
    
}
