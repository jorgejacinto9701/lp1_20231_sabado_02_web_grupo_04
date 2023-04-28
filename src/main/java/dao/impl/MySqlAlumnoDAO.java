package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.AlumnoDAO;
import entity.Alumno;
import util.MySqlDBConexion;

public class MySqlAlumnoDAO implements AlumnoDAO{
		
		private static Logger log = Logger.getLogger(MySqlAlumnoDAO.class.getName());
		
		public int insertaAlumno(Alumno  obj) {
			int salida = -1;
			
			Connection conn = null;
			PreparedStatement pstm = null;
			try {
				conn = MySqlDBConexion.getConexion();
				
				String sql = "insert into sistema_biblioteca_202301.alumno values(null,?,?,?,?,?,?,?,?,?)";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, obj.getNombres());
				pstm.setString(2, obj.getApellidos());
				pstm.setString(3, obj.getTelefono());
				pstm.setString(4, obj.getDni());
				pstm.setString(5, obj.getCorreo());
				pstm.setDate(6, obj.getFechaNacimiento());
				pstm.setTimestamp(7, obj.getFechaRegistro());
				pstm.setInt(8, obj.getEstado());
				pstm.setInt(9, obj.getPais().getIdPais());
				
				log.info(">>>> " + pstm);

				salida = pstm.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstm != null) pstm.close();
					if (conn != null) conn.close();
				} catch (Exception e2) {}
			}
			
			return salida;
	}


	
	
	
}