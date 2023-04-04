package entity;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class PrestamoHasLibro {

	private PrestamoHasLibroPK prestamoHasProductoPK;
	private Prestamo prestamo;
	private Libro libro;

	

}
