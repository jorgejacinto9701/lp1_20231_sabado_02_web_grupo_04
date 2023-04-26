package fabricas;

import dao.AlumnoDAO;
import dao.AutorDAO;
import dao.DevolucionDAO;
import dao.EditorialDAO;
import dao.GradoDAO;
import dao.LibroDAO;
import dao.PrestamoDAO;
import dao.ProveedorDAO;
import dao.RevistaDAO;
import dao.SalaDAO;
import dao.SeparacionDAO;
import dao.TesisDAO;
import dao.UsuarioDAO;


public abstract class Fabrica {

	public static final int MYSQL = 1;
	public static final int SQLSERVER = 2;

	public abstract UsuarioDAO getUsuarioDAO();
	public abstract AlumnoDAO  getAlumnoDAO();
	public abstract AutorDAO getAutor();
	public abstract EditorialDAO getEditorialDAO();
	public abstract LibroDAO getLibroDAO();
	public abstract ProveedorDAO getProveedorDAO();
	public abstract RevistaDAO getRevistaDAO();
	public abstract SalaDAO getSalaDAO();
	public abstract TesisDAO getTesisDAO();
	public abstract DevolucionDAO getDevolucionDAO();
	public abstract PrestamoDAO getPrestamoDAO();
	public abstract SeparacionDAO getSeparacionDAO();
	public abstract GradoDAO getGrado();
	
	
	public static Fabrica getFabrica(int tipo){
		Fabrica salida = null;
		switch(tipo){
			case MYSQL: 
				salida = new FabricaMysql();
				break;
			
		}
		return salida;
	}
	
}
