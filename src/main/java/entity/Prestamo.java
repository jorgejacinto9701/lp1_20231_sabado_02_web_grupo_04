package entity;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Prestamo {

	private int idPrestamo;
	private Date fechaPrestamo;
	private Date fechaDevolucion;
	private Usuario usuario;
	private List<PrestamoHasLibro> detallesPrestamos;

}
