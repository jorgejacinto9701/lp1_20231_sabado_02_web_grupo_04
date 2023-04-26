package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.AutorDAO;
import entity.Autor;
import entity.Grado;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/registraAutor")
public class AutorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vnombre = req.getParameter("nombre");
			String vapellido = req.getParameter("apellido");
			String vfecha = req.getParameter("fecha");
			String vtelefono = req.getParameter("telefono");
			String vgrado = req.getParameter("grado");
			
			
			Grado objGrado = new Grado();
			objGrado.setIdGrado(Integer.parseInt(vgrado));
			
			
			Autor objAutor = new Autor();
			objAutor.setNombres(vnombre);
			objAutor.setApellidos(vapellido);
			objAutor.setFechaNacimiento(Date.valueOf(vfecha));
			objAutor.setTelefono(vtelefono);
			objAutor.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
			objAutor.setEstado(1);
			objAutor.setGrado(objGrado);
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			AutorDAO dao = fabrica.getAutor();
		
			int insertados = dao.insertaAutor(objAutor);
			
			
			Respuesta objRespuesta = new Respuesta();
			if (insertados > 0) {
				objRespuesta.setMensaje("Registro exitoso");
				
			}else {
				objRespuesta.setMensaje("Error en el registro");
				
			}
			
			Gson gson = new Gson();
			String json = gson.toJson(objRespuesta);
			
			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
	}

}
