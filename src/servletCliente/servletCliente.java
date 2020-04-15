package servletCliente;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Cliente;
import dao.MYSQLCliente;
import interfaces.ClienteInterface;

/**
 * Servlet implementation class servletCliente
 */
@WebServlet({"/clienteController","/clienteListar","/clienteNuevo"})
public class servletCliente extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	ClienteInterface clidao = new MYSQLCliente();
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getContextPath().equals("clienteListar"); 
		String opcion = request.getParameter("opcion");
		switch (opcion) {
		case "lis":
			lista(request, response);
			break;
		case "reg":
			registro(request, response);
			break;

		}
	}

	private void registro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("entro al metodo registro");
		String mensaje, url;
		String nombre = request.getParameter("txtNombre");
		String apellido = request.getParameter("txtApellido");
		String email = request.getParameter("txtEmail");
		String fecha = request.getParameter("txtFecha");

		Cliente cli = new Cliente();

		cli.setNombre(nombre);
		cli.setApellido(apellido);
		cli.setEmail(email);
		cli.setFecha(fecha);

		//MYSQLCliente dao = new MYSQLCliente(); // DAOCliente
		int i = clidao.CrearCliente(cli);
		System.out.println(cli);

		if (i == 0) {
			request.setAttribute("cliente", cli);
			mensaje = "*** ERROR AL REGISTRAR ***";
			url = "form.jsp";
		} else {
			request.setAttribute("cliente", new Cliente());
			mensaje = "REGISTRÓ CON EXITO";
			url = "form.jsp";
		}
		
		request.setAttribute("aviso", mensaje);
		
		request.getRequestDispatcher(url).forward(request, response);

	}

	private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entro al Servlet");
		String mensaje = "";

		// Cliente cli =
		ArrayList<Cliente> lista =clidao.ListarCliente();

		if (lista.isEmpty()) {
			mensaje = "***error en el Listar***";
			System.out.println("error");

		} else {
			mensaje = "***Listado correctamente***";
			System.out.println("se listo");

		}

		request.setAttribute("aviso", mensaje);
		request.setAttribute("listadito", lista);// .getSession()
		request.getRequestDispatcher("listar.jsp").forward(request, response);
	}

}
