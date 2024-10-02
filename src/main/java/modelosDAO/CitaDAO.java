package modelosDAO;

import db.cn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.Cita;

public class CitaDAO {

    Connection con;
    cn conexion;
    PreparedStatement ps;
    ResultSet rs;

    public CitaDAO() throws ClassNotFoundException {
        conexion = new cn();
    }

    // Método para listar citas con nombre de paciente y doctor
    public List<Cita> listar() {
        List<Cita> lista = new ArrayList<>();
        String sql = "SELECT c.IDCita, c.FechaCita, p.NombrePaciente, d.Nombre AS NombreDoctor "
                   + "FROM Citas c "
                   + "JOIN Pacientes p ON c.PacienteID = p.IDPaciente "
                   + "LEFT JOIN Doctores d ON c.DoctorID = d.DoctorID";
        
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cita cita = new Cita();
                cita.setIdCita(rs.getInt("IDCita"));
                cita.setFechaCita(rs.getString("FechaCita"));
                cita.setNombrePaciente(rs.getString("NombrePaciente")); // Recuperamos el nombre del paciente
                cita.setNombreDoctor(rs.getString("NombreDoctor")); // Recuperamos el nombre del doctor
                lista.add(cita);
            }
        } catch (SQLException e) {
            System.err.println("Error al listar citas: " + e);
        }
        return lista;
    }
public boolean agregar(Cita cita) {
    String sql = "INSERT INTO Citas (FechaCita, PacienteID, DoctorID) VALUES (?, ?, ?)";
    try {
        con = conexion.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, cita.getFechaCita());
        ps.setInt(2, cita.getPacienteID());
        ps.setInt(3, cita.getDoctorID() > 0 ? cita.getDoctorID() : null);  // Manejar caso de doctor opcional
        ps.executeUpdate();
        return true;
    } catch (SQLException e) {
        System.err.println("Error al agregar cita: " + e);
        return false;
    }
}

}

