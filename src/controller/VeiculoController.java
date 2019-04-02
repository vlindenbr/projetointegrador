package controller;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.DAOVeiculo;
import lib.Conexao;
import model.Veiculo;
import model.VeiculoImagem;

public class VeiculoController {

	public static Integer cadastrar(Veiculo veiculo) throws SQLException, ClassNotFoundException {

		Conexao conexao = new Conexao();
		conexao.conecta();

		return DAOVeiculo.cadastrar(conexao, veiculo);
	}

	public static ArrayList<Veiculo> getMeusAnuncios(Integer usuarioId) throws ClassNotFoundException, SQLException {

		Conexao conexao = new Conexao();
		conexao.conecta();

		ArrayList<Veiculo> veiculos = DAOVeiculo.getMeusAnuncios(conexao, usuarioId);

		return veiculos;

	}

	public static ArrayList<Veiculo> getAnuncios(String pesquisa) throws ClassNotFoundException, SQLException {

		Conexao conexao = new Conexao();
		conexao.conecta();

		ArrayList<Veiculo> veiculos = DAOVeiculo.getAnuncios(conexao, pesquisa);

		return veiculos;

	}

	public static void updateById(Veiculo veiculo, Integer id) throws ClassNotFoundException, SQLException {
		Conexao conexao = new Conexao();
		conexao.conecta();

		DAOVeiculo.updateById(conexao, veiculo, id);
	}

	public static Veiculo getVeiculoById(Integer id) throws ClassNotFoundException, SQLException {

		Conexao conexao = new Conexao();
		conexao.conecta();

		return DAOVeiculo.getById(conexao, id);

	}

	public static ArrayList<VeiculoImagem> getImagensByVeiculoId(Integer id)
			throws ClassNotFoundException, SQLException {

		Conexao conexao = new Conexao();
		conexao.conecta();

		return DAOVeiculo.getImagensByVeiculoId(conexao, id);

	}

	public static String getImagemByVeiculoId(Integer id) throws ClassNotFoundException, SQLException {

		Conexao conexao = new Conexao();
		conexao.conecta();

		return DAOVeiculo.getImagemByVeiculoId(conexao, id);

	}

	public static void cadastrarImagem(VeiculoImagem imagem) throws ClassNotFoundException, SQLException {
		Conexao conexao = new Conexao();
		conexao.conecta();

		DAOVeiculo.cadastrarImagem(conexao, imagem);

	}

	public static String getImagemById(Integer parseInt) throws ClassNotFoundException, SQLException {
		Conexao conexao = new Conexao();
		conexao.conecta();

		return DAOVeiculo.getImagemById(conexao, parseInt);
	}

}
