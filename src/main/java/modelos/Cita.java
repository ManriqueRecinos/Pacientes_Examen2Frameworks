package modelos;

public class Cita {
    private int idCita;
    private String fechaCita;
    private int pacienteID;
    private int doctorID;
    private String nombrePaciente; // Añadimos el nombre del paciente
    private String nombreDoctor;   // Añadimos el nombre del doctor

    public Cita() {
    }

    public Cita(String fechaCita, int pacienteID, int doctorID) {
        this.fechaCita = fechaCita;
        this.pacienteID = pacienteID;
        this.doctorID = doctorID;
    }

    public Cita(int idCita, String fechaCita, int pacienteID, int doctorID) {
        this.idCita = idCita;
        this.fechaCita = fechaCita;
        this.pacienteID = pacienteID;
        this.doctorID = doctorID;
    }

    // Getters y setters
    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public String getFechaCita() {
        return fechaCita;
    }

    public void setFechaCita(String fechaCita) {
        this.fechaCita = fechaCita;
    }

    public int getPacienteID() {
        return pacienteID;
    }

    public void setPacienteID(int pacienteID) {
        this.pacienteID = pacienteID;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public String getNombreDoctor() {
        return nombreDoctor;
    }

    public void setNombreDoctor(String nombreDoctor) {
        this.nombreDoctor = nombreDoctor;
    }
}
