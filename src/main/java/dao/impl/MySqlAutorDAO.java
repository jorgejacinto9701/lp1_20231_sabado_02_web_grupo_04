package dao.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.AutorDAO;
import entity.Autor;
import util.MySqlDBConexion;

public class MySqlAutorDAO implements AutorDAO {
	
	
	private static Logger log = Logger.getLogger(MySqlAutorDAO.class.getName());
	
	public int insertaAutor(Autor  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into autor values(null,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setString(2, obj.getApellidos());
			pstm.setDate(3, obj.getFechaNacimiento());
			pstm.setString(4, obj.getTelefono());
			pstm.setTimestamp(5, obj.getFechaRegistro());
			pstm.setInt(6, obj.getEstado());
			pstm.setInt(7, obj.getGrado().getIdGrado());
			
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
