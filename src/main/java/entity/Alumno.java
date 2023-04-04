package entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Alumno {
  

	private int idAlumno;
	private String nombres;
	private String apellidos;
	private String telefono;
	private String dni;
	private String correo;
	private Date fechaNacimiento;
	private Date fechaRegistro;
	private int estado;
	private Pais pais;
	

   
}
