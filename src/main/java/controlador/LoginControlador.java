package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsuarioDAO;
import entity.Opcion;
import entity.Usuario;
import fabricas.Fabrica;

@WebServlet("/login")
public class LoginControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String user = request.getParameter("loginuser");
		String clave = request.getParameter("loginpassword");

		Usuario bean = new Usuario();
		bean.setLogin(user);
		bean.setPassword(clave);
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		
		try {
				
			Usuario usuario = dao.login(bean);
			//Cuando el usuario no existe
			if(usuario == null){
				String mensaje ="El usuario no existe";
				request.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				
			}else{
				//Acceder a la session
				HttpSession session = request.getSession();
				
				//Se guarda en session los datos de usuario
				//La session es un objeto que dura un determinado tiempo en el servidor
				session.setAttribute("objUsuario", usuario);
				
				//Se obtiene los menus del usuario logeado y se guarda en la memoria sesion
				List<Opcion> menus = dao.traerEnlacesDeUsuario(usuario.getIdUsuario());
				session.setAttribute("objMenus", menus);
				
				//Cuando el usuario existe
				response.sendRedirect("intranetHome.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}








