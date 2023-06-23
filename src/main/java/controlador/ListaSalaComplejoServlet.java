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

import dao.SalaDAO;
import entity.Sala;
import fabricas.Fabrica;

@WebServlet("/listaSalaComplejoServlet")
public class ListaSalaComplejoServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String numero = req.getParameter("numero");
		String sede = req.getParameter("sede");
		String estado = req.getParameter("estado");
		String recursos = req.getParameter("recursos");
		
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			SalaDAO  dao = fabrica.getSalaDAO();
			
		List<Sala> lstSala = dao.listaSalaComplejoServlet(
				numero+"%", 
				Integer.parseInt(sede),
				Integer.parseInt(estado), 
				recursos);
			
		Gson gson = new Gson();
		
		String json = gson.toJson(lstSala);

		resp.setContentType("application/json;charset=UTF-8");
			
		PrintWriter out = resp.getWriter(); out.println(json);
	}
}
