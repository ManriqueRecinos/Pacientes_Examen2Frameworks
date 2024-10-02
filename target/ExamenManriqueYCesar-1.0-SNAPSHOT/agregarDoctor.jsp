<%@page import="modelos.Doctor"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar y Listar Doctores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
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

    <div class="container mt-5">
        <div class="bg-light p-3">
            <h5>Información requerida: <small>Para registrar un nuevo doctor</small></h5>
        </div>

        <form method="POST" action="/ExamenManriqueYCesar/doctor" class="mt-3">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre del doctor" required>
            </div>
            <div class="mb-3">
                <label for="especialidad" class="form-label">Especialidad</label>
                <input type="text" class="form-control" id="especialidad" name="especialidad" placeholder="Ingrese la especialidad del doctor" required>
            </div>
            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono</label>
                <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Ingrese el teléfono del doctor" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Ingrese el email del doctor" required>
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Agregar Doctor</button>
        </form>

        <h2 class="mt-5">Listado de Doctores</h2>
        <div class="table-responsive">
            <table id="tablaDoctores" class="table table-bordered mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>ID Doctor</th>
                        <th>Nombre</th>
                        <th>Especialidad</th>
                        <th>Teléfono</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Doctor> listaDoctores = (List<Doctor>) request.getAttribute("listaDoctores");
                        if (listaDoctores != null && !listaDoctores.isEmpty()) {
                            for (Doctor doctor : listaDoctores) {
                    %>
                    <tr>
                        <td><%= doctor.getDoctorID() %></td>
                        <td><%= doctor.getNombre() %></td>
                        <td><%= doctor.getEspecialidad() %></td>
                        <td><%= doctor.getTelefono() %></td>
                        <td><%= doctor.getEmail() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">No hay doctores registrados.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#tablaDoctores').DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.13.5/i18n/es_es.json"
                }
            });
        });
    </script>
</body>
</html>
