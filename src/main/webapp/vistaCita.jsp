<%@page import="modelos.Paciente"%>
<%@page import="modelosDAO.PacienteDAO"%>
<%@page import="modelos.Doctor"%>
<%@page import="modelosDAO.DoctorDAO"%>
<%@page import="modelos.Cita"%>
<%@page import="modelosDAO.CitaDAO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar y Listar Citas</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <style>
        body {
            background-color: #b0f3e2;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <%@ include file="menu.jsp" %>
    
    <div class="container">
        <h2 class="mt-4">Agregar Cita Médica</h2>
        
        <!-- Formulario para agregar citas -->
        <form action="/ExamenManriqueYCesar/citas" method="POST">
            <div class="mb-3">
                <label for="fechaCita" class="form-label">Fecha de la Cita</label>
                <input type="date" class="form-control" id="fechaCita" name="fechaCita" required>
            </div>

            <!-- Selector de Pacientes Existentes -->
            <div class="mb-3">
                <label for="paciente" class="form-label">Seleccionar Paciente</label>
                <select class="form-select" id="paciente" name="pacienteID" required>
                    <option value="">Seleccione un paciente</option>
                    <%
                        PacienteDAO pacienteDAO = new PacienteDAO();
                        List<Paciente> listaPacientes = pacienteDAO.listar();
                        for (Paciente paciente : listaPacientes) {
                    %>
                    <option value="<%= paciente.getIdPaciente() %>">
                        <%= paciente.getNombrePaciente() %> - ID: <%= paciente.getIdPaciente() %>
                    </option>
                    <%
                        }
                    %>
                </select>
            </div>

            <!-- Selector de Doctores Existentes -->
            <div class="mb-3">
                <label for="doctor" class="form-label">Seleccionar Doctor</label>
                <select class="form-select" id="doctor" name="doctorID">
                    <option value="">Seleccione un doctor (opcional)</option>
                    <%
                        DoctorDAO doctorDAO = new DoctorDAO();
                        List<Doctor> listaDoctores = doctorDAO.listar();
                        for (Doctor doctor : listaDoctores) {
                    %>
                    <option value="<%= doctor.getDoctorID() %>">
                        <%= doctor.getNombre() %> - Especialidad: <%= doctor.getEspecialidad() %>
                    </option>
                    <%
                        }
                    %>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Agregar Cita</button>
        </form>

        <!-- Tabla para listar citas -->
        <h2 class="mt-5">Listado de Citas</h2>
        <div class="table-responsive">
            <table id="tablaCitas" class="table table-bordered table-striped mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>ID Cita</th>
                        <th>Fecha de Cita</th>
                        <th>Nombre del Paciente</th>
                        <th>Nombre del Doctor</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        CitaDAO citaDAO = new CitaDAO();
                        List<Cita> listaCitas = citaDAO.listar();
                        for (Cita cita : listaCitas) {
                    %>
                    <tr>
                        <td><%= cita.getIdCita() %></td>
                        <td><%= cita.getFechaCita() %></td>
                        <td><%= cita.getNombrePaciente() %></td> <!-- Mostramos el nombre del paciente -->
                        <td>
                            <%
                                if (cita.getNombreDoctor() != null && !cita.getNombreDoctor().isEmpty()) {
                                    out.print(cita.getNombreDoctor()); // Mostramos el nombre del doctor
                                } else {
                                    out.print("N/A");
                                }
                            %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap 5 JS and DataTables -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#tablaCitas').DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.11.5/i18n/Spanish.json"
                }
            });
        });
    </script>
</body>
</html>
