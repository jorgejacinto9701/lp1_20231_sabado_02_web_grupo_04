package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.SalaDAO;
import entity.Respuesta;
import entity.Sala;
import entity.Sede;
import fabricas.Fabrica;

@WebServlet("/intranetCrudSala")
public class CrudSalaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(CrudSalaServlet.class.getName());

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudSalaServlet >> service");
		String vmetodo = req.getParameter("metodo");
		switch (vmetodo) {
		case "lista":
			lista(req, resp);
			break;
		case "inserta":
			inserta(req, resp);
			break;
		case "actualiza":
			actualiza(req, resp);
			break;
		case "eLogica":
			eliminacionLogica(req, resp);
			break;
		case "eFisica":
			eliminacionFisica(req, resp);
			break;
		}
	}

	protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudSalaServlet >> lista");

		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		SalaDAO dao = fabrica.getSalaDAO();

		String filtro = req.getParameter("filtro");
		List<Sala> lista = dao.listaSala(filtro + "%");

		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);
	}

	protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 		
		log.info(">> CrudSalaServlet >> inserta");
		
		String vnumero = req.getParameter("numero");
		String vpiso = req.getParameter("piso");
		String vnumalumnos = req.getParameter("numAlumnos");
		String vrecursos = req.getParameter("recursos");
		String vsede = req.getParameter("sede");

		Sede objSede = new Sede();
		objSede.setIdSede(Integer.parseInt(vsede));
		
		Sala objSala = new Sala();
		objSala.setNumero(vnumero);
		objSala.setPiso(Integer.parseInt(vpiso));
		objSala.setNumAlumnos(Integer.parseInt(vnumalumnos));
		objSala.setRecursos(vrecursos);
		objSala.setSede(objSede);
		objSala.setEstado(1);
		objSala.setFechaRegistro(new Date(System.currentTimeMillis()));
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		SalaDAO dao = fabrica.getSalaDAO();
	
		int insertados = dao.insertaSala(objSala);
		List<Sala> lista = dao.listaSala("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Registro exitoso");
		}else {
			objRespuesta.setMensaje("Error en el registro");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

	protected void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudSalaServlet >> actualiza");
		
		String vidSala = req.getParameter("idSala");
		String vnumero = req.getParameter("numero");
		String vpiso = req.getParameter("piso");
		String vnumalumnos = req.getParameter("numAlumnos");
		String vrecursos = req.getParameter("recursos");
		String vsede = req.getParameter("sede");
		String vestado = req.getParameter("estado");
		
		Sede objSede = new Sede();
		objSede.setIdSede(Integer.parseInt(vsede));
		
		Sala objSala = new Sala();
		objSala.setIdSala(Integer.parseInt(vidSala));
		objSala.setNumero(vnumero);
		objSala.setPiso(Integer.parseInt(vpiso));
		objSala.setNumAlumnos(Integer.parseInt(vnumalumnos));
		objSala.setRecursos(vrecursos);
		objSala.setEstado(Integer.parseInt(vestado));
		objSala.setSede(objSede);
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		SalaDAO dao = fabrica.getSalaDAO();
	
		int insertados = dao.actualizaSala(objSala);
		List<Sala> lista = dao.listaSala("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Actualización exitosa");
		}else {
			objRespuesta.setMensaje("Error al actualizar");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

	protected void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		log.info(">> CrudClienteServlet >> eliminacionLogica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		SalaDAO dao = fabrica.getSalaDAO();
	
		String idSala = req.getParameter("idSala");
		
		Sala objSala = dao.buscaSala(Integer.parseInt(idSala));
		int estadoNuevo = objSala.getEstado() == 0 ? 1 : 0;
		objSala.setEstado(estadoNuevo);
		
		dao.actualizaSala(objSala);
		List<Sala> lista = dao.listaSala("%");
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
	}

	protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		log.info(">> CrudClienteServlet >> eliminacionFisica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		SalaDAO dao = fabrica.getSalaDAO();
	
		String idSala = req.getParameter("idSala");
		
		int eliminados = dao.eliminaSala(Integer.parseInt(idSala));
		List<Sala> lista = dao.listaSala("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (eliminados > 0) {
			objRespuesta.setMensaje("Eliminación exitosa");
		}else {
			objRespuesta.setMensaje("Error al eliminar");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

}