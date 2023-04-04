package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class MySqlDBConexion {

	// permite el acceso los parametros del archivo properties
	private static ResourceBundle rb = ResourceBundle.getBundle("database");

	// Accede a las clases del mysqlconnectorXXXX.jar
	static {
		try {
			Class.forName(rb.getString("driver"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// Metodo para crear conexiones
	public static Connection getConexion() {
		Connection salida = null;
		try {
			salida = DriverManager.getConnection(
					rb.getString("url"), 
					rb.getString("username"),
					rb.getString("password"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return salida;
	}

}
