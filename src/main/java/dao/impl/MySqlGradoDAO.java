package dao.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.GradoDAO;
import entity.Grado;
import util.MySqlDBConexion;

public class MySqlGradoDAO implements GradoDAO{

	private static Logger log = Logger.getLogger(MySqlGradoDAO.class.getName());
	
	public List<Grado> listaGrado() {
		List<Grado> lista = new ArrayList<Grado>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select * from grado_autor";
			pstm = conn.prepareStatement(sql);
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Grado obj = null;
			while(rs.next()) {
				obj = new Grado();
				obj.setIdGrado(rs.getInt(1));
				obj.setDescripcion(rs.getString(2));
				lista.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return lista;
	}
}