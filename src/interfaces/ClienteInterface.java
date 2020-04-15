package interfaces;

import java.util.ArrayList;
import java.util.List;

import beans.Cliente;

public interface ClienteInterface {

	public int CrearCliente(Cliente c);

	public ArrayList<Cliente> ListarCliente();

}
