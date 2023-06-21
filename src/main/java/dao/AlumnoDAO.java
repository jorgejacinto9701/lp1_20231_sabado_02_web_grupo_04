package dao;

import java.sql.Date;
import java.util.List;

import entity.Alumno;

public interface AlumnoDAO {
	//Consulta
	public abstract List<Alumno> listaComplejo(String nombre, int idPais, int idEstado, Date fecInicio, Date fecFin);

	
	//CRUD
	public abstract int insertaAlumno(Alumno obj);
	public abstract List<Alumno> listaAlumno(String filtro);
	public abstract int eliminaAlumno(int idAlumno); 
	public abstract int actualizaAlumno(Alumno obj);
	public abstract Alumno buscaAlumno(int idAlumno);
}

