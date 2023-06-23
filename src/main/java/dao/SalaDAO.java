package dao;

import java.util.List;


import entity.Sala;

public interface SalaDAO {
	
	//Consulta
	public abstract List<Sala> listaSalaComplejoServlet(String numero,int idSede, int estado, String recursos);
	
	public abstract int insertaSala(Sala obj);
	public abstract List<Sala> listaSala(String filtro);
	public abstract int actualizaSala(Sala obj);
	public abstract int eliminaSala(int idSala);
	public abstract Sala buscaSala(int idSala);
}


