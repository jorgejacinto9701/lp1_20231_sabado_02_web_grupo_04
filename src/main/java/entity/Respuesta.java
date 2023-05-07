package entity;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Respuesta {

	private String mensaje;
	private List<?> datos;
	
}
