package entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UsuarioHasRol {

	private UsuarioHasRolPK usuarioHasRolPk;
	private Usuario usuario;
	private Rol rol;

}
