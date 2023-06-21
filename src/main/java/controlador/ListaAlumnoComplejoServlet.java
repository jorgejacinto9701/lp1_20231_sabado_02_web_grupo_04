package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.google.gson.Gson;

import dao.AlumnoDAO;
import entity.Alumno;
import fabricas.Fabrica;

@WebServlet("/listaAlumnoComplejo")
public class ListaAlumnoComplejoServlet extends HttpServlet{

	
	private static final long serialVersionUID = 1L;
	
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AlumnoDAO  dao = fabrica.getAlumnoDAO();
		
		String nombre = req.getParameter("nombre");
		String pais = req.getParameter("pais");
		String estado = req.getParameter("estado");
		String vfechaInicio = req.getParameter("fechaInicio");
		String vfechaFin = req.getParameter("fechaFin");
		
		if(vfechaInicio.equals("")) {
			vfechaInicio = "1900-01-01";
		}
		if(vfechaFin.equals("")) {
			vfechaFin = "2900-01-01";
		}
		
		List<Alumno> lista = dao.listaComplejo(nombre + "%", Integer.valueOf(pais), Integer.valueOf(estado),Date.valueOf(vfechaInicio), Date.valueOf(vfechaFin));
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
		
	}

}
