package presentacion;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import servicio.Empleado;
import servicio.ServicioValidarEmpleado_Service;

@WebServlet(name = "Control", urlPatterns = {"/Control"})
public class Control extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/ServicioValidarEmpleado/ServicioValidarEmpleado.wsdl")
    private ServicioValidarEmpleado_Service service;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acc = request.getParameter("acc");
        if (acc.equals("Ingresar")) {
            String txtuser = request.getParameter("txtuser");
            String txtpass = request.getParameter("txtpass");
            Empleado emp = validarEmpleado(txtuser, txtpass);
            if (emp != null) {
                List datos=obtenerDatos(txtuser);
                request.getSession().setAttribute("pres", emp);
                request.getSession().setAttribute("nom", datos.get(0));
                request.getSession().setAttribute("tip", datos.get(1));
                
                String tipo_enc = datos.get(1).toString();
                if(tipo_enc.equals("Medico")){
                    response.sendRedirect("VistaMedico.jsp");
                }else{
                    response.sendRedirect("VistaEncargado.jsp");
                }
                
            } else {
                request.setAttribute("mensajeError", "Nombre de usuario o contraseña incorrectos.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
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

    private Empleado validarEmpleado(java.lang.String usu, java.lang.String pas) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        servicio.ServicioValidarEmpleado port = service.getServicioValidarEmpleadoPort();
        return port.validarEmpleado(usu, pas);
    }

    private java.util.List<java.lang.String> obtenerDatos(java.lang.String usu) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        servicio.ServicioValidarEmpleado port = service.getServicioValidarEmpleadoPort();
        return port.obtenerDatos(usu);
    }

}
