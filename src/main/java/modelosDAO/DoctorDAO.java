package modelosDAO;

import db.cn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelos.Doctor;

public class DoctorDAO {

    Connection con;
    cn conexion;
    PreparedStatement ps;
    ResultSet rs;

    public DoctorDAO() throws ClassNotFoundException {
        conexion = new cn();
    }

    // Método para agregar doctor
    public boolean agregar(Doctor doctor) {
        String sql = "INSERT INTO Doctores (Nombre, Especialidad, Telefono, Email) VALUES (?, ?, ?, ?)";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, doctor.getNombre());
            ps.setString(2, doctor.getEspecialidad());
            ps.setString(3, doctor.getTelefono());
            ps.setString(4, doctor.getEmail());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Error al agregar doctor: " + e);
            return false;
        }
    }

    // Método para listar doctores
    public List<Doctor> listar() {
        List<Doctor> lista = new ArrayList<>();
        String sql = "SELECT * FROM Doctores";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setDoctorID(rs.getInt("DoctorID"));
                doctor.setNombre(rs.getString("Nombre"));
                doctor.setEspecialidad(rs.getString("Especialidad"));
                doctor.setTelefono(rs.getString("Telefono"));
                doctor.setEmail(rs.getString("Email"));
                lista.add(doctor);
            }
        } catch (Exception e) {
            System.err.println("Error al listar doctores: " + e);
        }
        return lista;
    }
     public boolean actualizar(Doctor doctor) {
        String sql = "UPDATE Doctores SET Nombre = ?, Especialidad = ?, Telefono = ?, Email = ? WHERE DoctorID = ?";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, doctor.getNombre());
            ps.setString(2, doctor.getEspecialidad());
            ps.setString(3, doctor.getTelefono());
            ps.setString(4, doctor.getEmail());
            ps.setInt(5, doctor.getDoctorID());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Error al actualizar doctor: " + e);
            return false;
        }
    }

    // Método para eliminar doctor
    public boolean eliminar(int id) {
        String sql = "DELETE FROM Doctores WHERE DoctorID = ?";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Error al eliminar doctor: " + e);
            return false;
        }
    }
}
