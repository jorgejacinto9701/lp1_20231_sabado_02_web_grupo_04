package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.UsuarioDAO;
import entity.Opcion;
import entity.Usuario;
import util.MySqlDBConexion;

public class MySqlUsuarioDAO implements UsuarioDAO {

	private static Logger log = Logger.getLogger(MySqlUsuarioDAO.class.getName());
	
	@Override
	public Usuario login(Usuario bean) throws Exception {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Usuario obj = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql ="select * from usuario where login = ? and password =? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, bean.getLogin());
			pstm.setString(2, bean.getPassword());
			log.info(">>" + pstm);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Usuario();
				obj.setIdUsuario(rs.getInt(1));
				obj.setNombres(rs.getString(2));
				obj.setApellidos(rs.getString(3));
				obj.setDni(rs.getString(4));
				obj.setLogin(rs.getString(5));
				obj.setPassword(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		return obj;
	}

	@Override
	public List<Opcion> traerEnlacesDeUsuario(int idUsuario)	throws Exception {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<Opcion> data = new ArrayList<Opcion>();
		Opcion obj = null;
		
		try {
			conn = MySqlDBConexion.getConexion();
			String sql ="select p.idopcion, p.nombre, p.ruta, p.estado, p.tipo  from opcion p inner join rol_has_opcion r on p.idopcion = r.idopcion inner join rol c on r.idrol = c.idrol inner join usuario_has_rol h on c.idrol = h.idrol where idusuario = ? order by 2; ";     
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idUsuario);
			log.info(">>" + pstm);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Opcion();
				obj.setIdOpcion(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setRuta(rs.getString(3));
				obj.setEstado(rs.getInt(4));
				obj.setTipo(rs.getInt(5));
				data.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return data;
	}
	
}
