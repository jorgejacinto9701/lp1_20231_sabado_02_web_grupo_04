package entity;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Devolucion {

	private int idDevolucion;
	private Date fechaRegistro;
	private Date fechaDevolucion;
	private int estado;
	private Usuario usuario;
	private List<DevolucionHasLibro> detallesDevolucion;

}
