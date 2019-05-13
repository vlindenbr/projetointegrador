package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import lib.Conexao;
import model.Usuario;

public class DAOUsuario {

	public static boolean cadastrar(Conexao conexao, Usuario usuario) throws SQLException {
		String sql = "insert into usuario ( nome, senha, email, telefone, cidade) values (?, ?, ?, ?, ?)";
		
		boolean status = false;
		
		try {
			PreparedStatement ps = conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	
			ps.setString(1, usuario.getNome());
			ps.setString(2, usuario.getSenha());
			ps.setString(3, usuario.getEmail());
			ps.setString(4, usuario.getTelefone());
			ps.setString(5, usuario.getCidade());
			
			status = ps.execute();
	
			} catch (SQLException e) {
				System.out.println("Houve erro na execuзгo do comando insert");
				System.out.println(e.getMessage());
				System.out.println("Cуdigo de erro: " + e.getSQLState());
			}
		return status;
		}
		
	
	public static Usuario consultar(Conexao conexao, String email, String senha) throws SQLException {
		String sql = "select * from usuario where email=? and senha=?";
	
		
		try {
			PreparedStatement ps = conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	
			ps.setString(1, email);
			ps.setString(2, senha);
			
			ResultSet status = ps.executeQuery();
			
			Usuario user = new Usuario("","","","","");
			
			if(status.next()) {
				user.setCidade(status.getString("cidade"));
				user.setTelefone(status.getString("telefone"));
				user.setEmail(status.getString("email"));
				user.setSenha(status.getString("senha"));
				user.setNome(status.getString("nome"));
				user.setId(status.getInt("id"));
				System.out.println("ID --> " + status.getInt("id"));
				return user;
				}
	
			} catch (SQLException e) {
				System.out.println("Houve erro na execucao do comando insert");
				System.out.println(e.getMessage());
				System.out.println("Codigo de erro: " + e.getSQLState());
			}
		
		return null;
		}	
}
