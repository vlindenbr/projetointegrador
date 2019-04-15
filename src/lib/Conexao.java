package lib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexao {

	private Connection cnx;

	private String driverJDBC = "com.mysql.jdbc.Driver";
	private String dbUrl = "jdbc:mysql://localhost/carangos";
	private String nomeUsuario = "root";
	private String senhaUsuario = "!tca123";

	public void conecta() throws ClassNotFoundException, SQLException {

		// System.out.println("Carregando driver JDBC");
		Class.forName(driverJDBC);

		// System.out.println("Conectando com o Banco...");
		cnx = DriverManager.getConnection(dbUrl, nomeUsuario, senhaUsuario);

		// System.out.println("Parabéns, você está conectado :)");

	}

	public Statement createStatement() throws SQLException {
		return cnx.createStatement();
	}

	public PreparedStatement prepareStatement(String sql) throws SQLException {
		return cnx.prepareStatement(sql);
	}

	public PreparedStatement prepareStatement(String sql, int prm) throws SQLException {
		return cnx.prepareStatement(sql, prm);
	}

}
