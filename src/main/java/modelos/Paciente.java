package modelos;

/**
 *
 * @author Manrique
 */
public class Paciente {
    private int idPaciente;
    private String nombrePaciente;
    private int edad;
    private String direccionPaciente;
    
    public Paciente(String nombrePaciente1, int id, String direccionPaciente1, int edad1) {
    }

    public Paciente(String nombrePaciente, int edad, String direccionPaciente) {
        this.nombrePaciente = nombrePaciente;
        this.edad = edad;
        this.direccionPaciente = direccionPaciente;
    }

    public Paciente(int idPaciente, String nombrePaciente, int edad, String direccionPaciente) {
        this.idPaciente = idPaciente;
        this.nombrePaciente = nombrePaciente;
        this.edad = edad;
        this.direccionPaciente = direccionPaciente;
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getDireccionPaciente() {
        return direccionPaciente;
    }

    public void setDireccionPaciente(String direccionPaciente) {
        this.direccionPaciente = direccionPaciente;
    }
}
