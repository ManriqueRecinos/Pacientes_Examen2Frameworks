package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import modelos.Doctor;
import modelosDAO.DoctorDAO;


@WebServlet( name = "DoctorController", urlPatterns = {"/doctor", "/doctor/*"})
public class DoctorController extends HttpServlet {

    DoctorDAO doctorDAO;

    @Override
    public void init() throws ServletException {
        try {
            doctorDAO = new DoctorDAO();
        } catch (ClassNotFoundException e) {
            throw new ServletException("Error al inicializar DoctorDAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion == null || accion.isEmpty()) {
            listarDoctores(request, response);
        }
    }

    private void listarDoctores(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Doctor> listaDoctores = doctorDAO.listar();
        request.setAttribute("listaDoctores", listaDoctores);
        request.getRequestDispatcher("agregarDoctor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String especialidad = request.getParameter("especialidad");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");

        Doctor doctor = new Doctor();
        doctor.setNombre(nombre);
        doctor.setEspecialidad(especialidad);
        doctor.setTelefono(telefono);
        doctor.setEmail(email);

        if (doctorDAO.agregar(doctor)) {
            response.sendRedirect("/ExamenManriqueYCesar/doctor");
        } else {
            response.getWriter().write("Error al agregar doctor");
        }
    }
}

