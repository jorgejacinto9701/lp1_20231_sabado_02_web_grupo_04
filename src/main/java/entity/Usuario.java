package entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Usuario {

	private int idUsuario;
	private String nombres;
	private String apellidos;
	private String dni;
	private String login;
	private String password;
	private String correo;
	private Date fechaRegistro;
	private Date fechaNacimiento;
	
	public String getNombreCompleto() {
		return nombres.concat(" ").concat(apellidos);
	}
}
