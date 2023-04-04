package entity;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class DevolucionHasLibro {

	private DevolucionHasLibroPK devolucionHasProductoPK;
	private Devolucion devolucion;
	private Libro libro;

	

}
