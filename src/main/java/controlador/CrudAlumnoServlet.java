package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.AlumnoDAO;
import entity.Alumno;
import entity.Pais;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/crudAlumno")
public class CrudAlumnoServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(CrudAlumnoServlet.class.getName());
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("CrudAlumnoServlet >> service");
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

	private void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        log.info("CrudAlumnoServlet >> lista");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AlumnoDAO dao = fabrica.getAlumnoDAO();
		
		String filtro = req.getParameter("filtro");
		List<Alumno> lista = dao.listaAlumno(filtro+"%");
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
		
	}
	
	private void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        log.info("CrudAlumnoServlet >> inserta");
		
		String vnombres = req.getParameter("nombres");
		String vapellidos = req.getParameter("apellidos");
		String vtelefono = req.getParameter("telefono");
		String vdni = req.getParameter("dni");
		String vcorreo = req.getParameter("correo");
		String vfechaNacimiento = req.getParameter("fechaNacimiento");
		String vpais = req.getParameter("pais");

		Pais objPais = new Pais();
		objPais.setIdPais(Integer.parseInt(vpais));
		
		Alumno objAlumno = new Alumno();
		objAlumno.setNombres(vnombres);
		objAlumno.setApellidos(vapellidos);
		objAlumno.setTelefono(vtelefono);
		objAlumno.setDni(vdni);
		objAlumno.setCorreo(vcorreo);
		objAlumno.setFechaNacimiento(Date.valueOf(vfechaNacimiento));
		objAlumno.setPais(objPais);
		objAlumno.setEstado(1);
		objAlumno.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AlumnoDAO dao = fabrica.getAlumnoDAO();
	
		int insertados = dao.insertaAlumno(objAlumno);
		List<Alumno> lista = dao.listaAlumno("%");
		
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
	
	private void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		log.info(">> CrudAlumnoServlet >> actualiza");
		
		String vidAlumno = req.getParameter("idAlumno");
		String vnombres = req.getParameter("nombres");
		String vapellidos = req.getParameter("apellidos");
		String vtelefono = req.getParameter("telefono");
		String vdni = req.getParameter("dni");
		String vcorreo = req.getParameter("correo");
		String vfechaNacimiento = req.getParameter("fechaNacimiento");
		String vestado = req.getParameter("estado");
		String vpais = req.getParameter("pais");
						
		Pais objPais = new Pais();
		objPais.setIdPais(Integer.parseInt(vpais));
		
		Alumno objAlumno = new Alumno();
		objAlumno.setIdAlumno(Integer.parseInt(vidAlumno));
		objAlumno.setNombres(vnombres);
		objAlumno.setApellidos(vapellidos);
		objAlumno.setTelefono(vtelefono);
		objAlumno.setDni(vdni);
		objAlumno.setCorreo(vcorreo);
		objAlumno.setFechaNacimiento(Date.valueOf(vfechaNacimiento));
		objAlumno.setEstado(Integer.parseInt(vestado));
		objAlumno.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		objAlumno.setPais(objPais);
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AlumnoDAO dao = fabrica.getAlumnoDAO();
	
		int insertados = dao.actualizaAlumno(objAlumno);
		List<Alumno> lista = dao.listaAlumno("%");
		
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
	
	private void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		log.info("CrudAlumnoServlet >> eliminacionLogica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AlumnoDAO dao = fabrica.getAlumnoDAO();
	
		String idAlumno = req.getParameter("idAlumno");
		
		Alumno objAlumno = dao.buscaAlumno(Integer.parseInt(idAlumno));
		int estadoNuevo = objAlumno.getEstado() == 0 ? 1 : 0;
		objAlumno.setEstado(estadoNuevo);
		
		dao.actualizaAlumno(objAlumno);
		List<Alumno> lista = dao.listaAlumno("%");
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	
	private void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        log.info("CrudAlumnoServlet >> eliminacionFisica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AlumnoDAO dao = fabrica.getAlumnoDAO();
		
		String idAlumno = req.getParameter("idAlumno");
		int eliminados = dao.eliminaAlumno(Integer.parseInt(idAlumno));
		List<Alumno> lista = dao.listaAlumno("%");
		
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
