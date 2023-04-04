package entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Revista {

	private int idRevista;
	private String nombre;
	private String frecuencia;
	private Date fechaCreacion;
	private Date fechaRegistro;
	private int estado;
	private Modalidad mmodalidad;

}
