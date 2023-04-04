package entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Libro {

	private int idLibro;
	private String titulo;
	private int anio;
	private String serie;
	private Date fechaRegistro;
	private int estado;
	private Categoria categoria;

}
