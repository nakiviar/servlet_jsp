package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import beans.Cliente;
import interfaces.ClienteInterface;
import util.MySQLConexion;

public class MYSQLCliente implements ClienteInterface {
	@Override
	public ArrayList<Cliente> ListarCliente() {
		ArrayList<Cliente> listado = new ArrayList<Cliente>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String SQL = "call listacliente()";
			pst = con.prepareStatement(SQL);//callableStatement -StoreProcedure
			rs = pst.executeQuery();
			while (rs.next()) {
				Cliente cli = new Cliente();
				cli.setId(rs.getInt(1));
				cli.setNombre(rs.getString(2));
				cli.setApellido(rs.getString(3));
				cli.setEmail(rs.getString(4));
				cli.setFecha(rs.getString(5));
				listado.add(cli);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error en el listado" + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
			System.out.println("llama la lista");
		}
		return listado;
	}

	@Override
	public int CrearCliente(Cliente c) {
		int rs = 0;
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = MySQLConexion.getConexion();
			String SQL = "call crearcliente(?,?,?,?)";
			
			pst = con.prepareStatement(SQL);
			
			pst.setString(1, c.getNombre());
			pst.setString(2, c.getApellido());
			pst.setString(3, c.getEmail());
			pst.setString(4, c.getFecha());

			rs = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("error al actualizar:" + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return rs;
	}
}