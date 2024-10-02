<!-- Navbar -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  .navbar-custom {
    background-color: #d1ecf1; /* Color celeste claro */
  }
  .navbar-custom .navbar-brand,
  .navbar-custom .nav-link {
    color: #004085; /* Color oscuro para contraste */
  }
  .navbar-custom .nav-link:hover {
    color: #002752; /* Color más oscuro al pasar el mouse */
  }
</style>

<nav class="navbar navbar-expand-lg navbar-custom">
  <div class="container-fluid">
    <a class="navbar-brand" href="">Clinica</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">


        <!-- Main Menu Item 2 -->
        <li class="nav-item">
          <a class="nav-link" href="/ExamenManriqueYCesar/doctor">Agregar Doctor</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="/ExamenManriqueYCesar/paciente">Agregar Paciente</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="/ExamenManriqueYCesar/citas">Agregar Cita</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
