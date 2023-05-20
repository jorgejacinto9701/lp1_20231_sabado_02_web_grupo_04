package dao.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.SalaDAO;
import entity.Sala;
import util.MySqlDBConexion;

public class MySqlSalaDAO implements SalaDAO {

	private static Logger log = Logger.getLogger(MySqlSalaDAO.class.getName());
	
	public int insertaSala(Sala  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into sala values(null,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNumero());
			pstm.setInt(2, obj.getPiso());
			pstm.setInt(3, obj.getNumAlumnos());
			pstm.setString(4, obj.getRecursos());
			pstm.setDate(5, obj.getFechaRegistro());
			pstm.setInt(6, obj.getEstado());
			pstm.setInt(7, obj.getSede().getIdSede());
			
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
