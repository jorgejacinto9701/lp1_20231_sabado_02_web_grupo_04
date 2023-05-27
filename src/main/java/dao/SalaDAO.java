package dao;

import java.util.List;

import entity.Sala;

public interface SalaDAO {
	
	
	public abstract int insertaSala(Sala obj);
	public abstract List<Sala> listaSala(String filtro);
	public abstract int eliminaSala(int idSala);
	public abstract int actualizaSala(Sala obj);
	public abstract Sala buscaSala(int idSala);

}

