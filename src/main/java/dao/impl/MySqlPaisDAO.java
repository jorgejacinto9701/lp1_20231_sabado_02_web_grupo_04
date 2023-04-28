package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.PaisDAO;
import entity.Pais;
import util.MySqlDBConexion;

public class MySqlPaisDAO implements PaisDAO{

	private static Logger log = Logger.getLogger(MySqlPaisDAO.class.getName());
	
	public List<Pais> listaPais() {
		List<Pais> lista = new ArrayList<Pais>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select * from pais";
			pstm = conn.prepareStatement(sql);
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Pais obj = null;
			while(rs.next()) {
				obj = new Pais();
				obj.setIdPais(rs.getInt(1));
				obj.setIso(rs.getString(2));
				obj.setNombre(rs.getString(3));
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
