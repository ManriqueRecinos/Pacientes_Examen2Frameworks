<%@page import="modelos.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Paciente"%>
<%@page import="controladores.controllerPaciente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro de Pacientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f0f8ff;
            }
            .container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                margin-top: 40px;
            }
            .btn-group-actions {
                display: flex;
                justify-content: center;
                gap: 10px;
            }
        </style>
    </head>
    <body>
        <%@ include file="menu.jsp" %>

        <div class="container mt-5">
            <div class="bg-light p-3 mb-4">
                <h5>Información requerida: <small>Para registrar un nuevo paciente</small></h5>
            </div>

            <!-- Formulario de registro -->
            <form method="post" action="/ExamenManriqueYCesar/paciente" class="mt-3">
                <input type="hidden" name="accion" value="agregar">

                <div class="mb-3">
                    <label for="nombrePaciente" class="form-label">Nombre del Paciente</label>
                    <input type="text" name="nombrePaciente" class="form-control" id="nombrePaciente" placeholder="Ingrese el nombre del paciente" required>
                </div>

                <div class="mb-3">
                    <label for="edad" class="form-label">Edad</label>
                    <input type="number" name="edad" class="form-control" id="edad" placeholder="Ingrese la edad del paciente" required>
                </div>

                <div class="mb-3">
                    <label for="direccionPaciente" class="form-label">Dirección</label>
                    <input type="text" name="direccionPaciente" class="form-control" id="direccionPaciente" placeholder="Ingrese la dirección del paciente" required>
                </div>

                <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Agregar registro</button>
            </form>

            <!-- Tabla de pacientes -->
            <table id="pacientesTable" class="table table-bordered mt-4">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Edad</th>
                        <th>Dirección</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Paciente> consulta = (List<Paciente>) request.getAttribute("consulta");
                        if (consulta != null && !consulta.isEmpty()) {
                            for (Paciente paciente : consulta) {
                    %>
                    <tr>
                        <td><%= paciente.getIdPaciente() %></td>
                        <td><%= paciente.getNombrePaciente() %></td>
                        <td><%= paciente.getEdad() %></td>
                        <td><%= paciente.getDireccionPaciente() %></td>
                        <td class="btn-group-actions">
                            <!-- Botón de agregar -->
                            <button type="button" class="btn btn-sm btn-outline-success"
                                    onclick="openAgreModal('<%= paciente.getIdPaciente() %>')">
                                <i class="bi bi-plus-circle"></i> Agregar
                            </button>
                            <!-- Botón de editar -->
                            <button type="button" class="btn btn-sm btn-outline-primary" 
                                    onclick="openEditModal('<%= paciente.getIdPaciente() %>', '<%= paciente.getNombrePaciente() %>', '<%= paciente.getEdad() %>', '<%= paciente.getDireccionPaciente() %>')">
                                <i class="bi bi-pencil"></i> Editar
                            </button>
                            <!-- Botón de eliminar -->
                            <button type="button" class="btn btn-sm btn-outline-danger" onclick="deletePaciente(<%= paciente.getIdPaciente() %>)">
                                <i class="bi bi-trash"></i> Eliminar
                            </button>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">No hay pacientes registrados.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Modal para editar registro -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h5 class="modal-title" id="editModalLabel">Modificar Información del Paciente</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="/ExamenManriqueYCesar/paciente">
                            <input type="hidden" name="accion" value="update">
                            <div class="mb-3">
                                <label for="editId" class="form-label">ID</label>
                                <input type="text" name="id" class="form-control" id="editId" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="editNombrePaciente" class="form-label">Nombre del Paciente</label>
                                <input type="text" name="nombrePaciente" class="form-control" id="editNombrePaciente" required>
                            </div>
                            <div class="mb-3">
                                <label for="editEdad" class="form-label">Edad</label>
                                <input type="number" name="edad" class="form-control" id="editEdad" required>
                            </div>
                            <div class="mb-3">
                                <label for="editDireccionPaciente" class="form-label">Dirección</label>
                                <input type="text" name="direccionPaciente" class="form-control" id="editDireccionPaciente" required>
                            </div>
                            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Modificar registro</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
<!-- Modal para agregar cita médica -->
<div class="modal fade" id="addCitaModal" tabindex="-1" aria-labelledby="addCitaModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-light">
                <h5 class="modal-title" id="addCitaModalLabel">Agregar Cita Médica</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="/ExamenManriqueYCesar/citas">
                    <input type="hidden" name="accion" value="agregar">
                    <input type="hidden" name="pacienteID" id="citaPacienteId"> <!-- Aquí asignaremos el ID del paciente -->

                    <!-- Campo de Fecha -->
                    <div class="mb-3">
                        <label for="fechaCita" class="form-label">Fecha de la Cita</label>
                        <input type="date" class="form-control" id="fechaCita" name="fechaCita" required>
                    </div>

                    <!-- Selector de Doctores -->
                    <div class="mb-3">
                        <label for="doctor" class="form-label">Seleccionar Doctor</label>
                        <select class="form-select" id="doctor" name="doctorID" required>
                            <option value="">Seleccione un doctor</option>
                            <%
                                List<Doctor> listaDoctores = (List<Doctor>) request.getAttribute("listaDoctores");
                                if (listaDoctores != null) {
                                    for (Doctor doctor : listaDoctores) {
                            %>
                            <option value="<%= doctor.getDoctorID() %>">
                                <%= doctor.getNombre() %> - Especialidad: <%= doctor.getEspecialidad() %>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Agregar Cita</button>
                </form>
            </div>
        </div>
    </div>
</div>




        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function() {
                $('#pacientesTable').DataTable({
                    "language": {
                        "url": "https://cdn.datatables.net/plug-ins/1.13.5/i18n/es_es.json"
                    }
                });
            });

            function openEditModal(id, nombrePaciente, edad, direccionPaciente) {
                document.getElementById('editId').value = id;
                document.getElementById('editNombrePaciente').value = nombrePaciente;
                document.getElementById('editEdad').value = edad;
                document.getElementById('editDireccionPaciente').value = direccionPaciente;
                var editModal = new bootstrap.Modal(document.getElementById('editModal'));
                editModal.show();
            }
            
            function openAgreModal(pacienteId) {
                document.getElementById('citaPacienteId').value = pacienteId; // Asignar el ID del paciente al campo oculto
                var addCitaModal = new bootstrap.Modal(document.getElementById('addCitaModal')); // Mostrar el modal correcto
                addCitaModal.show();
            }



            function deletePaciente(id) {
                if (confirm('¿Está seguro de que desea eliminar este paciente?')) {
                    const url = "/ExamenManriqueYCesar/paciente/" + id;

                    fetch(url, {
                        method: 'DELETE'
                    })
                    .then(response => {
                        if (response.ok) {
                            alert('Paciente eliminado exitosamente');
                            window.location.reload();
                        }
                    })
                    .catch(error => console.error('Error:', error));
                }
            }
        </script>
    </body>
</html>
