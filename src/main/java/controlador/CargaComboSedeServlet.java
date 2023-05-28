package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.SedeDAO;
import entity.Sede;
import fabricas.Fabrica;

@WebServlet("/cargaSede")
public class CargaComboSedeServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		SedeDAO dao = fabrica.getSede();
	
		List<Sede> lista = dao.listaSede();
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

}
