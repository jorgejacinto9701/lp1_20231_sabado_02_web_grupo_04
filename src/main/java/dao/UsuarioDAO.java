package dao;

import java.util.List;

import entity.Opcion;
import entity.Usuario;

public interface UsuarioDAO {
	
	public abstract Usuario  login(Usuario bean) throws Exception;
	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario) throws Exception;
	
}

