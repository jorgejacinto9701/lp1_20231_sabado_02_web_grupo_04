package entity;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UsuarioHasRolPK implements Serializable {

	private static final long serialVersionUID = 1L;

	private int idUsuario;
	private int idRol;

}
