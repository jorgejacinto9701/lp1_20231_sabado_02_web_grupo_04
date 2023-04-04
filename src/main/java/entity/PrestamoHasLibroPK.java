package entity;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class PrestamoHasLibroPK  implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int idPrestamo;
	private int idLibro;

}
