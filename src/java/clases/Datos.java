package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
//import com.mysql.jdbc.Connection;

public class Datos {

    private Connection cnn;

    public Datos() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String db = "jdbc:mysql://localhost:3306/facturacion ?useTimezone=true&serverTimezone=UTC";
            cnn = DriverManager.getConnection(db, "root", "123");
        } catch (Exception ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void cerrarConexion() {
        try {
            cnn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String validarUsuario(String usuario, String clave) {
        try {
            String sql = "select idPerfil from usuarios where "
                    + "idUsuario = '" + usuario + "' and clave = '" + clave + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                return rs.getString("idPerfil");
            } else {
                return "nok";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return "nok";
        }
    }

    public Usuario getUsuario(String idUsuario) {
        try {
            Usuario miUsuario = null;
            String sql = "select * from usuarios where "
                    + "idUsuario = '" + idUsuario + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miUsuario = new Usuario(
                        rs.getString("idUsuario"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getString("clave"),
                        rs.getInt("idPerfil"),
                        rs.getString("foto"));
            }
            return miUsuario;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void newUsuario(Usuario miUsuario) {
        try {
            String sql = "insert into usuarios values('"
                    + miUsuario.getIdUsuario() + "', '"
                    + miUsuario.getNombres() + "', '"
                    + miUsuario.getApellidos() + "', '"
                    + miUsuario.getClave() + "', "
                    + miUsuario.getIdPerfil() + ", '"
                    + miUsuario.getFoto() + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateUsuario(Usuario miUsuario) {
        try {
            String sql = "update usuarios set "
                    + "nombres = '" + miUsuario.getNombres() + "', "
                    + "apellidos = '" + miUsuario.getApellidos() + "', "
                    + "clave = '" + miUsuario.getClave() + "', "
                    + "idPerfil = " + miUsuario.getIdPerfil() + ", "
                    + "foto = '" + miUsuario.getFoto() + "' "
                    + "where idUsuario = '" + miUsuario.getIdUsuario() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUsuario(String idUsuario) {
        try {
            String sql = "delete from usuarios where "
                    + "idUsuario = '" + idUsuario + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);            
        }
    }
    
        public ResultSet getUsuarios() {
        try {
            Usuario miUsuario = null;
            String sql = "select * from usuarios";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
