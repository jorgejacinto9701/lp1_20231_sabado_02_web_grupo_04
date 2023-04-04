package entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Tesis {
  

	private int idTesis;
	private String titulo;
	private String tema;
	private Date fechaCreacion;
	private Date fechaRegistro;
	private int estado;
	private Alumno alumno;
	

   
}
