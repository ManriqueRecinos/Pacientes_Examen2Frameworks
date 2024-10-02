package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import modelos.Cita;
import modelosDAO.CitaDAO;

@WebServlet(name = "CitaController", urlPatterns = {"/citas", "/citas/*"})
public class CitaController extends HttpServlet {

    private CitaDAO citaDAO;

    @Override
    public void init() throws ServletException {
        try {
            citaDAO = new CitaDAO();
        } catch (ClassNotFoundException e) {
            throw new ServletException("Error al inicializar CitaDAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion == null || accion.isEmpty()) {
            listarCitas(request, response);
        }
    }

    private void listarCitas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Cita> listaCitas = citaDAO.listar();  // Método que trae la lista con nombres de paciente y doctor
        request.setAttribute("listaCitas", listaCitas);
        request.getRequestDispatcher("vistaCita.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String fecha = request.getParameter("fechaCita");
        int pacienteID = Integer.parseInt(request.getParameter("pacienteID"));
        
        // Manejar la selección opcional de doctor
        String doctorIDParam = request.getParameter("doctorID");
        int doctorID = 0;  // Por defecto, sin doctor (puede ser opcional)
        
        if (doctorIDParam != null && !doctorIDParam.isEmpty()) {
            doctorID = Integer.parseInt(doctorIDParam);
        }

        // Crear el objeto Cita con la información proporcionada
        Cita cita = new Cita(fecha, pacienteID, doctorID);

        // Agregar la cita a la base de datos a través del DAO
        boolean citaAgregada = citaDAO.agregar(cita);  // Método agregar() que insertará la cita en la BD
        
        // Redirigir en caso de éxito o mostrar mensaje de error
        if (citaAgregada) {
            response.sendRedirect("/ExamenManriqueYCesar/citas");
        } else {
            response.getWriter().write("Error al agregar la cita");
        }
    }
}
