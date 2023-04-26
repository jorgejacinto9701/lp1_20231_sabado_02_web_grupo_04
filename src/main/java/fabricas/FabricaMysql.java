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
import dao.impl.MySqlAlumnoDAO;
import dao.impl.MySqlAutorDAO;
import dao.impl.MySqlDevolucionDAO;
import dao.impl.MySqlEditorialDAO;
import dao.impl.MySqlGradoDAO;
import dao.impl.MySqlLibroDAO;
import dao.impl.MySqlPrestamoDAO;
import dao.impl.MySqlProveedorDAO;
import dao.impl.MySqlRevistaDAO;
import dao.impl.MySqlSalaDAO;
import dao.impl.MySqlSeparacionDAO;
import dao.impl.MySqlTesisDAO;
import dao.impl.MySqlUsuarioDAO;

public class FabricaMysql extends Fabrica {

	public UsuarioDAO getUsuarioDAO() {			return new MySqlUsuarioDAO(); 	}
	public AlumnoDAO getAlumnoDAO() {			return new MySqlAlumnoDAO(); 	}
	
	public TesisDAO getTesisDAO() {				return new MySqlTesisDAO(); 	}
	public SalaDAO getSalaDAO() {				return new MySqlSalaDAO(); 	}
	public RevistaDAO getRevistaDAO() {			return new MySqlRevistaDAO(); 	}
	public LibroDAO getLibroDAO() {				return new MySqlLibroDAO(); 	}
	public ProveedorDAO getProveedorDAO() {		return new MySqlProveedorDAO(); 	}
	public EditorialDAO getEditorialDAO() {		return new MySqlEditorialDAO(); 	}
	public PrestamoDAO getPrestamoDAO() {		return new MySqlPrestamoDAO(); 	}
	public SeparacionDAO getSeparacionDAO() {	return new MySqlSeparacionDAO(); 	}
	public DevolucionDAO getDevolucionDAO() {	return new MySqlDevolucionDAO(); 	}
	
	public GradoDAO getGrado() {
		
		return new MySqlGradoDAO();
	}
	
	
	public AutorDAO getAutor() {	
		
		return new MySqlAutorDAO(); 	
	}
	

	
}
