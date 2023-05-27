package entity;



import java.sql.Date;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Sala {

	private int idSala;
	private String numero;
	private int piso;
	private int numAlumnos;
	private String recursos;
	private Date fechaRegistro;
	private int estado;
	private Sede sede;
	
}
