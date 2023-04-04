package entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Proveedor {

	private int idProveedor;	
	private String razonsocial;	
	private String ruc;
	private String direccion;	
	private String celular;	
	private String contacto;
	private int estado;
	private Date fechaRegistro;
	private Pais pais;
	
}
