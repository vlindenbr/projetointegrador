package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import lib.Conexao;
import model.Veiculo;
import model.VeiculoImagem;

public class DAOVeiculo {

	public static Integer cadastrar(Conexao conexao, Veiculo veiculo) throws SQLException {
		String sql = "insert into veiculo ( usuario_id, nome, placa, tipo, quilometragem, ano, valor, observacoes, situacao ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

		ps.setInt(1, veiculo.getUsuarioId());
		ps.setString(2, veiculo.getNome());
		ps.setString(3, veiculo.getPlaca());
		ps.setInt(4, veiculo.getTipo());
		ps.setInt(5, veiculo.getQuilometragem());
		ps.setInt(6, veiculo.getAno());
		ps.setDouble(7, veiculo.getValor());
		ps.setString(8, veiculo.getObservacoes());
		ps.setInt(9, veiculo.getSituacao());
//		ps.setInt(10, veiculo.getCombustivel());
		

		ps.executeUpdate();

		Integer id = null;

		ResultSet generatedKeys = ps.getGeneratedKeys();
		if (generatedKeys.next()) {
			id = generatedKeys.getInt(1);
		}

		return id;

	}

	public static ArrayList<Veiculo> getMeusAnuncios(Conexao conexao, Integer uId) {

		ArrayList<Veiculo> veiculos = new ArrayList<Veiculo>();

		try {
			String sql = "select id, usuario_id, nome, placa, tipo, quilometragem, ano, valor, observacoes, situacao from veiculo where usuario_id = ? order by situacao = 1, nome";
			PreparedStatement ps = conexao.prepareStatement(sql);

			ps.setInt(1, uId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Integer id = rs.getInt("id");
				Integer usuarioId = rs.getInt("usuario_id");
				String nome = rs.getString("nome");
				String placa = rs.getString("placa");
				Integer tipo = rs.getInt("tipo");
				Integer quilometragem = rs.getInt("quilometragem");
				Integer ano = rs.getInt("ano");
				Double valor = rs.getDouble("valor");
				String observacoes = rs.getString("observacoes");
				Integer situacao = rs.getInt("situacao");

				veiculos.add(new Veiculo(id, usuarioId, nome, placa, tipo, quilometragem, ano, valor, observacoes,
						situacao));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return veiculos;
	}

	public static ArrayList<Veiculo> getAnuncios(Conexao conexao, String pesquisa) {

		ArrayList<Veiculo> veiculos = new ArrayList<Veiculo>();

		String filtro = "";
		if (pesquisa != null) {
			filtro = "and lower(nome) like lower(?)";
		}

		try {
			String sql = "select id, usuario_id, nome, placa, tipo, quilometragem, ano, valor, observacoes, situacao from veiculo where situacao = 1 "
					+ filtro + " order by nome";
			PreparedStatement ps = conexao.prepareStatement(sql);

			if (pesquisa != null) {
				ps.setString(1, "%" + pesquisa + "%");
			}

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Integer id = rs.getInt("id");
				Integer usuarioId = rs.getInt("usuario_id");
				String nome = rs.getString("nome");
				String placa = rs.getString("placa");
				Integer tipo = rs.getInt("tipo");
				Integer quilometragem = rs.getInt("quilometragem");
				Integer ano = rs.getInt("ano");
				Double valor = rs.getDouble("valor");
				String observacoes = rs.getString("observacoes");
				Integer situacao = rs.getInt("situacao");

				veiculos.add(new Veiculo(id, usuarioId, nome, placa, tipo, quilometragem, ano, valor, observacoes,
						situacao));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return veiculos;
	}

	public static Veiculo getById(Conexao conexao, Integer cId) {
		Veiculo veiculo = null;

		try {
			String sql = "select id, usuario_id, nome, placa, tipo, quilometragem, ano, valor, observacoes, situacao from veiculo where id = ?";
			PreparedStatement ps = conexao.prepareStatement(sql);

			ps.setInt(1, cId);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Integer id = rs.getInt("id");
				Integer usuarioId = rs.getInt("usuario_id");
				String nome = rs.getString("nome");
				String placa = rs.getString("placa");
				Integer tipo = rs.getInt("tipo");
				Integer quilometragem = rs.getInt("quilometragem");
				Integer ano = rs.getInt("ano");
				Double valor = rs.getDouble("valor");
				String observacoes = rs.getString("observacoes");
				Integer situacao = rs.getInt("situacao");

				veiculo = new Veiculo(id, usuarioId, nome, placa, tipo, quilometragem, ano, valor, observacoes,
						situacao);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return veiculo;
	}

	public static String getImagemByVeiculoId(Conexao conexao, Integer cId) {
		String imagem = null;

		try {
			String sql = "select caminho from veiculo_imagem where veiculo_id = ? and id in (select max(id) from veiculo_imagem group by veiculo_id)";
			PreparedStatement ps = conexao.prepareStatement(sql);

			ps.setInt(1, cId);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				imagem = rs.getString("caminho");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return imagem;
	}

	public static void updateById(Conexao conexao, Veiculo veiculo, Integer id) throws SQLException {
		String sql = "update veiculo set nome = ?, placa = ?, tipo = ?, quilometragem = ?, ano = ?, valor = ?, observacoes = ?, situacao = ? where id = ?";
		PreparedStatement ps = conexao.prepareStatement(sql);

		ps.setString(1, veiculo.getNome());
		ps.setString(2, veiculo.getPlaca());
		ps.setInt(3, veiculo.getTipo());
		ps.setInt(4, veiculo.getQuilometragem());
		ps.setInt(5, veiculo.getAno());
		ps.setDouble(6, veiculo.getValor());
		ps.setString(7, veiculo.getObservacoes());
		ps.setInt(8, veiculo.getSituacao());
		ps.setInt(9, id);

		ps.execute();
	}

	public static void cadastrarImagem(Conexao conexao, VeiculoImagem imagem) throws SQLException {

		String sql = "insert into veiculo_imagem ( veiculo_id, caminho ) values (?, ? )";
		PreparedStatement ps = conexao.prepareStatement(sql);

		ps.setInt(1, imagem.getVeiculoId());
		ps.setString(2, imagem.getCaminho());

		ps.execute();

	}

	public static ArrayList<VeiculoImagem> getImagensByVeiculoId(Conexao conexao, Integer cId) {
		ArrayList<VeiculoImagem> imagens = new ArrayList<VeiculoImagem>();

		try {
			String sql = "select id, veiculo_id, caminho from veiculo_imagem where veiculo_id = ?";
			PreparedStatement ps = conexao.prepareStatement(sql);

			ps.setInt(1, cId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Integer id = rs.getInt("id");
				Integer veiculoId = rs.getInt("veiculo_id");
				String caminho = rs.getString("caminho");

				imagens.add(new VeiculoImagem(id, veiculoId, caminho));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return imagens;
	}

	public static String getImagemById(Conexao conexao, Integer parseInt) {
		String imagem = null;

		try {
			String sql = "select caminho from veiculo_imagem where id = ?";
			PreparedStatement ps = conexao.prepareStatement(sql);

			ps.setInt(1, parseInt);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				imagem = rs.getString("caminho");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return imagem;
	}
}
