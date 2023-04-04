package entity;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RolHasOpcionPK implements Serializable {

	private static final long serialVersionUID = 1L;
	private int idRol;
	private int idOpcion;

}
