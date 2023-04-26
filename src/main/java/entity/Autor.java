package entity;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Autor {
  

	private int idAutor;
	private String nombres;
	private String apellidos;
	private Date fechaNacimiento;
	private String telefono;
	private Timestamp fechaRegistro;
	private int estado;
	private Grado grado;
	

   
}
