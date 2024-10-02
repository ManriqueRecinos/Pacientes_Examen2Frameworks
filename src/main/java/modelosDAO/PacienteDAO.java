package modelosDAO;

import db.cn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelos.Paciente;

public class PacienteDAO {

    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public PacienteDAO() throws ClassNotFoundException {
        CN = new cn();
    }

    public List<Paciente> listar() {
        ArrayList<Paciente> lista = new ArrayList<>();
        String sql = "SELECT * FROM pacientes";

        try {
            con = CN.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Paciente paciente = new Paciente(
                        rs.getInt("IDPaciente"),
                        rs.getString("NombrePaciente"),
                        rs.getInt("Edad"),
                        rs.getString("DireccionPaciente")
                );
                lista.add(paciente);
            }
        } catch (Exception e) {
            System.err.println("Error al listar pacientes: " + e.getMessage());
        }
        return lista;
    }

    public Paciente listarByID(int id) {
        Paciente paciente = null;
        String sql = "SELECT * FROM pacientes WHERE IDPaciente = ?";

        try {
            con = CN.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                paciente = new Paciente(
                        rs.getInt("IDPaciente"),
                        rs.getString("NombrePaciente"),
                        rs.getInt("Edad"),
                        rs.getString("DireccionPaciente")
                );
            }
        } catch (Exception e) {
            System.err.println("Error al buscar paciente por ID: " + e.getMessage());
        }
        return paciente;
    }

    public boolean agregar(Paciente paciente) {
        String sql = "INSERT INTO pacientes(NombrePaciente, Edad, DireccionPaciente) VALUES (?,?,?)";

        try {
            con = CN.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, paciente.getNombrePaciente());
            ps.setInt(2, paciente.getEdad());
            ps.setString(3, paciente.getDireccionPaciente());
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (Exception e) {
            System.err.println("Error al agregar paciente: " + e.getMessage());
            return false;
        }
    }

    public boolean actualizar(Paciente paciente) {
        String sql = "UPDATE pacientes SET NombrePaciente = ?, Edad = ?, DireccionPaciente = ? WHERE IDPaciente = ?";

        try {
            con = CN.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, paciente.getNombrePaciente());
            ps.setInt(2, paciente.getEdad());
            ps.setString(3, paciente.getDireccionPaciente());
            ps.setInt(4, paciente.getIdPaciente());
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (Exception e) {
            System.err.println("Error al actualizar paciente: " + e.getMessage());
            return false;
        }
    }

    public boolean eliminar(int id) {
    String sql = "DELETE FROM pacientes WHERE IDPaciente = ?";
    boolean resultado = false;

    try {
        con = CN.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        int filasAfectadas = ps.executeUpdate();
        resultado = filasAfectadas > 0;
    } catch (Exception e) {
        System.err.println("Error al eliminar paciente: " + e.getMessage());
    } finally {
        // Cerrar recursos
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            System.err.println("Error al cerrar recursos: " + e.getMessage());
        }
    }
    return resultado;
}




}
