package controladores;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import modelos.Paciente;
import modelos.Doctor;  // Importar el modelo Doctor
import modelosDAO.PacienteDAO;
import modelosDAO.DoctorDAO;  // Importar el DAO de Doctor

@WebServlet(name = "controllerPaciente", urlPatterns = {"/paciente", "/paciente/*"})
public class controllerPaciente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PacienteDAO pacienteDAO = new PacienteDAO();
            DoctorDAO doctorDAO = new DoctorDAO(); // Instancia para acceder a los doctores
            RequestDispatcher dispatcher;

            String accion = request.getParameter("accion");
            
            // Manejo de eliminación
            if ("eliminar".equals(accion)) {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean eliminado = pacienteDAO.eliminar(id);
                if (eliminado) {
                    System.out.println("Paciente eliminado con ID: " + id);
                } else {
                    System.out.println("No se pudo eliminar el paciente con ID: " + id);
                }
                response.sendRedirect(request.getContextPath() + "/paciente");
                return; // Asegúrate de salir después de redirigir
            }

            // Manejo de listar un paciente por ID
            if (request.getParameter("id") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                Paciente paciente = pacienteDAO.listarByID(id);

                // Obtener lista de doctores
                List<Doctor> doctores = doctorDAO.listar();
                request.setAttribute("doctores", doctores); // Agregar doctores a la solicitud

                request.setAttribute("paciente", paciente);
                dispatcher = request.getRequestDispatcher("consultaPacientes.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Listar todos los pacientes
            List<Paciente> consulta = pacienteDAO.listar();
            request.setAttribute("consulta", consulta);

            // Obtener lista de doctores
            List<Doctor> doctores = doctorDAO.listar();
            request.setAttribute("doctores", doctores); // Agregar doctores a la solicitud

            dispatcher = request.getRequestDispatcher("consultaPacientes.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            System.err.println("Error en doGet: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PacienteDAO pacienteDAO = new PacienteDAO();
            String accion = request.getParameter("accion");

            if ("agregar".equals(accion)) {
                String nombrePaciente = request.getParameter("nombrePaciente");
                int edad = Integer.parseInt(request.getParameter("edad"));
                String direccionPaciente = request.getParameter("direccionPaciente");
                int doctorId = Integer.parseInt(request.getParameter("doctorId")); // Obteniendo el ID del doctor

                Paciente paciente = new Paciente(nombrePaciente, edad, direccionPaciente, doctorId); // Incluyendo DoctorID
                pacienteDAO.agregar(paciente);
                response.sendRedirect(request.getContextPath() + "/paciente");

            } else if ("update".equals(accion)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String nombrePaciente = request.getParameter("nombrePaciente");
                int edad = Integer.parseInt(request.getParameter("edad"));
                String direccionPaciente = request.getParameter("direccionPaciente");
                int doctorId = Integer.parseInt(request.getParameter("doctorId")); // Actualizando DoctorID

                Paciente paciente = new Paciente(nombrePaciente, id, direccionPaciente, edad); // Incluyendo DoctorID
                pacienteDAO.actualizar(paciente);
                response.sendRedirect(request.getContextPath() + "/paciente");
            } 

        } catch (Exception e) {
            System.err.println("Error en doPost: " + e.getMessage());
        }
    }

    @Override
    public void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo(); 
        if (pathInfo == null || pathInfo.equals("/")) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        try {
            int id = Integer.parseInt(pathInfo.substring(1));
            PacienteDAO pacienteDAO = new PacienteDAO();
            pacienteDAO.eliminar(id); 
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } 
        catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
                            